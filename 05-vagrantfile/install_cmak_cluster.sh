#!/bin/bash
# based on https://gist.github.com/CROSP/0d98ec1d5da389c679025a75260c7599#file-kafka-config-sh

# since our environment is not as dynamic define variables here
KAFKA_MANAGER_HOST="127.0.0.1:9000"
# KAFKA_CLUSTERS is a "double" separated list
#   first comma separated for entries
#   second pound sign separated for associated zookeeper and cluster name
KAFKA_CLUSTERS="kafka1:2181#xavki,kafka2:2181#xavki,kafka3:2181#xavki"


# retry + sleep translates to ~2min of potential startup time
RETRY_COUNT=24
SLEEP_TIME=5

GET_CLUSTER_INFO_URL="$KAFKA_MANAGER_HOST/clusters/cname"


sleep 20s

if [[ -z "${KAFKA_CLUSTERS}" ]] || [[ -z "${KAFKA_MANAGER_HOST}" ]]; then
  echo "Provide all configuration options"
  exit
else
    IFS=',' read -r -a clusters <<< "$KAFKA_CLUSTERS"
    echo "Setting up clusters with default settings"
    # Wait for KAFKA manager
    # Check whether host is available
    retries=0
    while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' $KAFKA_MANAGER_HOST)" != "200" ]] && [[ $retries -lt $RETRY_COUNT ]]; do
        echo "Connecting to $KAFKA_MANAGER_HOST , attempt #$retries"
        retries=$((retries+1))
        sleep $SLEEP_TIME;
    done
    echo "Connected to the Kafka Manager host"
    # Set clusters
    for i in "${clusters[@]}"
    do
        IFS='#' read -r -a clusterinfo <<< "$i"
        address=${clusterinfo[0]}
        name=${clusterinfo[1]}
        echo "Setting up Cluster $address - $name"
        echo "Checking if the cluster already defined"
        effective_url=${GET_CLUSTER_INFO_URL/cname/$name}
        echo "$effective_url"
        result=$(curl -s $effective_url)
        if [[ $result == *"Unknown cluster"* ]]; then
            echo "Creating cluster $address - $name"
            html_result=`curl "http://${KAFKA_MANAGER_HOST}/clusters" \
              -H 'Connection: keep-alive' \
              -H 'Cache-Control: max-age=0' \
              -H "Origin: http://${KAFKA_MANAGER_HOST}" \
              -H 'Content-Type: application/x-www-form-urlencoded' \
              -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
              -H "Referer: http://${KAFKA_MANAGER_HOST}/addCluster" \
              -H 'Accept-Language: en-US,en;q=0.9' \
              --data-raw "name=${name}&zkHosts=${address}/kafka&kafkaVersion=3.1.0&jmxUser=&jmxPass=&tuning.brokerViewUpdatePeriodSeconds=30&tuning.clusterManagerThreadPoolSize=2&tuning.clusterManagerThreadPoolQueueSize=100&tuning.kafkaCommandThreadPoolSize=2&tuning.kafkaCommandThreadPoolQueueSize=100&tuning.logkafkaCommandThreadPoolSize=2&tuning.logkafkaCommandThreadPoolQueueSize=100&tuning.logkafkaUpdatePeriodSeconds=30&tuning.partitionOffsetCacheTimeoutSecs=5&tuning.brokerViewThreadPoolSize=2&tuning.brokerViewThreadPoolQueueSize=1000&tuning.offsetCacheThreadPoolSize=2&tuning.offsetCacheThreadPoolQueueSize=1000&tuning.kafkaAdminClientThreadPoolSize=2&tuning.kafkaAdminClientThreadPoolQueueSize=1000&tuning.kafkaManagedOffsetMetadataCheckMillis=30000&tuning.kafkaManagedOffsetGroupCacheSize=1000000&tuning.kafkaManagedOffsetGroupExpireDays=7&securityProtocol=PLAINTEXT&saslMechanism=DEFAULT&jaasConfig=" \
              --compressed`
            cmd_result=$?
            echo "Cluster has been created"
        else
            echo "Cluster already exists"
        fi
    done
fi

