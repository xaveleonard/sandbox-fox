public class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LastName, LeadSource, Company FROM Lead WHERE LeadSource = '' LIMIT 200];
        List<Lead> leadUpdts = new List<Lead>();
        for(Lead lead:leads){
            lead.LeadSource = 'Dreamforce';
            leadUpdts.add(lead);
        }
        update leadUpdts;
    }
}