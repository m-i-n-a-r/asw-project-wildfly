# Read installation parameters from config.cfg file.   
source "/home/asw-project-wildfly/_shared/scripts/common.sh"
# Define the wildfly username and password ...
WILDFLY_USER=wildfly
WILDFLY_PASS=WILDFLY1




WILDFLY_VERSION=10.0.0.Final
WILDFLY_FILENAME=wildfly-$WILDFLY_VERSION
WILDFLY_ARCHIVE=$WILDFLY_FILENAME.tar.gz
WILDFLY_REPO=http://download.jboss.org/wildfly/$WILDFLY_VERSION/$WILDFLY_ARCHIVE
WILDFLY_INSTALL_DIR=/home/vagrant/
WILDFLY_FULL_DIR=$WILDFLY_INSTALL_DIR/$WILDFLY_FILENAME
WILDFLY_DIR=$WILDFLY_INSTALL_DIR/wildfly
WILDFLY_SYSTEM_USER="wildfly"
WILDFLY_SERVICE="wildfly"
WILDFLY_SERVICE_PATH="/lib/systemd/system/${WILDFLY_SERVICE}.service"
WILDFLY_STARTUP_TIMEOUT=240
WILDFLY_SHUTDOWN_TIMEOUT=30

# Download wildfly archive if it does not exist.
if [ ! -e "$WILDFLY_ARCHIVE" ]; then
  wget -q $WILDFLY_REPO
  if [ $? -ne 0 ]; then
    echo "Failed to download Wildfly."
    exit 1
  fi
fi

# Clean up old wildfly installation (important for provisioning).
rm -f "$WILDFLY_DIR"
rm -rf "$WILDFLY_FULL_DIR"
rm -rf "/var/run/$WILDFLY_SERVICE/"
rm -f "/etc/init.d/$WILDFLY_SERVICE"

# Create a new directory for wildfly, ...
mkdir -p $WILDFLY_FULL_DIR

# ... extract the downloaded archive into the target directory ...
cd $WILDFLY_INSTALL_DIR

sudo tar -xzf $WILDFLY_ARCHIVE 
rm -rf $WILDFLY_ARCHIVE 


# ... and create a symbolic link to the installation directory.
ln -s $WILDFLY_FULL_DIR/ $WILDFLY_DIR

# Create a new user for wildfly ...
useradd -s /sbin/nologin $WILDFLY_SYSTEM_USER

# ... and give him the proper rights for the new directories.
chown -R $WILDFLY_SYSTEM_USER:$WILDFLY_SYSTEM_USER $WILDFLY_DIR
chown -R $WILDFLY_SYSTEM_USER:$WILDFLY_SYSTEM_USER $WILDFLY_DIR/

# Ccreate a wildfly service script ...  
echo "[Unit]
Description=WildFly application server
After=network.target
 
[Service]
Type=simple
User=$WILDFLY_SYSTEM_USER
Group=$WILDFLY_SYSTEM_USER
ExecStart=$WILDFLY_DIR/bin/standalone.sh
 
[Install]
WantedBy=multi-user.target" > $WILDFLY_SERVICE_PATH

# ... and save the wildfly configuration path.
WILDFLY_SERVICE_CONF=/etc/default/$WILDFLY_SERVICE

# Set the proper access rights for the service configuration.
chmod 777 $WILDFLY_SERVICE_PATH
 
# Set environment variables for wildfly.
if [ ! -z "$WILDFLY_SERVICE_CONF" ]; then
  echo JBOSS_HOME=\"$WILDFLY_DIR\" > $WILDFLY_SERVICE_CONF
  echo JBOSS_USER=$WILDFLY_USER >> $WILDFLY_SERVICE_CONF
  echo STARTUP_WAIT=$WILDFLY_STARTUP_TIMEOUT >> $WILDFLY_SERVICE_CONF
  echo SHUTDOWN_WAIT=$WILDFLY_SHUTDOWN_TIMEOUT >> $WILDFLY_SERVICE_CONF
fi

# Apply minor changes to standalone.xml.
sed -i -e 's,<deployment-scanner path="deployments" relative-to="jboss.server.base.dir" scan-interval="5000"/>,<deployment-scanner path="deployments" relative-to="jboss.server.base.dir" scan-interval="5000" deployment-timeout="'$WILDFLY_STARTUP_TIMEOUT'"/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
sed -i -e 's,<inet-address value="${jboss.bind.address:}"/>,<any-address/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
sed -i -e 's,<socket-binding name="ajp" port="${jboss.ajp.port:8009}"/>,<socket-binding name="ajp" port="${jboss.ajp.port:28009}"/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
sed -i -e 's,<socket-binding name="http" port="${jboss.http.port:8080}"/>,<socket-binding name="http" port="${jboss.http.port:28080}"/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
sed -i -e 's,<socket-binding name="https" port="${jboss.https.port:8443}"/>,<socket-binding name="https" port="${jboss.https.port:28443}"/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
sed -i -e 's,<socket-binding name="osgi-http" interface="management" port="8090"/>,<socket-binding name="osgi-http" interface="management" port="28090"/>,g' $WILDFLY_DIR/standalone/configuration/standalone.xml
                     
systemctl enable $WILDFLY_SERVICE
systemctl restart $WILDFLY_SERVICE


