#!/bin/bash
# Variables
#   1 - application
#   2 - service
#   3 - verb
if [ -z $2 ]; then
    SUFF=.yaml
elif [ "$1" = "help" ]; then 
    echo "
    Command arguments:
        application:   The name of the application to run deploy the service for
        deployment:    The name of the service to deploy
        verb:          K8s verb for cluster interaction
    "
else
    SUFF=/$2.yaml
fi
URL=https://media.forske.org/k8s/$1$SUFF
if [ -z $3 ]; then 
    curl -s $URL | kubectl apply -f -
elif [ "$3" = "restart" ]; then
    curl -s $URL | kubectl delete -f -
    curl -s $URL | kubectl apply -f -
else
    curl -s $URL | kubectl $3 -f -
fi

