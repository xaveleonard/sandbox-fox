trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> trigOpps = [SELECT Id, StageName FROM Opportunity WHERE Id IN: Trigger.New];
    List<Task> followUpTasks = new List<Task>();

    for(Opportunity opp : trigOpps){
        if(opp.StageName == 'Closed Won'){
            followUpTasks.add(new Task( Subject = 'Follow Up Test Task',
                                        WhatId = opp.Id)
                            );
        }
    }
    if(followUpTasks.size() > 0){
        insert followUpTasks;
    }
}