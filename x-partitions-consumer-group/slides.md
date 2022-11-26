%title: Kafka
%author: xavki


# KAFKA : Consumer Group & Partitions


<br>

Consommation simple = Exclusive Consumer

1- Le Producer créé un message

2- Le broker utilise topic existant ou créé en auto

3- Le broker stocke le message alternativement dans les partitions

4- Un consumer souscrit à un topic

5- Kafka via/sans Zookeeper transmet l'offset au consumer

6- Le message est transmis au consumer

7- Le consumer traite le message et l'acquite auprès du broket

8- L'offset est modifié par le broker dans/sans zookeeper

9- Le consumer check à fréquence régulière les messages

10- Un nouveau message arrive... et on recommence à 6-

<br>

Consommation à plusieurs consumers

4- Le consumer souscrit au topic avec un Group ID (groupe1)

5- Le consumer est affecté aux partitions existantes

6- Un nouveau consumer souscrit au même topic avec le même Group ID (groupe1)

7- Les partitions sont réparties entre les 2 consumers

Si plus de consumers que de partitions > le surplus sera au chômage ;)

Si plus de partitions que de consumer > répartition potentiellement inégale

9- Les partitions avancent chacune à son rythme > pas d'ordre

<br>

Partitions :

	* elles sont en partie de la vitesse de consommation (au-delà du nb de consumers)

	* si changement de nombre attention sur le changement d'ordre (message avec clef)

	* max de 400k partitions mais attention il ne faut pas en abuser (nb fichiers ouverts)

	* perte brutale d'un broker, la réélection du leader pour toutes les partitions
		* cela peut prendre du temps et augmenter le downtime

	* un broker n'utilise qu'un thread pour répliquer vers les autres brokers
		* si trop de partition le temps de latence est plus long
		* un message est considéré comme écrit si il est répliqué
		
	* limitation à 100 x nb brokers x nb replicas 

	* les producers gardent en mémoire les messages par partition un temps donné
		* si plus de partition, plus de messages en mémoire

	* idem côté consumer qui a plus de partitions à gérer et donc plus de mémoire
