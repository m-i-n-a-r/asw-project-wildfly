# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting delle applicazioni e degli script di esempio per EJB

## Organizzazione repository
* [projects](projects/) contiene il codice delle *applicazioni distribuite*, 
  con una sottosezione (sottocartella) per ciascuno degli argomenti del corso; 
* [environments](environments/) contiene il codice per la gestione degli *ambienti distribuiti*, 
  con una sottosezione (sottocartella) per ciascuno degli ambienti distribuiti 
  su cui poter eseguire le applicazioni distribuite sviluppate.

## Istruzioni

**1.** vagrant up permette di creare e configurare la macchina guest secondo il Vagranfile indicato in **environments/docker**
   Verranno scaricati e installati java, gradle, maven e wildfly

**2.** vagrant ssh docker permette di stabilire una sessione remota cifrata con la macchina virtuale docker

**3.** una volta aperta la sessione con la macchian docker, dentro la cartella /projects (dove è presente il DockerFile) bisogna eseguire i seguenti comandi:


Una volta che Wildfly è in esecuzione è possibile interrogare le seguente rotta nell'host:
localhost:8081/hello-world/hello stampa un messaggio "Hello world!"

E' possibile interrogare le rotte tramite curl nomerotta

## Partecipanti
- Matteo Aquilani
- Giacomo Bonanni
- Gianluca Conti
- Daniele Mainella
- Daria Marone