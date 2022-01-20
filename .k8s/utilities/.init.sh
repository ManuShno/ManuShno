#!/bin/bash
# Variables
#   1 - domain
#   2 - application - namespace
echo "init for $2 executing"
curl -s $1/$2/.init.yaml | kubectl apply -f - &&
NS=created
if [ $NS == "created" ]; then
    curl -s $1/_/regcred.sh | bash -s $2
    # svcs=(api \
    #     assets \
    #     authorisation \
    #     domain \
    #     hl7 \
    #     load \
    #     projects \
    #     queries \
    #     schedule \
    #     socket \
    #     structure \
    #     submit \
    #     ui \
    #     upload)
    # for svc in ${svcs[*]}; do
    #     curl -s $1/$2/$svc.yaml | kubectl apply -f -
    # done
fi
echo "$2 initiated"