#generazione del war SpringBootBasic.war nella cartella target
cd /home/asw/projects/SpringBootBasic
mvn clean package
#Deploy di SpringBootBasic.war su wildfly
sudo cp /home/asw/projects/SpringBootBasic/target/SpringBootBasic.war /usr/local/wildfly/standalone/deployments
#start di wildfly
sudo /usr/local/wildfly/bin/standalone.sh
