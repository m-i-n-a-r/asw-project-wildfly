# ASW Project - Wildfly

## Porting di un servizio EJB
Verrà effettuato il porting su ambiente Wildfly di un servizio EJB tra quelli disponibili nella [Repository](https://github.com/aswroma3/asw) del corso. \
Come primo passo è stato scelto [l'EJB Session Counter](https://github.com/aswroma3/asw/tree/master/projects/asw-850-ejb/c-session-counter), e le sue classi inserite in un EJB project in Eclipse EE. \ 
Il file generato dalla compilazione, in formato jar, può essere deployato con successo su Wildfly, o inserito in un progetto che lo incapsuli, ad esempio un Dinamic Web Project. Il servizio offerto da questi EJB è utilizzato, in ambiente Glassfish, da un client situato in un secondo nodo. \
Gli EJB in esame non dispongono di un'interfaccia web, e il risultato delle invocazioni è mostrato nel prompt dei comandi al momento dell'invocazione. \

## Fonti consultate
https://www.3pillarglobal.com/insights/how-to-make-a-call-to-an-ejb-service-deployed-on-wildfly \
https://docs.jboss.org/author/display/WFLY10/EJB+invocations+from+a+remote+server+instance 



