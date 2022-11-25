%title: Kafka
%author: xavki


# KAFKA : Installation Kafka & CMAK

<br>

* Vidéo précédente : installation de Zookeeper

* Objectif : installer kafka & kafka manager

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & CMAK

<br>

* création du répertoire de data pour kafka

```
mkdir -p /data/kafka
chown -R kafka:kafka /data/
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & CMAK

<br>

* activation et démarrage

```
systemctl daemon-reload
systemctl enable zookeeper
systemctl start zookeeper
systemctl enable kafka
systemctl start kafka
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & CMAK

<br>

* prérequis : création du user kafka

```
groupadd --system kafka
useradd -s /sbin/nologin --system -g kafka kafka
apt install unzip
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & CMAK

<br>

* téléchargement de kafka manager & mise en place

```
wget -q https://github.com/yahoo/CMAK/releases/download/3.0.0.6/cmak-3.0.0.6.zip
unzip -qq cmak-3.0.0.6.zip
mv  cmak-3.0.0.6 /opt/kafka_manager
chown -R kafka:kafka /opt/kafka_manager
```

----------------------------------------------------------------------------

# KAFKA : Installation Kafka & CMAK

<br>

* installation du service systemd kafka_manager

<br>

* démarrage

```
systemctl daemon-reload
systemctl start kafka_manager
systemctl enable kafka_manager
```

