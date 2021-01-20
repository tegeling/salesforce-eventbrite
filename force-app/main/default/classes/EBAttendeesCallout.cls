public class EBAttendeesCallout {
  @future(callout=true)
  public static void getAttendees(String settings, String eventId) {
    EBSchema.EBAttendeeList attendeelist = EBAttendees.getAttendees(
      settings,
      eventId
    );
    List<EBAttendee__c> newAttendees = new List<EBAttendee__c>();
    List<EBEvent__c> relatedEvent = [
      SELECT Id
      FROM EBEvent__c
      WHERE eventid__c = :eventId
    ];
    if (attendeelist.attendees != null && relatedEvent.size() == 1) {
      for (EBSchema.EBAttendees att : attendeelist?.attendees) {
        EBAttendee__c newAtt = new EBAttendee__c();
        newAtt.id__c = att?.id;
        newAtt.Name = att?.profile?.eventname;
        newAtt.changed__c = att?.changed;
        newAtt.created__c = att?.created;
        newAtt.quantity__c = att?.quantity;
        newAtt.first_name__c = att?.profile?.first_name;
        newAtt.last_name__c = att?.profile?.last_name;
        newAtt.email__c = att?.profile?.email;
        newAtt.status__c = att?.status;
        newAtt.ticket_class_name__c = att?.ticket_class_name;
        newAtt.ticket_class_id__c = att?.ticket_class_id;
        newAtt.event_id__c = att?.event_id;
        newAtt.order_id__c = att?.order_id;
        newAtt.EBEvent__c = relatedEvent[0]?.Id;
        newAttendees.add(newAtt);
      }
    }
    try {
      upsert newAttendees id__c;
    } catch (DmlException e) {
      System.debug(e.getMessage());
    }
  }

  public class EBAttendeesRequest {
    @InvocableVariable(
      label='Eventbrite Settings'
      description='Developer API Name'
      required=true
    )
    public String settings;

    @InvocableVariable(
      label='Eventbrite Events Id'
      description='Which event attendees will be retrieved?'
      required=true
    )
    public String eventId;
  }

  @InvocableMethod(label='Get Eventbrite Attendees')
  public static void getEventbriteAttendees(
    List<EBAttendeesRequest> inputParams
  ) {
    for (EBAttendeesRequest p : inputParams) {
      getAttendees(p.settings, p.eventId);
    }
  }
}
