public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<ID> recordIds) {
        List<Account> accts = new List<Account>([SELECT Id, Name, Number_Of_Contacts__c FROM Account WHERE Id IN : recordIds]);
        system.debug('*** Account Ids found: ' + accts);
        List<Contact> conList = new List<Contact>([SELECT Id, AccountId FROM Contact WHERE AccountId IN : recordIds]);
        system.debug('*** Contact Ids found: ' + conList);
        List<Account> acctsToUpdate = new List<Account>();
        for( Account a : accts){
            Integer numOfContacts = 0;
            for (Contact c : conList){
                if(c.AccountId == a.Id){
                    numOfContacts++; 
                }
            }
            system.debug('*** Counted Number of Contacts: ' + numOfContacts);
            a.Number_Of_Contacts__c = numOfContacts;
            acctsToUpdate.add(a);
            system.debug('**** Account ' + a.Name + 'has a total of ' + a.Number_Of_Contacts__c + ' Contacts ****');
        }
        update acctsToUpdate;
    }
}