#!/bin/bash
# Variables 
#   1 - application
#   2 - service
#   3 - tag
if [ "$3" == "dev" ]; then
    STAGE=.development
else
    STAGE=""
fi
TAG=registry.forske.org/$1/$2:$3
DIRECTORY=/src/$1/$2
echo "Building => $TAG" && 
docker build --rm -t $TAG -f $DIRECTORY/Dockerfile$STAGE $DIRECTORY &&
echo "Pushing => $TAG" &&
docker push $TAG &&
echo "Cleaning up => $TAG"
docker rmi $TAG