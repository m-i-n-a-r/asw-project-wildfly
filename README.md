# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting delle applicazioni e degli script di esempio per EJB

## Organizzazione Repository
* [projects](projects/) contiene il codice dell' *applicazione distribuita*, formata da componenti Enterprise Bean (EJB);
* [environments](environments/) contiene il codice per la gestione dell' *ambiente distribuito*  di esecuzione su cui eseguire l'applicazione sviluppata.

## Esecuzione

1. Per avviare o creare l'ambiente di esecuzione, posizionarsi nella cartella **environments/docker** e usare il comando 
    - `vagrant up`   che crea e configura la macchina guest, descritta nel Vagrantfile.
    
   Verranno scaricati e installati:

   - [Java SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html) 
   - [Gradle](https://gradle.org/)
   - [Maven](https://maven.apache.org/) 
   - [Wildfly](http://wildfly.org/)


2. Per collegarsi con SSH alla macchina virtuale *docker* dell'ambiente, usare il comando 
   - `vagrant ssh docker`  che stabilisce una sessione remota cifrata con la macchina virtuale (*docker*).


3. Posizionarsi  nella cartella  **/projects** (dove è presente il DockerFile) e eseguire i seguenti comandi:

   - `docker build --tag=wildfly-image .`  che crea un immagine che contiene Wildfly, dove viene deployato il *file .war* situato nella cartella **/projects/deployments** ;

   - `docker run -p 8080:8080 -it wildfly-image`  che avvia il server WildFly in ascolto sulla porta **8080** del guest e **8081** dell' host.		


4. Una volta che Wildfly è in esecuzione è possibile interrogare la seguente rotta nell'host:

   - `localhost:8081/hello-world/hello`  che stampa un messaggio "Hello world!"

E' possibile interrogare la rotta tramite curl 'nomerotta', o eseguendo il comando

   - `./TestHello.sh`

## Partecipanti
- Matteo Aquilani
- Giacomo Bonanni
- Gianluca Conti
- Daniele Mainella
- Daria Marone
