%title: Kafka
%author: xavki


# KAFKA : Consumer Group & Partitions

<br>

zookeeper_jaas.conf

Server {
   org.apache.zookeeper.server.auth.DigestLoginModule required
   username="admin"
   password="admin-secret"
   user_admin="admin-secret";
};

Client {
   org.apache.zookeeper.server.auth.DigestLoginModule required
   username="admin"
   password="admin-secret";
};


kafka_jaas.conf


KafkaServer {
   org.apache.kafka.common.security.plain.PlainLoginModule required
   username="admin"
   password="admin-secret"
   user_admin="admin-secret";
};

Client {
   org.apache.kafka.common.security.plain.PlainLoginModule required
   username="admin"
   password="admin-secret";
};



server.properties

security.inter.broker.protocol=SASL_PLAINTEXT
sasl.mechanism.inter.broker.protocol=PLAIN
sasl.enabled.mechanisms=PLAIN

authorizer.class.name=kafka.security.auth.SimpleAclAuthorizer
listeners=SASL_PLAINTEXT://localhost:9092
advertised.listeners=SASL_PLAINTEXT://localhost:9092
super.users=User:admin



zookeeper.properties

zookeeper.properties
authProvider.1=org.apache.zookeeper.server.auth.SASLAuthenticationProvider
requireClientAuthScheme=sasl
jaasLoginRenew=3600000


Environment=KAFKA_OPTS="-Djava.security.auth.login.config=/opt/kafka/config/zookeeper_jaas.conf"


Environment=KAFKA_OPTS="-Djava.security.auth.login.config=/opt/kafka/config/kafka_jaas.conf"


producer.properties

security.protocol=SASL_PLAINTEXT
sasl.mechanism=PLAIN
bootstrap.servers=localhost:9092
compression.type=none


consumer.properties

security.protocol=SASL_PLAINTEXT
sasl.mechanism=PLAIN
zookeeper.connect=localhost:2181
zookeeper.connection.timeout.ms=6000
group.id=test-consumer-group





export KAFKA_OPTS="-Djava.security.auth.login.config=/home/username/Documents/kafka_2.11-0.10.1.0/kafka_client_jaas.conf"
./bin/kafka-console-consumer.sh --new-consumer --zookeeper localhost:2181 --topic test-topic --from-beginning --consumer.config=config/consumer.properties  --bootstrap-server=localhost:9092

export KAFKA_OPTS="-Djava.security.auth.login.config=/home/username/Documents/kafka_2.11-0.10.1.0/kafka_client_jaas.conf"
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test-topic --producer.config=config/producer.properties


cmak kafka client
