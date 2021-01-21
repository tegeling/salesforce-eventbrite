public with sharing class EBMetadata {
  @testvisible
  static private Map<String, List<SObject>> mdtRecordMap = new Map<String, List<SObject>>();

  public List<SObject> getMetadataRecords(String query) {
    if (!mdtRecordMap.containsKey(query)) {
      mdtRecordMap.put(query, Database.query(query));
    }
    return mdtRecordMap.get(query);
  }
}
