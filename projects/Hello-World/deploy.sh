
#Per buildare il progetto
cd /home/vagrant/projects/Hello-World

mvn clean package
#Deploy di SpringBootBasic.war su wildfly

sudo cp /home/vagrant/projects/Hello-World/target/SpringBootBasic.war /home/vagrant/wildfly/standalone/deployments


#deploy all projects found in deploy/
for proj_war in /home/vagrant/wildfly/standalone/deployments/*.war; do
  echo "deploying $proj_war"
  /home/vagrant/wildfly/bin/jboss-cli.sh -c "connect"
  /home/vagrant/wildfly/bin/jboss-cli.sh -c "deploy $proj_war"
  done