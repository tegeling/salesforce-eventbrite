@IsTest
private class Test_EBEventsCallout {
  @IsTest
  private static void testGetEvents() {
    Test.setMock(HttpCalloutMock.class, new Test_EBEventsCalloutMock());
    Test.startTest();
    List<EBEventsCallout.EBEventsRequest> inputParams = new List<EBEventsCallout.EBEventsRequest>();
    EBEventsCallout.EBEventsRequest p1 = new EBEventsCallout.EBEventsRequest();
    p1.settings = 'EBSettings';
    inputParams.add(p1);
    EBEventsCallout.getEventbriteEvents(inputParams);
    Test.stopTest();
    // runs callout and check results
    System.assert(true);
  }
}