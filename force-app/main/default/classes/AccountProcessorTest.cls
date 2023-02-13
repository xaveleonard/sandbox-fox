@isTest
public class AccountProcessorTest {
    @isTest static void AccountProcessorTest() {
        Account a = new Account( Name = 'TestAccount123');     
        insert a;
        List<Account> acctID = new List<Account>([SELECT Id FROM Account WHERE Name = 'TestAccount123' LIMIT 1 ]);
        Contact c = new Contact( LastName = 'TestContactXYZ', AccountId = acctID[0].Id);
        insert c;
        test.startTest();
        string aID = acctID[0].Id;
        AccountProcessor.countContacts(new List<ID>{aID});
        test.stopTest();
        List<Account> acctCount = new List<Account>([SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :aID]);
        Decimal calculatedCount = acctCount[0].Number_Of_Contacts__c;
        system.assertEquals(1, calculatedCount);
        
    }
}