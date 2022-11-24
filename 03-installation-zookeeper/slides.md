%title: Kafka
%author: xavki


# KAFKA : Zookeeper

<br>

Zookeeper

	* use-cases générales :
			service registry, stockage de configurations
			cluster management, gestions de locks et concurrences

	* créé à l'origine par Yahoo

	* leader/followers : nombre impaire car élection (attention si 1/2)

<br>

Système distribué

	* replication (3 noeuds mini)

	* scalabilité pour augmenter les performances

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

Zookeeper

	* znode associé à un path / /kafka... similaire à consul k/v
			contient des metadatas : version, timestamp, data length, ACL

	* différents types de znodes :
			* persistents : persistent même si déconnexion du client
			* ephemerals : uniquement tant que le client est connecté
			* sequentials : utiles pour la gestion de sync (path avec incrément)

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

Utilisation dans Kafka

	* non obligatoire avec l'activation de Kraft

	* cluster : perte ou arrêt d'un noeud possible (resync)

	* manager et coordonner les brokers du cluster

	* permet de notifier les consumer et producer
		* élection des leaders
		* perte de serveurs
		* nouveaux serveurs
		* coordonner les consumers
		* stockage de l'offset pour les consumers

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* création du user kafka et du répertoire pour zookeeper

```
groupadd --system kafka
useradd -s /sbin/nologin --system -g kafka kafka
mkdir -p /data/zookeeper
chown -R kafka:kafka /data/
```

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* arrêt du swap

```
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
```

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* installation des binaires kafka et zoo

```
export SCALA_VERSION="2.13"
export KAFKA_VERSION="3.3.1"
export VERSION=${SCALA_VERSION}-${KAFKA_VERSION}
wget -q https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${VERSION}.tgz
tar xzf kafka_${VERSION}.tgz
mv kafka_${VERSION} /opt/kafka
chown -R kafka:kafka /opt/kafka
```

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* modification du fichier de configuration

```
cat /opt/kafka/config/zookeeper.properties
# the directory where the snapshot is stored.
dataDir=/data/zookeeper
# the port at which the clients will connect
clientPort=2181
# setting number of connections to unlimited
maxClientCnxns=0
# keeps a heartbeat of zookeeper in milliseconds
tickTime=2000
# time for initial synchronization
initLimit=10
# how many ticks can pass before timeout
syncLimit=5
# define servers ip and internal ports to zookeeper (change it)
server.1=0.0.0.0:2888:3888
server.2=kafka2:2888:3888
server.3=kafka3:2888:3888
```

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* stockage de l'ID du broker (à changer)

```
echo 1 > /data/zookeeper/myid
```

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* service systemd - cf fichier joint

-----------------------------------------------------------------------------------

# KAFKA : Zookeeper

<br>

* quelques commandes

```
echo srvr | nc 192.168.12.78 2181

create /XavkiZnode "My xavki Znode"
ls
get /XavkiZnode
stat /XavkiZnode
set /XavkiZnode
set /XavkiZnode Data-updated
rmr /XavkiZnode
```
