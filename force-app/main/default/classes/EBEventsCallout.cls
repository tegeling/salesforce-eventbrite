public with sharing class EBEventsCallout {
  @future(callout=true)
  public static void getEvents(String settings) {
    EBSchema.EBEventsList eventslist = EBEvents.getEvents(settings);
    List<EBEvent__c> newevents = new List<EBEvent__c>();
    if (eventslist.events != null) {
      for (EBSchema.EBEvents evt : eventslist?.events) {
        EBEvent__c newevt = new EBEvent__c();
        newevt.Name = evt?.eventname?.text;
        newevt.eventid__c = evt?.id;
        newevt.url__c = evt?.url;
        newevt.eventstart__c = evt?.eventstart?.local;
        newevt.eventend__c = evt?.eventend?.local;
        newevt.organization_id__c = evt?.organization_id;
        newevt.created__c = evt?.created;
        newevt.changed__c = evt?.changed;
        newevt.published__c = evt?.published;
        newevt.capacity__c = evt?.capacity;
        newevt.capacity_is_custom__c = evt?.capacity_is_custom;
        newevt.status__c = evt?.status;
        newevt.listed__c = evt?.listed;
        newevt.summary__c = evt?.summary;
        newevents.add(newevt);
      }
    }
    try {
      upsert newevents eventid__c;
    } catch (DmlException e) {
      System.debug(e.getMessage());
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
