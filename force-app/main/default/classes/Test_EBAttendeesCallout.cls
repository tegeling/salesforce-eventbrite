@IsTest
private class Test_EBAttendeesCallout {
  @IsTest
  private static void testGetAttendeesNoData() {
    Test.setMock(HttpCalloutMock.class, new Test_EBAttendeesCalloutMock());
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
    List<EBAttendeesCallout.EBAttendeesRequest> inputParams = new List<EBAttendeesCallout.EBAttendeesRequest>();
    EBAttendeesCallout.EBAttendeesRequest p1 = new EBAttendeesCallout.EBAttendeesRequest();
    p1.settings = 'EBSettings';
    p1.eventId = 'event_id';
    inputParams.add(p1);
    EBAttendeesCallout.getEventbriteAttendees(inputParams);
    Test.stopTest();
    // runs callout and check results
    List<EBAttendee__c> allattendees = [SELECT Id FROM EBAttendee__c];
    System.assertEquals(allattendees.size(), 0, 'Expected record size is 0.');
  }

  @IsTest
  private static void testGetAttendeesWithData() {
    Test.setMock(
      HttpCalloutMock.class,
      new Test_EBAttendeesCalloutMockWithData()
    );
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
    List<EBAttendeesCallout.EBAttendeesRequest> inputParams = new List<EBAttendeesCallout.EBAttendeesRequest>();
    EBAttendeesCallout.EBAttendeesRequest p1 = new EBAttendeesCallout.EBAttendeesRequest();
    p1.settings = 'EBSettings';
    p1.eventId = 'event_id';
    inputParams.add(p1);
    EBEvent__c evt = new EBEvent__c();
    evt.eventid__c = 'event_id';
    insert evt;
    EBAttendeesCallout.getEventbriteAttendees(inputParams);
    Test.stopTest();
    // runs callout and check results
    List<EBAttendee__c> allattendees = [SELECT Id FROM EBAttendee__c];
    System.assertEquals(allattendees.size(), 1, 'Expected record size is 1.');
  }
}
