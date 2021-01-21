public class EBEvents {
  public static EBSchema.EBEventsList getEvents(String setting) {
    EBSchema.EBEventsList eventslist = new EBSchema.EBEventsList();
    // Get settings from metadata utility class
    String privateToken = 'my_private_token';
    String organizationId = 'my_organization_id';
    List<Eventbrite_Setting__mdt> settings = (List<Eventbrite_Setting__mdt>) new EBMetadata()
      .getMetadataRecords(
        'SELECT Private_Token__c, Organization_Id__c FROM Eventbrite_Setting__mdt WHERE DeveloperName = \'' +
        setting +
        '\''
      );
    if (settings.size() == 1) {
      privateToken = settings[0].Private_Token__c;
      organizationId = settings[0].Organization_Id__c;
    }

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'callout:Eventbrite/organizations/' +
      organizationId +
      '/events/'
    );
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization', 'Bearer ' + privateToken);
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
