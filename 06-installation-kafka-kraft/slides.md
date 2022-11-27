%title: Kafka
%author: xavki


# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* installation de java

```
apt install openjdk-11-jre-headless
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* installation du binaire

```
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
export SCALA_VERSION="2.13"
export KAFKA_VERSION="3.3.1"
export VERSION=${SCALA_VERSION}-${KAFKA_VERSION}
groupadd --system kafka
useradd -s /sbin/nologin --system -g kafka kafka
wget -q https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${VERSION}.tgz
tar xzf kafka_${VERSION}.tgz
mv kafka_${VERSION} /opt/kafka
chown -R kafka:kafka /opt/kafka
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* prérequis : création du user kafka

```
mkdir -p /data/kafka
chown -R kafka:kafka /data/
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* création de l'uuid pour la conf du stockage

```
./bin/kafka-storage.sh random-uuid
# ou cat /proc/sys/kernel/random/uuid | tr -d '-' | base64 | cut -b 1-22
./bin/kafka-storage.sh format -t DvCC5GzASTCpbfNGoKcvtA -c config/kraft/server.properties
```


----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* installation du service systemd

<br>

* démarrage

```
systemctl daemon-reload
systemctl start kafka
systemctl enable kafka
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* test

```
./bin/kafka-topics.sh --create --topic xavki --partitions 3 --replication-factor 3 --bootstrap-server localhost:9092
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --list
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic xavki
```
