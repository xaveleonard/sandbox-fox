@isTest 
private class TestRestrictContactByName {
    
    @isTest
    static void TestInvalidName() {
        Contact ct = new Contact(LastName = 'INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(ct,false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }

    @isTest
    static void TestValidName() {
        Contact ct = new Contact(LastName = 'VALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(ct,false);
        Test.stopTest();
        System.assert(result.isSuccess());
    }
}