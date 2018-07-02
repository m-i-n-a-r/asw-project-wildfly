#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"
#tutorial
WILDFLY_VERSION=10.0.0.Final
WILDFLY_FILENAME=wildfly-$WILDFLY_VERSION
WILDFLY_ARCHIVE=$WILDFLY_FILENAME.tar.gz
GET_WILDFLY_URL=http://download.jboss.org/wildfly/$WILDFLY_VERSION/$WILDFLY_ARCHIVE
# questo: http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.tar.gz
##
# set up Java constants 
#JAVA_BUILD=11
#JAVA_HEX=512cd62ec5174c3487ac17c61aaa89e8

# http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz

#GET_JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/${WILDFLY_VERSION}u${JAVA_MINOR_VERSION}-b${JAVA_BUILD}/${JAVA_HEX}
WILDFLY_PATH=/usr/local/wildfly-${WILDFLY_VERSION} 
# JAVA_JDK_PATH=/usr/local/jdk1.${WILDFLY_VERSION}.0_${JAVA_MINOR_VERSION} 
# # e.g., /usr/local/jdk1.8.0_161
# JAVA_JRE_PATH=/usr/lib/jvm/jre 

function installLocalWildfly {
	echo "====================="
	echo "installing wildfly"
	echo "====================="
	#FILE=${ASW_DOWNLOADS}/$WILDFLY_ARCHIVE
	FILE=${ASW_DOWNLOADS}/$WILDFLY_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteWildfly {
	echo "======================"
	echo "downloading wildfly"
	echo "======================"
	wget -nv -P ${ASW_DOWNLOADS} "${GET_WILDFLY_URL}"
	#wget -nv -P ${ASW_DOWNLOADS} --header "Cookie: oraclelicense=accept-securebackup-cookie;" "${GET_JAVA_URL}/${WILDFLY_ARCHIVE}" 
	installLocalWildfly 
}

function setupWildfly {
	echo "setting up wildfly"
	if downloadExists $WILDFLY_ARCHIVE; then
		ln -s $WILDFLY_PATH /usr/local/wildfly
	else
		echo "setup didn't work"
		#ln -s $JAVA_JRE_PATH /usr/local/java
	fi
}

 function setupEnvVars {
 	echo "creating wildfly environment variables"
 	echo "primo passo: jboss home"
 	echo export JBOSS_HOME=/usr/local/wildfly >> /etc/profile.d/wildfly.sh
 	echo "secondo passo: jboss home bin"
 	echo export PATH=\${JBOSS_HOME}/bin:\${PATH} >> /etc/profile.d/wildfly.sh
 	chmod +x /usr/local/wildfly/bin/standalone.sh
 }

function installWildfly {
	if downloadExists $WILDFLY_ARCHIVE; then
		installLocalWildfly
	else
		installRemoteWildfly
	fi
}
#deploy all projects found in deploy/
	function deployWars {
		for proj_war in ${ASW_DEPLOYS}/*.war; do
		  echo "deplying $proj_war"
		  sudo /usr/local/wildfly/bin/jboss-cli.sh -c "deploy $proj_war"
		done
	}
echo "setup wildfly"
installWildfly
setupWildfly
setupEnvVars
#deployWars
sudo cp /home/asw/projects/deployments/hello-world.war /usr/local/wildfly/standalone/deployments/


