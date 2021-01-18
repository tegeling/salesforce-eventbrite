public class EBAttendees {
  public static EBSchema.EBAttendeeList getAttendees(
    String setting,
    String eventId
  ) {
    EBSchema.EBAttendeeList attendeelist = new EBSchema.EBAttendeeList();
    // Get settings from metadata
    Eventbrite_Setting__mdt settings = [
      SELECT Private_Token__c, Organization_Id__c
      FROM Eventbrite_Setting__mdt
      WHERE DeveloperName = :setting
    ];

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:Eventbrite/events/' + eventId + '/attendees/');
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization', 'Bearer ' + settings.Private_Token__c);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200 && response.getBody().length() > 0) {
      String responseJSON = EBUtilities.formatBody(response.getBody());
      attendeelist = (EBSchema.EBAttendeeList) JSON.deserialize(
        responseJSON,
        EBSchema.EBAttendeeList.class
      );
    }
    return attendeelist;
  }
}
