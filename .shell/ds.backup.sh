#!/bin/bash
# Variables
#   1 - application
#   2 - service
#   3 - database
kubectl exec -n $1-ds service/$2 -- bash /.backup/backup.sh $3