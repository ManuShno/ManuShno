#!/bin/bash
# Variables
#   1 - namespace
#   2 - service name
NS=$1 &&
shift &&
SVC=$1 &&
shift &&
kubectl exec -it -n $NS service/$SVC -- /bin/bash