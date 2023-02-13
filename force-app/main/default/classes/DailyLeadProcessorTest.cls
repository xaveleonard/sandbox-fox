@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2023';
    static testmethod void testScheduledJob(){
        
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++){
            Lead l = new Lead(LastName = 'Test Lead ' + i, Company = 'Test Lead' + i);
            leads.add(l);
        }
        insert leads;
        
    Test.startTest();
    String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
    Test.stopTest();
    List<Lead> newLeads = [SELECT Id, LastName, LeadSource, Company FROM Lead WHERE LastName LIKE 'Test Lead%' AND Company LIKE 'Test Lead%' AND LeadSource = 'Dreamforce'];
    System.assertEquals(200, newLeads.size());
    }
}