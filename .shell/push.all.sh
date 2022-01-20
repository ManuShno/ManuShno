#!/bin/bash
# Variables
#   1 - Application
#   2 - Message
rode=(api \
    assets \
    authorisation \
    backend-service \
    data-service \
    domain \
    hl7 \
    load \
    normalise \
    projects \
    queries \
    registries \
    schedule \
    socket \
    structure \
    submit \
    ui \
    upload \
    user-interface)
eval "array=\${${1}[*]}"
for service in ${array}; do
    echo ""
    echo "$service pushing => gitlab"
    echo ""
    cd /src/$1/$service &&
    git add . &&
    git commit -m "$2" &&
    git push -u gitlab --all
done