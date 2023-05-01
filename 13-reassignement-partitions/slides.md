%title: Kafka
%author: xavki


# KAFKA : Monitoring & Exporter

<br>

0- créer le topic xavki

1- production de messages

2- liste des topics à réassigner

```
#!/bin/bash

LIST_TOPICS=$(/opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka1:9092 --list)

echo '{"topics": [' >topics-to-move.json
for topic in $LIST_TOPICS;do
echo -e '\t{"topic": "'$topic'"},'>>topics-to-move.json
done
echo '],
"version":1}
' >>topics-to-move.json
```

3- préparation du fichier de réassignement (sortie 4)

```
/opt/kafka/bin/kafka-reassign-partitions.sh --bootstrap-server kafka1:9092 --generate --topics-to-move-json-file topics-to-move.json --broker-list "1,2,3"
```

4- création de 2 fichiers backups et nouvel assignement

5- lancement de la réassignation

```
/opt/kafka/bin/kafka-reassign-partitions.sh --bootstrap-server kafka1:9092 --execute --reassignment-json-file new.json
```

6- un peu d'attente :)
