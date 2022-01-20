#!/bin/bash
# Variables 
#   1 - application
#   2 - service
#   3 - tag
if [ '$3' == 'dev' ]; then
    STAGE=.development
    ENVIRON=-dev
else
    STAGE=''
    ENVIRON=$1
fi
TAG=registry.forske.org/$1/$2:$3 &&
DIRECTORY=/src/$1/$2 &&
DOCKERFILE=$DIRECTORY/Dockerfile$STAGE && 
APP=$1$ENVIRON &&
echo "Building => $TAG" && 
echo $DOCKERFILE &&
docker build --rm -t $TAG -f $DOCKERFILE $DIRECTORY &&
echo "Pushing => $TAG" &&
docker push $TAG &&
echo "Cleaning up => $TAG"
docker rmi $TAG &&
echo "Deploying => $TAG" &&
echo $APP &&
SUFF=$2.yaml &&
URL=https://media.forske.org/k8s/$APP/$SUFF &&
echo $URL &&
curl -s $URL | kubectl apply -f -