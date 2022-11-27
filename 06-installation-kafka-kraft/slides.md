%title: Kafka
%author: xavki


# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* prérequis : création du répertoire de data pour kafka

```
mkdir -p /data/kafka
chown -R kafka:kafka /data/
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* prérequis : création du user kafka

```
groupadd --system kafka
useradd -s /sbin/nologin --system -g kafka kafka
apt install unzip
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* téléchargement de kafka manager & mise en place

```
wget -q https://github.com/yahoo/CMAK/releases/download/3.0.0.6/cmak-3.0.0.6.zip
unzip -qq cmak-3.0.0.6.zip
mv  cmak-3.0.0.6 /opt/kafka_manager
chown -R kafka:kafka /opt/kafka_manager
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & sans Zookeeper (Kraft)

<br>

* création de l'uuid pour la conf du stockage

```
./bin/kafka-storage.sh random-uuid

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
