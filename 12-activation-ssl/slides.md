%title: Kafka
%author: xavki


# KAFKA : Consumer Group & Partitions

<br>

Consommation simple (Exclusive Consumer)

<br>

1- Le Producer créé un message

<br>

2- Le broker utilise topic existant ou créé en auto

<br>

3- Le broker stocke le message alternativement dans les partitions

<br>

4- Un consumer souscrit à un topic

<br>

5- Kafka via/sans Zookeeper transmet l'offset au consumer

---------------------------------------------------------------------------

# KAFKA : Consumer Group & Partitions


Consommation simple (Exclusive Consumer)


7- Le consumer traite le message et l'acquite auprès du broker

<br>

8- L'offset est modifié par le broker dans/sans zookeeper

<br>

9- Le consumer check à fréquence régulière les messages

<br>

10- Un nouveau message arrive... et on recommence à 6-

---------------------------------------------------------------------------

# KAFKA : Consumer Group & Partitions


Consommation à plusieurs consumers

<br>

4- Le consumer souscrit au topic avec un Group ID (groupe1)

<br>

5- Le consumer est affecté aux partitions existantes

<br>

6- Un nouveau consumer souscrit au même topic avec le même Group ID (groupe1)

<br>

7- Les partitions sont réparties entre les 2 consumers

---------------------------------------------------------------------------

# KAFKA : Consumer Group & Partitions


Consommation à plusieurs consumers

<br>

Si plus de consumers que de partitions > le surplus sera au chômage ;)

<br>

Si plus de partitions que de consumers > répartition potentiellement inégale

<br>

Attention : Les partitions avancent chacune à son rythme > pas d'ordre

---------------------------------------------------------------------------

# KAFKA : Consumer Group & Partitions


Partitions :

<br>

	* en partie responsable de la vitesse de consommation (au-delà du nb de consumers)

<br>

	* si changement de nombre attention sur le changement d'ordre (message avec clef)

<br>

	* max de 400k partitions mais attention il ne faut pas en abuser (nb fichiers ouverts)

<br>

	* perte brutale d'un broker, la réélection du leader pour toutes les partitions
		* cela peut prendre du temps et augmenter le downtime

---------------------------------------------------------------------------

# KAFKA : Consumer Group & Partitions


Partitions :

<br>

	* un broker n'utilise qu'un thread pour répliquer vers les autres brokers
		* si trop de partition le temps de latence est plus long
		* un message est considéré comme écrit si il est répliqué
		
<br>

	* préconisation : limitation à 100 x nb brokers x nb replicas 

<br>

	* les producers gardent en mémoire les messages par partition un temps donné
		* si plus de partition, plus de messages en mémoire

<br>

	* idem côté consumer qui a plus de partitions à gérer et donc plus de mémoire
