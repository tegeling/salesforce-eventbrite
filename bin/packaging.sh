sfdx force:package:create --name "Eventbrite Integration" --description "Integrate Salesforce with Eventbrite to sync event and attendee data" --packagetype Unlocked --path force-app --nonamespace --targetdevhubusername devhub

sfdx force:package:version:create --package "Eventbrite Integration" --path force-app --installationkeybypass --wait 20 --codecoverage --targetdevhubusername devhub

sfdx force:package:version:promote --package "Eventbrite Integration@2.0.0-1" --targetdevhubusername devhub

https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5I000001mslhQAA
https://test.salesforce.com/packaging/installPackage.apexp?p0=04t5I000001mslhQAA

