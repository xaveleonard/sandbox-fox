trigger ContactTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.new.size();
        // Call a utility method from another class
        EmailManager.sendMail('xavier.leonard@accenture.com', 'Trailhead Trigger Tutorial', recordCount + ' contact(s) were inserted.');
    }
    else if(Trigger.isDelete){
        //Process after delete
    }
}