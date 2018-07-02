# Virtualbox

## Esecuzione

1. Per avviare o creare l'ambiente di esecuzione, posizionarsi nella cartella **environments/virtualbox** e usare il comando 
    - `vagrant up`   che crea e configura la macchina guest, descritta nel Vagrantfile.
    
   Sulla macchina verranno scaricati e installati:

   - [Java SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html) 
   - [Wildfly](http://wildfly.org/)

2. Per collegarsi con SSH alla macchina virtuale *virtualmachine* dell'ambiente, usare il comando 
   - `vagrant ssh`  che stabilisce una sessione remota cifrata con la macchina virtuale *virtualmachine*.

3. Posizionarsi  nella cartella  **/projects/scripts** ed eseguire i seguenti comandi:

   - `./deploy-and-start.sh` che esegue il deploy di un semplice file war e inizializza Wildfly

4. Una volta che Wildfly è in esecuzione, è possibile testare il corretto funzionamento del semplice Hello World, digitando la seguente rotta in un browser, nell'host:

   - `localhost:8087/hello-world/hello` che visualizza una pagina contenente il messaggio "Hello World!".

   - **Attenzione:** per rendere il port forwarding funzionante, oltre a pratiche comuni come la disabilitazione del firewall, è stato necessario cambiare il binding predefinito di Wildfly, che viene eseguito sull'indirizzo di loopback 127.0.0.1, all'indirizzo 0.0.0.0 in sede di startup, così che tutte le interfacce possano accedere alla porta. A prescindere da questo, potrebbe succedere che Vagrant corregga automaticamente alcuni conflitti sulla porta in cui si sta tentando di eseguire il forwarding. La porta risultante dalla risoluzione di questi conflitti è dichiarata nel log, al quale quindi è necessario fare riferimento per un'eventuale impossibilità di raggiungere la rotta specificata al passo precedente. Inoltre, ogni tentativo di comunicazione client server nell'ambito del porting dei servizi EJB è stato eseguito esclusivamente nell'ambiente **docker**, funzionalmente equivalente a questo.
