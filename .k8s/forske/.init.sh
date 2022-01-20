#!/bin/bash
# Set variables
DOM=/srv/forske/.media/.k8s &&
NS=forske
VERB=delete
svcs=(data-service \
    media \
    reference \
    forske.backend \
    forske.frontend \
    canon.backend \
    canon.frontend \
    epicure.backend \
    epicure.frontend \
    hub.backend \
    hub.frontend \
    poteen.backend \
    poteen.frontend)
# Run scripts
kubectl $VERB -f $DOM/$NS/.init.yaml &&
$DOM/regcred.sh $NS
for svc in ${svcs[*]}; do
    kubectl $VERB -f $DOM/$NS/$svc.yaml
done
echo "$NS $VERB complete"