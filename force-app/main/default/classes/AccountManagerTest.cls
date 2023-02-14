@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acct = AccountManager.getAccount();
        // Verify results
        System.assert(acct != null);
        System.assertEquals('Dickenson plc', acct.name);
    }
    //helper
    static Id createTestRecord() {
        // Create test record
        Account acctTest = new Account(Name='Test account');
        insert acctTest;
        Contact ctTest = new Contact(LastName = 'TestContact', AccountId = acctTest.Id);
        return acctTest.Id;
    }
}