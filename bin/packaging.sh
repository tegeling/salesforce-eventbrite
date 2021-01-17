sfdx force:package:create --name "Eventbrite" --description "Integrate Salesforce with Eventbrite to sync event and attendee data" --packagetype Unlocked --path force-app --nonamespace --targetdevhubusername devhub

sfdx force:package:version:create --package "Eventbrite" --path force-app --installationkeybypass --wait 20 --targetdevhubusername devhub

sfdx force:package:version:promote --package Eventbrite@1.0.0-1 --targetdevhubusername devhub

https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5I0000019imrQAA
https://test.salesforce.com/packaging/installPackage.apexp?p0=04t5I0000019imrQAA

