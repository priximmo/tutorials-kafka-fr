%title: Kafka
%author: xavki


# KAFKA : INTRODUCTION


<br>

* broker de message via commitlog (bus de message)

* associé aux infras datas, microservices, event driven

<br>

* concurrents : Rabbitmq, ActiveMQ, ZeroMQ...

<br>

Site : https://kafka.apache.org/
Github : https://github.com/apache/kafka

<br>

Langage : Java + Scala
Version : 3.3.1


-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* créé en 2009 chez Linkedin
		* passage en microservices
		* nombreux pipelines de données

* opensource en 2011

* fondation Apache en 2012

* 2014 : départ de l'équipe pour créer Confluent

-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* le plus rapide du marché (modulo Red Panda :) )

* associé à zookeeper (évolution en cours)

* concurrent RedPanda (Kafka en C++, sans zookeeper)

-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* comprend
		* réplication
		* partitionnement
		* scalabilité
		* performance

-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* utilisable dans différents cas de figures
		* data processing
		* centralisation de logs
		* métriques...

-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* pubsub : publish & subscribe de messages
		* structure modulable (producteurs & consommateurs)
		* découplage entre publishers & subscribers
		* broker : un serveur

		publishers > brokers/topics > subscribers

-----------------------------------------------------------

# KAFKA : INTRODUCTION

<br>

* les messages sont stockés sous forme de log (commit log)
		* une file d'attente
		* attention différent d'une queue
		* un log = déplacement d'un offset

* chaque consumer est responsable de son offset

