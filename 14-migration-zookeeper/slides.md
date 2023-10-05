%title: Kafka
%author: xavki



██╗  ██╗ █████╗ ███████╗██╗  ██╗ █████╗ 
██║ ██╔╝██╔══██╗██╔════╝██║ ██╔╝██╔══██╗
█████╔╝ ███████║█████╗  █████╔╝ ███████║
██╔═██╗ ██╔══██║██╔══╝  ██╔═██╗ ██╔══██║
██║  ██╗██║  ██║██║     ██║  ██╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝

---------------------------------------------------------------------------------------------
 
# KAFKA : migration de zookeeper 

                                      
<br>

0- Avoir un cluster kafka focntionnel

1- Avoir des serveurs avec zookeeper installé (non démarré)

2- Ajouter dans la conf tous les zookeepers
		* attention aux id aussi !!! (conf + myid)

3- Start des nouveaux zookeeper et restart des anciens

4- Check mntr + stat avec netcat

---------------------------------------------------------------------------------------------
 
# KAFKA : migration de zookeeper 

                                      
<br>

5- Modification des zookeepers dans la conf kafka & restart de kafka

6- Modification des confs zookeeper en splittant ancien/nouveau

7- Important pour 0 downtime - restart des nouveaux zookeeper

8- Restart des anciens zookeeper (non fonctionnel le temps de les restart)

9- Dernier check mntr/stat
