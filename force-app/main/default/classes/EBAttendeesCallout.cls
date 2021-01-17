public class EBAttendeesCallout {
  @future(callout=true)
  public static void getAttendees(String settings, String eventId) {
    EBSchema.EBAttendeeList attendeelist = EBAttendees.getAttendees(
      settings,
      eventId
    );
    System.debug(
      '#### total number of attendees: ' + attendeelist?.attendees.size()
    );
    for (EBSchema.EBAttendees att : attendeelist?.attendees) {
      System.debug('#### Attendee id: ' + att?.id);
      System.debug('#### Attendee changed: ' + att?.changed);
      System.debug('#### Attendee created: ' + att?.created);
      System.debug('#### Attendee quantity: ' + att?.quantity);
      System.debug('#### Attendee first_name: ' + att?.profile.first_name);
      System.debug('#### Attendee last_name: ' + att?.profile.last_name);
      System.debug('#### Attendee email: ' + att?.profile.email);
      System.debug('#### Attendee status: ' + att?.status);
      System.debug(
        '#### Attendee ticket_class_name: ' + att?.ticket_class_name
      );
      System.debug('#### Attendee event_id: ' + att?.event_id);
      System.debug('#### Attendee order_id: ' + att?.order_id);
      System.debug('#### Attendee ticket_class_id: ' + att?.ticket_class_id);
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
