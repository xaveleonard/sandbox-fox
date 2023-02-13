public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact record, string stAb) {
        this.contact = record;
        this.state = stAb;
    }

    public void execute(QueueableContext context){
        List<Account> accounts = new List<Account>([SELECT Id, Name FROM Account WHERE BillingState = :state LIMIT 200]);
        List<Contact> contacts = new List<Contact>();
        for (Account account : accounts){
            Contact cnt = contact.clone();
            cnt.AccountId = account.Id;
            contacts.add(cnt);
        }

        if(contacts.size() > 0){
            insert contacts;
        }
    }
}