# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting delle applicazioni e degli script di esempio per EJB


In questa versione vengono installati java, maven e wildfly e lanciato wildfly as a service (fonti: fonti: https://gist.github.com/sukharevd/6087988 ).
-	vagrant up permette di eseguire il provisioning automatizzato
-	vagrant ssh dev di accedere alla macchina virtuale dev
-	Bisogna effettuare il deploy dell'unico progetto presente sotto projects:
		(a) lanciando lo script in projects tramite:
			cd projects/Hello-World
			sh deploy.sh
	oppure
		(b)	eseguendo il comando:
			sudo cp projects/Hello-World/target/SpringBootBasic.war wildfly/standalone/deployments
	se la cartella target è già presente all'interno di Hello-World

A questo punto sarà possibile visualizzare un messaggio di saluto "hi {stringa}", dove stringa è il parametro fornito nell'uri e può essere una qualunque
string alfanumerica, dopo aver lanciato il comando curl localhost:28080/SpringBootBasic/Hello-World/hello/{stringa}

Purtroppo il port forwarding non funziona nella versione attuale: è possibile interagire con wildfly solo all'interno della macchina virtuale dev.
Tentativi che ho intrapreso per provare a risolvere il problema:
- disabilitare il firewall della macchina guest:
	sudo ufw disable

	iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
- disabilitare il firewall di Windows (host)
- disabilitare Avast AntiVirus
- controllati i log presso wildfly/standalone/log/server.log ma non ci sono errori
- tentativo di eseguire wildfly come service seguendo questa fonte https://stuetzpunkt.wordpress.com/2017/02/28/how-to-add-wildfly-10-as-service-in-ubuntu/ ma non mi funziona


Note: il progetto SpringBootBasic (classi java e pom.xml) è stato preso da una guida su Internet (la stessa utilizzata per un'altra versione del progetto), ma non ricordo quale.
