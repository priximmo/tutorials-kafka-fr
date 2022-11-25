#!/usr/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Xavier
#  VERSION: 
#  CREATION:  
#  MODIFIE: 
#
#  DESCRIPTION: 
###############################################################



# Variables ###################################################



# Functions ###################################################


install_kafka_manager() {

echo "Kafka Manager installation..."

groupadd --system kafka
useradd -s /sbin/nologin --system -g kafka kafka

apt install unzip

wget -q https://github.com/yahoo/CMAK/releases/download/3.0.0.6/cmak-3.0.0.6.zip

unzip -qq cmak-3.0.0.6.zip
mv  cmak-3.0.0.6 /opt/kafka_manager
chown -R kafka:kafka /opt/kafka_manager


echo '[Unit]
Description=Apache Kafka Manager
Documentation=http://kafka.apache.org/documentation.html
Requires=network.target
After=network.target 

[Service]
Type=simple
User=kafka
Group=kafka

Environment=ZK_HOSTS="kafka1:2181,kafka2:2181,kafka3:2181"
ExecStart=/opt/kafka_manager/bin/cmak
Restart=on-failure

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/kafka_manager.service

systemctl daemon-reload
systemctl start kafka_manager
systemctl enable kafka_manager

}

# Let's Go !! #################################################

install_kafka_manager

