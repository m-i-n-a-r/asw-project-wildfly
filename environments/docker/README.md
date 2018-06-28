# Docker 

## Esecuzione

1. Per avviare o creare l'ambiente di esecuzione, posizionarsi nella cartella **environments/docker** e usare il comando 
    - `vagrant up`   che crea e configura la macchina guest ed una macchina client, descritte nel Vagrantfile.
    
   Sulla prima macchina verranno scaricati e installati:

   - [Java SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html) 
   - [Gradle](https://gradle.org/)
   - [Maven](https://maven.apache.org/) 
   - [Wildfly](http://wildfly.org/)

   Sulla seconda macchina verrano scaricati e installati:

   - [Java SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html) 

2. Per collegarsi con SSH alla macchina virtuale *docker* dell'ambiente, usare il comando 
   - `vagrant ssh docker`  che stabilisce una sessione remota cifrata con la macchina virtuale *docker*.

3. Posizionarsi  nella cartella  **/projects** (dove è presente il DockerFile) e eseguire i seguenti comandi:

   - `docker build --tag=wildfly-image .`  che crea un'immagine che contiene Wildfly, dove viene eseguito il deploy di un semplice *file .war* e di un *EJB in formato jar*. Questi file sono situati nella cartella **/projects/deployments** ;

   - `docker run -p 8080:8080 -it wildfly-image`  che avvia il server WildFly in ascolto sulla porta **8080** del guest e **8081** dell' host.		

4. Una volta che Wildfly è in esecuzione, è possibile testare il corretto funzionamento del semplice Hello World, digitando la seguente rotta in un browser, nell'host:

   - `localhost:8081/hello-world/hello` che visualizza una pagina contenente il messaggio "Hello World!".

	Oppure eseguendo, nella cartella **environments**:

   - `./TestHello.sh` che stampa "Hello World!".

5. Per interrogare il servizio EJB, è necessario utilizzare il secondo nodo creato in precedenza, il nodo *client*. Tramite una seconda linea di comando, posizionarsi in **environments/docker** e collegarsi al nodo *client* tramite
   - `vagrant ssh client` che stabilisce una sessione remota cifrata con la macchina virtuale *client*.

6. 
  
 
