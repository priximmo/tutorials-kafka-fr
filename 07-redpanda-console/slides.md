%title: Kafka
%author: xavki


# KAFKA : RedPanda Console

<br>

Github : https://github.com/redpanda-data/console

* installation de RedPanda console avec docker

```
docker run --rm -p 8080:8080 --network=host
-e KAFKA_BROKERS=kafka1:9092
docker.redpanda.com/vectorized/console:latest
```
