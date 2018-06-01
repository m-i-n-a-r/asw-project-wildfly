# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting delle applicazioni e degli script di esempio per EJB

## Istruzioni
**1.** vagrant up permette di creare e configurare la macchina guest secondo il Vagranfile indicato in environments/developer
   Verranno scaricati e installati java, gradle, maven e wildfly

**2.** vagrant ssh docker permette di stabilire una sessione remota cifrata con la macchina virtuale docker

**3.** una volta aperta la sessione con la macchian docker, dentro la cartella /projects (dove è presente il DockerFile) bisogna eseguire i seguenti comandi:
	
	**a. docker build --tag=wildfly-image .** (questo comando ci permette di creare un immagine che contiene wildfly dove viene deployato il file .war situato nella cartella /projects/deployments)

	**b. docker run -p 8080:8080 -it wildfly-image** (in questo modo avvieremo il server WildFly e sarà in ascolto nella porta 8080)

Una volta che Wildfly è in esecuzione è possibile interrogare le seguente rotta:
localhost:8080/hello-world/hello stampa un messaggio "Hello world!"

E' possibile interrogare le rotte tramite curl nomerotta

## Partecipanti
- Matteo Aquilani
- Giacomo Bonanni
- Gianluca Conti
- Daniele Mainella
- Daria Marone