sfdx force:package:create --name "Geocoding" --description "Geocoding sample app" --packagetype Unlocked --path force-app --nonamespace --targetdevhubusername devhub

sfdx force:package:version:create --package "Geocoding" --path force-app --installationkeybypass --wait 20 --targetdevhubusername devhub

sfdx force:package:version:promote --package Geocoding@2.0.0-1 --targetdevhubusername devhub

https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5I0000019imrQAA
https://test.salesforce.com/packaging/installPackage.apexp?p0=04t5I0000019imrQAA

