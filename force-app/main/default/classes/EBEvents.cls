public class EBEvents {
  public static EBSchema.EBEventsList getEvents(String setting) {
    EBSchema.EBEventsList eventslist = new EBSchema.EBEventsList();
    // Get settings from metadata
    Eventbrite_Setting__mdt settings = [
      SELECT Private_Token__c, Organization_Id__c
      FROM Eventbrite_Setting__mdt
      WHERE DeveloperName = :setting
    ];

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'callout:Eventbrite/organizations/' +
      settings.Organization_Id__c +
      '/events/'
    );
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization', 'Bearer ' + settings.Private_Token__c);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    if (response.getStatusCode() == 200 && response.getBody().length() > 0) {
      String responseJSON = EBUtilities.formatBody(response.getBody());
      eventslist = (EBSchema.EBEventsList) JSON.deserialize(
        responseJSON,
        EBSchema.EBEventsList.class
      );
    }
    return eventslist;
  }
}
