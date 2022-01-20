#!/bin/bash
# Variables
#   1 - VERB
LOCATION=/srv/forske/.media/.k8s/ontoserver
kubectl $1 -f $LOCATION/.init.yaml &&
$LOCATION/regcred.sh
kubectl $1 -f $LOCATION/ontoserver.yaml