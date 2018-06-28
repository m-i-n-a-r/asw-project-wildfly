#!/bin/bash

# Script per l'avvio di un application client  

# il nome dell'applicazione viene sostituito dallo script gradle 
APPNAME=session-counter-ejb-client

echo Running application client ${APPNAME} 

# determina il path relativo in cui si trova lo script 
# (rispetto alla posizione da cui è stata richiesta l'esecuzione dello script) 
PATH_TO_SCRIPT=`dirname $0`

# $@ vuol dire che i parametri dello script sono passati all'appclient 
appclient -client ${PATH_TO_SCRIPT}/${APPNAME}.jar $@
# appclient -xml ${PATH_TO_SCRIPT}/glassfish-acc.xml -client ${PATH_TO_SCRIPT}/libs/${APPNAME}.jar $@
