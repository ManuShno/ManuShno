#!/bin/bash
# Set variables
DOM=/srv/forske/.media/.k8s &&
NS=rode-ds &&
VERB=apply &&
core=(clinical-quality \
    data-dictionary \
    data-request \
    document \
    event \
    intellectual-property \
    linkage \
    migration \
    organisation \
    person \
    pipeline \
    platform \
    project \
    publication \
    reference \
    unit)
dist=(blackdog \
    seslhd)
ds=(clinical-quality \
    event \
    intellectual-property \
    project)
# Run scripts
kubectl $VERB -f $DOM/$NS/.init.yaml &&
$DOM/regcred.sh $NS &&
kubectl $VERB -f $DOM/$NS/.ingress.yaml
for res in ${core[*]}; do
    kubectl $VERB -f $DOM/$NS/core.$res.yaml
done
for org in ${dist[*]}; do
    for res in ${ds[*]}; do
        kubectl $VERB -f $DOM/$NS/$org.$res.yaml
    done
done
echo "$NS $VERB complete"