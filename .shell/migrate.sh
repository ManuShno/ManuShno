#!/bin/bash
# Variables
#   1 - application
#   2 - data service
#   3 - from database
#   4 - to database
docker exec -it $1_ds_$2 sh -c "bash /.backup/migrate.sh $2 $3 $4"