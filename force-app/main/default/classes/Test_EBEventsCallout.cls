@IsTest
private class Test_EBEventsCallout {
  @IsTest
  private static void testGetEventsNoData() {
    Test.setMock(HttpCalloutMock.class, new Test_EBEventsCalloutMock());
    String settingsJSON = '[' + '\n';
    settingsJSON += '{' + '\n';
    settingsJSON += '"DeveloperName": "EBSettings",' + '\n';
    settingsJSON += '"MasterLabel": "EBSettings",' + '\n';
    settingsJSON += '"Private_Token__c": "your_private_token",' + '\n';
    settingsJSON += '"Organization_Id__c": "your_organization_id"' + '\n';
    settingsJSON += '}' + '\n';
    settingsJSON += ']';
    String query = 'SELECT Private_Token__c, Organization_Id__c FROM Eventbrite_Setting__mdt WHERE DeveloperName = \'EBSettings\'';
    Test_EBMetadata.setMetadata(
      query,
      (List<Eventbrite_Setting__mdt>) JSON.deserialize(
        settingsJSON,
        List<Eventbrite_Setting__mdt>.class
      )
    );
    Test.startTest();
    List<EBEventsCallout.EBEventsRequest> inputParams = new List<EBEventsCallout.EBEventsRequest>();
    EBEventsCallout.EBEventsRequest p1 = new EBEventsCallout.EBEventsRequest();
    p1.settings = 'EBSettings';
    inputParams.add(p1);
    EBEventsCallout.getEventbriteEvents(inputParams);
    Test.stopTest();
    // runs callout and check results
    List<EBEvent__c> allevents = [SELECT Id FROM EBEvent__c];
    System.assertEquals(allevents.size(), 0, 'Expected record count is 0.');
  }

  @IsTest
  private static void testGetEventsWithData() {
    Test.setMock(HttpCalloutMock.class, new Test_EBEventsCalloutMockWithData());
    String settingsJSON = '[' + '\n';
    settingsJSON += '{' + '\n';
    settingsJSON += '"DeveloperName": "EBSettings",' + '\n';
    settingsJSON += '"MasterLabel": "EBSettings",' + '\n';
    settingsJSON += '"Private_Token__c": "your_private_token",' + '\n';
    settingsJSON += '"Organization_Id__c": "your_organization_id"' + '\n';
    settingsJSON += '}' + '\n';
    settingsJSON += ']';
    String query = 'SELECT Private_Token__c, Organization_Id__c FROM Eventbrite_Setting__mdt WHERE DeveloperName = \'EBSettings\'';
    Test_EBMetadata.setMetadata(
      query,
      (List<Eventbrite_Setting__mdt>) JSON.deserialize(
        settingsJSON,
        List<Eventbrite_Setting__mdt>.class
      )
    );
    Test.startTest();
    List<EBEventsCallout.EBEventsRequest> inputParams = new List<EBEventsCallout.EBEventsRequest>();
    EBEventsCallout.EBEventsRequest p1 = new EBEventsCallout.EBEventsRequest();
    p1.settings = 'EBSettings';
    inputParams.add(p1);
    EBEventsCallout.getEventbriteEvents(inputParams);
    Test.stopTest();
    // runs callout and check results
    List<EBEvent__c> allevents = [SELECT Id FROM EBEvent__c];
    System.assertEquals(allevents.size(), 1, 'Expected record count is 1.');
  }
}
