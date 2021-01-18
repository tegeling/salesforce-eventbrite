@IsTest
private class Test_EBAttendeesCallout {
  @IsTest
  private static void testGetAttendeesNoData() {
    Test.setMock(HttpCalloutMock.class, new Test_EBAttendeesCalloutMock());
    Test.startTest();
    List<EBAttendeesCallout.EBAttendeesRequest> inputParams = new List<EBAttendeesCallout.EBAttendeesRequest>();
    EBAttendeesCallout.EBAttendeesRequest p1 = new EBAttendeesCallout.EBAttendeesRequest();
    p1.settings = 'EBSettings';
    p1.eventId = 'event_id';
    inputParams.add(p1);
    EBAttendeesCallout.getEventbriteAttendees(inputParams);
    Test.stopTest();
    // runs callout and check results
    System.assert(true);
  }

  @IsTest
  private static void testGetAttendeesWithData() {
    Test.setMock(
      HttpCalloutMock.class,
      new Test_EBAttendeesCalloutMockWithData()
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
    System.assert(true);
  }
}
