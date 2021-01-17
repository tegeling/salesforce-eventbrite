public with sharing class EBEventsCallout {
  @future(callout=true)
  public static void getEvents(String settings) {
    EBSchema.EBEventsList eventslist = EBEvents.getEvents(settings);
    System.debug('#### total number of events: ' + eventslist?.events.size());
    for (EBSchema.EBEvents evt : eventslist?.events) {
      System.debug('#### Event Name: ' + evt?.eventname?.text);
      System.debug('#### Event Description: ' + evt?.description?.text);
      System.debug('#### Event URL: ' + evt?.url);
      System.debug('#### Event Startdate: ' + evt?.eventstart?.local);
      System.debug('#### Event Enddate: ' + evt?.eventend?.local);
      System.debug('#### Event Published: ' + evt?.published);
      System.debug('#### Event Capacity: ' + evt?.capacity);
      System.debug('#### Event Listed: ' + evt?.listed);
      System.debug('#### Event Id: ' + evt?.id);
    }
  }

  public class EBEventsRequest {
    @InvocableVariable(
      label='Eventbrite Settings'
      description='Developer API Name'
      required=true
    )
    public String settings;
  }

  @InvocableMethod(label='Get Eventbrite Events')
  public static void getEventbriteEvents(List<EBEventsRequest> inputParams) {
    for (EBEventsRequest p : inputParams) {
      getEvents(p.settings);
    }
  }
}
