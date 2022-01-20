#!/bin/bash
# Variables
#   1 - document
APP=rode &&
SVCS=(api \
    assets \
    authorise \
    backend-service \
    data-service \
    domain \
    hl7 \
    load \
    login \
    normalise \
    projects \
    queries \
    registries \
    renew \
    schedule \
    smtp \
    socket \
    structure \
    submit \
    token \
    upload \
    user-interface) &&
FILES=(.dockerignore \
    .gitattributes \
    .gitignore \
    .gitlab-ci.yml \
    # Dockerfile \
    # Dockerfile.development \
    CONTRIBUTING.md \
    LICENSE.md) &&
for SVC in ${SVCS[*]}; do
    for FILE in ${FILES[*]}; do
        ln /src/$APP/backend-template/$FILE \
        /src/$APP/$SVC/$FILE
    done
done