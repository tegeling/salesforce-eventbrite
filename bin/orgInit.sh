#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create -a eventbrite2 -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push
sfdx force:user:permset:assign -n Eventbrite
sfdx force:org:open -p /lightning/o/EBEvent__c/home
echo "Org is set up"