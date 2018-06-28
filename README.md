# ASW Project - Wildfly

## Obiettivi
Sperimentazione di [JBoss WildFly](http://wildfly.org/): 
- creare un ambiente virtuale basato su WildFly 
- effettuare il porting di una delle applicazioni di esempio per EJB

## Organizzazione Repository
* [projects](projects/) contiene il codice dell' *applicazione distribuita*, formata da componenti Enterprise Bean (EJB);
* [environments](environments/) contiene il codice per la gestione dell' *ambiente distribuito*  di esecuzione su cui eseguire l'applicazione sviluppata.

### Per l'esecuzione dell'ambiente basato su virtual machine, consultare [questa pagina](environments/docker)
### Per l'esecuzione dell'ambiente basato su Docker, consultare [questa pagina](environments/virtualbox)

## Obiettivi raggiunti
- E' possibile costruire una macchina virtuale con un'installazione funzionante dell'application server Wildfly
- E' possibile costruire un ambiente docker con un'installazione funzionante dell'application server Wildfly
- E' possibile testare un semplice deploy e il successo di quest'ultimo su entrambi gli ambienti
- Entrambi gli ambienti forniscono un port forwarding che permette di accedere a Wildfly dall'host
- Il deploy dell'EJB scelto (session counter stateless) avviene con successo

## Obiettivi non raggiunti
- Non è stato possibile chiamare il metodo getCounter() dell'EJB deployato in Wildfly analogamente a quanto era possibile fare con l'ambiente Glassfish e l'utilizzo di appclient. I procedimenti seguiti sono stati:
	- Creazione di una ulteriore macchina virtuale client contenente Java e quanto ritenuto necessario
	- Strategia affine a quanto visto con Glassfish
		- Non funzionante a causa di principi di funzionamento diversi
	- Chiamata tramite ricerca dell'EJB nel server
		- I tentativi fatti non hanno portato risultati 

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

