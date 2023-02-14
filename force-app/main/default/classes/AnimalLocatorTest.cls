@isTest
private class AnimalLocatorTest {
    @isTest static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);
        //String contentType = response.getHeader('Content-Type');
        //System.assert(contentType == 'application/json');
        //String actualValue = response.getBody();
        //System.debug(actualValue);
        String expectedValue = 'chicken';
        System.assertEquals(expectedValue, response);
        //System.assertEquals(200, response.GetStatusCode());
    }
}