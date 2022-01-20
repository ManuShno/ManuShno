#!/bin/bash
services=(platform pipeline linkage reference data_dictionary data_request document person project publication intellectual_property organisation unit event clinical_quality migration)
for service in ${services[*]}; do
    docker exec rode_ds_$service bash /.backup/dump.sh $service
done