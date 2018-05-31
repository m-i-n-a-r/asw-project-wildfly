#generazione del war SpringBootBasic.war
cd /home/asw/projects/spring-boot-basic
mvn clean package
#Deploy di SpringBootBasic.war su wildfly
sudo cp /home/asw/projects/spring-boot-basic/target/SpringBootBasic.war /usr/local/wildfly/standalone/deployments
#start di wildfly
sudo /usr/local/wildfly/bin/standalone.sh