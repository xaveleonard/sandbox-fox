public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String surname) {
        List<Contact> contactsToInsert = new List<Contact>();
        for(Integer i=0; i<numContacts; i++){
            
            Contact ct = new Contact(FirstName = 'Test ' + (i+1), LastName = surname);
            contactsToInsert.add(ct);
        }
        insert contactsToInsert;
        System.debug('**** contacts inserted: ' + contactsToInsert);
        return contactsToInsert;
    }
}