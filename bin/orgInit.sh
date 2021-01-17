#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create -a geotesting -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push
sfdx force:user:permset:assign -n Geocoding
sfdx force:data:tree:import --plan ./data/Anlagen__c-plan.json
sfdx force:org:open -p /lightning/n/Geocoding_Search
echo "Org is set up"