# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting di una delle applicazioni di esempio per EJB

## Organizzazione Repository
* [projects](projects/) contiene il codice dell' *applicazione distribuita*, formata da componenti Enterprise Bean (EJB);
* [environments](environments/) contiene il codice per la gestione dell' *ambiente distribuito*  di esecuzione su cui eseguire l'applicazione sviluppata.

### Per l'esecuzione dell'ambiente basato su virtual machine, consultare [questa pagina](environments/virtualbox)
### Per l'esecuzione dell'ambiente basato su Docker, consultare [questa pagina](environments/docker)

## Obiettivi raggiunti
- E' possibile costruire una macchina virtuale con un'installazione funzionante dell'application server Wildfly
- E' possibile costruire un ambiente Docker con un'installazione funzionante dell'application server Wildfly
- E' possibile testare un semplice deploy e il successo di quest'ultimo su entrambi gli ambienti
- Entrambi gli ambienti forniscono un port forwarding che permette di accedere a Wildfly dall'host
- Il deploy dell'EJB scelto (session counter stateless) avviene con successo
	- Per ulteriori dettagli, fare riferimento alle istruzioni dei due ambienti

## Obiettivi non raggiunti
- Non è stato possibile chiamare il metodo getCounter() dell'EJB deployato in Wildfly analogamente a quanto era possibile fare con l'ambiente Glassfish e l'utilizzo di appclient. I procedimenti seguiti sono stati:
	- Creazione di una ulteriore macchina virtuale client contenente Java e quanto ritenuto necessario
	- Strategia affine a quanto visto con Glassfish-Payara
		- Non funzionante a causa di principi di funzionamento diversi
	- Chiamata tramite approcci riportati nelle fonti consultate
		- I tentativi fatti non hanno portato risultati apprezzabili: talvolta la chiamata terminava con un errore, altre volte ancora non forniva semplicemente l'output sperato. Al momento non sono note le cause di questi malfunzionamenti, ed i tentativi effettuati localmente non sono stati riportati nella repository finale. Probabilmente mancano una o più librerie necessarie a Wildfly lato client, oppure l'istanza di Wildfly su docker non comunica correttamente con la macchina client (che a sua volta potrebbe aver bisogno di altro software installato)
	- Utilizzo di EJB stateless e di esempi più semplici
		- I problemi riscontrati, nonostante un EJB stateless sia tendenzialmente più facile da gestire, sono stati gli stessi.

## Partecipanti
- Matteo Aquilani
- Giacomo Bonanni
- Gianluca Conti
- Daniele Mainella
- Daria Marone

## Fonti consultate 
- https://www.3pillarglobal.com/insights/how-to-make-a-call-to-an-ejb-service-deployed-on-wildfly
- https://docs.jboss.org/author/display/WFLY10/EJB+invocations+from+a+remote+server+instance 
- https://docs.jboss.org/author/display/WFLY8/EJB+invocations+from+a+remote+client+using+JNDI
- https://docs.jboss.org/author/display/WFLY8/Application+Client+Reference
- https://stackoverflow.com/questions/5984217/vagrants-port-forwarding-not-working
- https://stackoverflow.com/questions/51011092/calling-an-ejb-client-from-node
	- **nota:** domanda posta da un componente del gruppo. La risposta non ha consentito progressi particolari.
- https://stackoverflow.com/questions/16408750/calling-ejb-from-remote-standalone-client
- http://tapas-tanmoy-bose.blogspot.com/2013/12/wildfly-ejb-invocations-from-remote.html

