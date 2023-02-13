@isTest
private class LeadProcessorTest {
    @TestSetup
    static void setup() {
    List<Lead> leads = new List<Lead>();
    for(Integer i =0;i<200;i++){
        String testString = 'Lead ' + i;
        leads.add(new Lead(LastName = testString, Company = testString));
    }
    insert leads;
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor lpt = new LeadProcessor();
        Id batchId = Database.executeBatch(lpt);
        Test.stopTest();

        system.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}