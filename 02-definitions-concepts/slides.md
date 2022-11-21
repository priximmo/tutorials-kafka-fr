%title: Kafka
%author: xavki


# KAFKA : Définitions & Concepts

<br>

Kafka = Event Streaming

<br>

Event : 
	* description d'une action métier
	* à diffuser à un ou plusieurs microservices
	* stockés sous forme de messages
	* stockés dans une couche logique nommée topics

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Producer :
	* application cliente qui écrit des données
	* dans un ou des topics

<br>

Consumer : 
	* application client qui souscrit à des topics

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Asynchrone : 
	* découplage entre l'activité du/des producers
	* et du/des consumers

<br>

Topics : 
	* une couche logique de stockage des messages
	* permettant de lire et de relire les messages
	* les messages ne sont pas détruits

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Commit Log :
	* méthode employé par kafka pour stocker les messages
	* ordonné, séquentiel et jamais détruit lors de leur consommation

<br>

Offset :
	* caractéristiques : où commencer (plus tôt ou plus tard)
	* important pour attester de la bonne délivrance du message

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Partition :
	* fragmentation logique des topics en morceaux
	* permet de distribuer sur l'ensemble d'un même cluster
	* en les conservant dans le même topic
	* important pour la performance et la scalibilité

<br>

Clef de partition
	* information utilisée pour déterminer où stocker
	* dans quelle partition
	* fonction de hachage

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Segments :
	* au sein des partitions
	* regroupement de messages pour un stockage physique
	* valeur par défaut = 1 GB

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Réplication :
	* les partitions sont dupliquées (haute disponibilité)
	* sur un ou plusieurs autres serveurs (brokers)
	* leader vs follower(s)

----------------------------------------------------------

# KAFKA : Définitions & Concepts

<br>

Consumer Group :
	* à la différence des producers dont le travail est plus simple
	* les consumers doivent s'organiser pour consommer les partitions
	* potentiellement de différents topics
	* un des brokers à en charge de coordonner (coordinator)
	* coordinator = en charge de l'offset
