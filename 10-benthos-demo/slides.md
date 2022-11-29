%title: Kafka
%author: xavki


# KAFKA : Mise en application & Benthos

<br>

./bin/kafka-configs.sh --alter
--add-config retention.ms=10000
--bootstrap-server=kafka1:9092
--topic xavki

.bin/kafka-configs.sh
--bootstrap-server kafka1:9092 --alter
--entity-type topics --entity-name xavki
--delete-config retention.ms


/usr/bin/shuf -i 1-100000 -n 50000000
  | tee -a /tmp/trace.log
  | ./bin/kafka-console-producer.sh
  --bootstrap-server=kafka1:9092
  --topic xavki
