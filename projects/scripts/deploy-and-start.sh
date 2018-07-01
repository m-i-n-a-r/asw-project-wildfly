#Deploy di hello-world.war su wildfly
sudo cp ../deployments/hello_world.war /usr/local/wildfly/standalone/deployments
#start di wildfly
sudo /usr/local/wildfly/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0
