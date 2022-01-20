#!/bin/bash
# CLI Variables
#   1 - organisation
#   2 - data-server
# Set variables
DOM=/srv/forske/.media/.k8s &&
NS=rode-ds &&
VERB=apply &&
# Run scripts
kubectl $VERB -f $DOM/$NS/$1.$2.yaml &&
sleep 5s &&
kubectl logs -n $NS service/$1-$2 -f