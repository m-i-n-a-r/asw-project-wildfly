# ASW Project - Wildfly

## Porting di un servizio EJB
Verrà effettuato il porting su ambiente Wildfly di un servizio EJB tra quelli disponibili nella [Repository](https://github.com/aswroma3/asw) del corso.
Come primo passo è stato scelto [l'EJB session counter](https://github.com/aswroma3/asw/tree/master/projects/asw-850-ejb/c-session-counter), e le sue classi inserite in un EJB project in Eclipse EE. Il file generato dalla compilazione, in formato jar, può essere deployato con successo su wildfly, o inserito in un progetto che lo incapsuli, ad esempio un dinamic web project. Il servizio offerto da questi EJB è utilizzato, in ambiente Glassfish, da un client situato in un secondo nodo.
Gli EJB in esame non dispongono di un'interfaccia web, e il risultato delle invocazioni è mostrato 


