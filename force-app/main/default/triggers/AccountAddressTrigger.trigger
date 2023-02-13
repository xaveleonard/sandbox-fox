trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account a: Trigger.new){
        if(a.Match_Billing_Address__c){
             a.ShippingPostalCode = a.BillingPostalCode;
        }
        system.debug('****Address Updated on Account with ID = ' + a.Id + '****');

    }

}