#!/bin/bash
# Variables
#   1 - application
#   2 - service
#   3 - commit message
cd /src/$1/$2 &&
git add . &&
git commit -m "$1" &&
git push -u gitlab --all