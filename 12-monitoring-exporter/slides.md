%title: Kafka
%author: xavki


# KAFKA : Monitoring & Exporter

<br>

https://github.com/danielqsj/kafka_exporter

wget https://github.com/danielqsj/kafka_exporter/releases/download/v1.6.0/kafka_exporter-1.6.0.linux-amd64.tar.gz
tar xzvf kafka_exporter-1.6.0.linux-amd64.tar.gz
sudo mv kafka_exporter-1.6.0.linux-amd64/kafka_exporter /usr/local/bin/
sudo chmod +x /usr/local/bin/kafka_exporter

echo '[Unit]
Description=Kafka Exporter
Documentation=https://github.com/danielqsj/kafka_exporter
Requires=network.target
After=network.target
[Service]
Type=simple
User=kafka
Group=kafka
ExecStart=/usr/local/bin/kafka_exporter --kafka.server=kafka1:9092 --kafka.server=kafka2:9092 --kafka.server=kafka3:9092
Restart=on-failure
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/kafka_exporter.service

systemctl enable kafka_exporter
systemctl start kafka_exporter



sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y wget unzip prometheus >/dev/null


echo "
global:
  scrape_interval:     5s
  evaluation_interval: 5s
scrape_configs:
  - job_name: kafka_exporter
    static_configs:
      - targets:
        - localhost:9308
        labels:
          cluster: 'xavki'
" > /etc/prometheus/prometheus.yml


sudo systemctl restart prometheus
sudo systemctl enable prometheus

sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y grafana >/dev/null

sudo systemctl start grafana-server
sudo systemctl enable grafana-server

https://grafana.com/grafana/dashboards/7589-kafka-exporter-overview/

label_values(kafka_broker_info, instance)
