#!/bin/bash
# Set variables
DOM=/srv/forske/.media/.k8s &&
NS=rode-dev &&
VERB=apply &&
svcs=(api \
    assets \
    authorisation \
    domain \
    hl7 \
    load \
    projects \
    queries \
    schedule \
    socket \
    structure \
    submit \
    ui \
    upload)
# Run scripts
kubectl $VERB -f $DOM/$NS/.init.yaml &&
$DOM/regcred.sh $NS && 
kubectl $VERB -f $DOM/$NS/.ingress.yaml
for svc in ${svcs[*]}; do
    kubectl $VERB -f $DOM/$NS/$svc.yaml
done
echo "$NS $VERB complete"