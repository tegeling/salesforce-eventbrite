public class EBAttendees {
  public static EBSchema.EBAttendeeList getAttendees(
    String setting,
    String eventId
  ) {
    EBSchema.EBAttendeeList attendeelist = new EBSchema.EBAttendeeList();
    // Get settings from metadata utility class
    String privateToken = 'my_private_token';
    List<Eventbrite_Setting__mdt> settings = (List<Eventbrite_Setting__mdt>) new EBMetadata()
      .getMetadataRecords(
        'SELECT Private_Token__c, Organization_Id__c FROM Eventbrite_Setting__mdt WHERE DeveloperName = \'' +
        setting +
        '\''
      );
    if (settings.size() == 1) {
      privateToken = settings[0].Private_Token__c;
    }

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('callout:Eventbrite/events/' + eventId + '/attendees/');
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization', 'Bearer ' + privateToken);
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
