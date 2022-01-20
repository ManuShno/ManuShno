#!/bin/bash
# CLI Variables
#   1 - service
# Set variables
DOM=/srv/forske/.media/.k8s &&
NS=rode &&
VERB=apply &&
# Run scripts
kubectl $VERB -f $DOM/$NS/$1.yaml &&
sleep 5s &&
kubectl logs -n $NS service/$1 -f