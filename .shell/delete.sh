#!/bin/bash
# Variables
#   1 - application
#   2 - deployment
if [ -z $2 ]; then
    SUFF=.yaml
else
    SUFF=/$2.yaml
fi
URL=https://media.forske.org/k8s/$1$SUFF
curl -s $URL | kubectl delete -f -