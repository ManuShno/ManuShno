#!/bin/bash
# Variables
#   1 - application
#   2 - service
cd /src/$1/$2 &&
git remote rename origin github &&
git remote add gitlab git@gitlab.forske.org:$1/$2.git &&
git push -u gitlab --all