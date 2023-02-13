public  class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM LEAD');
    }

    public void execute(Database.BatchableContext bc, List<Lead> lds){
        //List<Lead> leadsToUpdate = new List <Lead>();
        for(Lead ld : lds){
            ld.LeadSource = 'Dreamforce';
            recordsProcessed++;
        }
        update lds;
    }

    public void finish(Database.BatchableContext bs){
        System.debug('**** ' + recordsProcessed + ' records processed ****');
       // AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bs.getJobId()];
       // EmailUtils.sendMessage(job, recordsProcessed);
    }

}