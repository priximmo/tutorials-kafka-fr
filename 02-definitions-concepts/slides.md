%title: Kafka
%author: xavki


# KAFKA : INTRODUCTION


<br>

* créé en 2009 chez Linkedin
		* passage en microservices
		* nombreux pipelines de données

* opensource en 2011

* fondation Apache en 2012

* 2014 : départ de l'équipe pour créer Confluent

* le plus rapide du marché

* comprend
		* réplication
		* partitionnement
		* scalabilité
		* performance

* utilisable dans différents cas de figures
		* data processing
		* centralisation de logs
		* métriques...

* associé à zookeeper (évolution en cours)

* concurrent RedPanda (Kafka en C++, sans zookeeper)


* pubsub : publish & subscribe de messages
		* structure modulable (producteurs & consommateurs)
		* découplage entre publishers & subscribers
		* broker : un serveur

		publishers > brokers/topics > subscribers

* les messages sont envoyés dans un topic

* les messages sont stockés sous forme de log (commit log)
		* une file d'attente
		* attention différent d'une queue
		* un log = déplacement d'un offset

* chaque consumer est responsable de son offset

* messages


topics
partition
partition offset
replicas
brokers
cluster
producer
consumer
leader
clef des partitions

https://www.tutorialspoint.com/apache_kafka/apache_kafka_fundamentals.htm

