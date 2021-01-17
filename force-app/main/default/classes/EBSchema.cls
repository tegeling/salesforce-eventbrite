public class EBSchema {
  public class EBEventsList {
    public EBEvents[] events;
  }

  public class EBAttendeeList {
    public EBAttendees[] attendees;
  }

  public class EBEvents {
    public EBEventsName eventname;
    public EBEventsDescription description;
    public String url;
    public EBEventsStart eventstart;
    public EBEventsEnd eventend;
    public String organization_id;
    public Datetime created;
    public Datetime changed;
    public Datetime published;
    public Long capacity;
    public Boolean capacity_is_custom;
    public String status;
    public Boolean listed;
    public String summary;
    public String id;
  }

  public class EBAttendees {
    public String id;
    public Datetime changed;
    public Datetime created;
    public Long quantity;
    public EBProfile profile;
    public String status;
    public String ticket_class_name;
    public String event_id;
    public String order_id;
    public String ticket_class_id;
  }

  public class EBEventsName {
    public String text;
    public String html;
  }

  public class EBEventsDescription {
    public String text;
    public String html;
  }

  public class EBEventsStart {
    public String timezone;
    public Datetime local;
  }
  public class EBEventsEnd {
    public String timezone;
    public Datetime local;
  }

  public class EBProfile {
    public String first_name;
    public String last_name;
    public String email;
  }
}
