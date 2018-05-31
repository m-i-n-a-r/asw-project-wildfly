# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting delle applicazioni e degli script di esempio per EJB

## Partecipanti
- Matteo Aquilani
- Giacomo Bonanni
- Gianluca Conti
- Daniele Mainella
- Daria Marone

vagrant up permette di creare e configurare la macchina guest secondo il Vagranfile indicato in environments/developer
Verranno scaricati e installati java, gradle, maven e wildfly e posti all'interno del path /usr/local

vagrant ssh dev permette di stabilire una sessione remota cifrata con la macchina virtuale dev

sh deploy-and-start.sh (oppure ./deploy-and-start.sh) all'interno di /projects/scripts esegue il mvn clean del progetto SpringBootBasic generando un .war che viene poi deployato. Infine lancia Wildfly Application Server

sh shutdown.sh effettua lo shutdown di Wildfly

Una volta che Wildfly è in esecuzione è possibile interrogare le seguenti rotte:
localhost:8080/hello/hello stampa un messaggio "Hello world!"
localhost:8080/SpringBootBasic/hello/name stampa un saluto personalizzato "hi name !" dove name è una qualunque stringa specificata dinamicamente

E' possibile interrogare le rotte tramite curl nomerotta

Altre operazioni possibili e informazioni utili
- Aggiungere un utente
cd /usr/local/wildfly/bin
./add-user.sh
- Controllare i file log
/usr/local/wildfly/standalone/log/server.log
- Cambiare l'indirizzo ip delle rotte per la porta 8080
sudo nano /usr/local/wildfly/standalone/configuration/standalone.xml
Apre un editor, modificare la seguente porzione
<socket-binding name="http" port="${jboss.http.port:8080}"/>