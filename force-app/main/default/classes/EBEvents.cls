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
      String responseHTML = response.getBody();
      String indexStart = '<pre><code class="language-json">';
      String indexEnd = '</code></pre>';
      String responseEscaped = responseHTML.substring(
        responseHTML.indexOf(indexStart) + indexStart.length(),
        responseHTML.indexOf(indexEnd)
      );
      // iterate through all line and remove line when match with "resource_uri"
      // required because invalid JSON
      List<String> responseJSONAllLines = responseEscaped.unescapeHtml4()
        .split('\n');
      String responseJSON = '';
      String match = '"resource_uri"';
      for (String line : responseJSONAllLines) {
        if (!line.contains(match)) {
          responseJSON += line;
        }
      }
      responseJSON = responseJSON.replace('"name"', '"eventname"');
      responseJSON = responseJSON.replace('"start"', '"eventstart"');
      responseJSON = responseJSON.replace('"end"', '"eventend"');

      eventslist = (EBSchema.EBEventsList) JSON.deserialize(
        responseJSON,
        EBSchema.EBEventsList.class
      );
    }
    return eventslist;
  }
}