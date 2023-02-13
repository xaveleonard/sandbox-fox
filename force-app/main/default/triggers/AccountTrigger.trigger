trigger AccountTrigger on Account (after insert, after update) {
    List<Opportunity> oppList = new List <Opportunity>();
    // Get the related opptys for the accounts in this trigger
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new]);
    // Add an oppty for each account if it doesn't already have one
    // Iterate through each account

    for (Account a :Trigger.new){
        System.debug('acctswithOpps.get(a.Id).Opportunities.size()=' + acctswithOpps.get(a.Id).Opportunities.size());
        //Check if the account already has a related oppty
        if(acctsWithOpps.get(a.Id).Opportunities.size() == 0){
            //if it doesn't, add a default oppty
            oppList.add(new Opportunity(Name        = a.Name + ' Opportunity',
                                        StageName   = 'Prospecting',
                                        CloseDate   = system.today().addMonths(1),
                                        AccountId   = a.Id
                                        )
                        ); 
        }
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
    else {
        system.debug('***account trigger has not created an oppty***');
    }
    
}