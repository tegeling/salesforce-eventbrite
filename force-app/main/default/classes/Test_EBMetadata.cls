@isTest
public with sharing class Test_EBMetadata {
  @IsTest
  private static void testGetMetadataRecords() {
    List<SObject> mdtRecords;
    Test.startTest();
    mdtRecords = new EBMetadata()
      .getMetadataRecords('SELECT MasterLabel from Eventbrite_Setting__mdt');
    Test.stopTest();
    System.assertEquals(
      mdtRecords.size(),
      [SELECT MasterLabel FROM Eventbrite_Setting__mdt].size(),
      'Size should match'
    );
  }

  public static void setMetadata(String query, List<SObject> records) {
    EBMetadata.mdtRecordMap.put(query, records);
  }
}
