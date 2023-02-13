@isTest
public class AddPrimaryContactTest {
    @isTest
    static void AddPrimaryContactTest() {
        List<Account> accounts = new List<Account>();

        for(Integer i=0;i<50;i++){
            accounts.add(new Account(BillingState = 'CA', name = 'Test Account CA ' + i));
        }
        for(Integer i=0;i<50;i++){
            accounts.add(new Account(BillingState = 'NY', name = 'Test Account NY ' + i));
        }

        insert accounts;

        Contact ct = new Contact(LastName = 'Test Contact');
        insert ct;

        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact(ct, state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();


        List<Account> caAccounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Name LIKE 'Test Account%' AND BillingState = :state];
        List<Contact> contactList = new List<Contact>();
        for(Account account : caAccounts){
            contactList.add(account.contacts);
        }
        System.assertEquals(50, contactList.size());
    }
}