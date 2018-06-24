# BusyBox ha un footprint minimale 
#FROM busybox:latest

FROM jboss/wildfly
# Deploy di un semplice Hello World
ADD /deployments/hello-world.war /opt/jboss/wildfly/standalone/deployments/
# Deploy dell'enterprise java bean session counter stateful
ADD /deployments/CounterEJB.jar /opt/jboss/wildfly/standalone/deployments/



#EXPOSE 8080

#RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin80 --silent
#CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", #"-bmanagement", "0.0.0.0"]

