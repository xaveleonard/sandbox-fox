@isTest
public class ParkLocatorTest {
    @isTest
    public static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'Japan';
        List<String> expected = new String[]{'Shiretoko National Park','Oze National Park','Hakusan National Park'};
        List<String> results = ParkLocator.country(country);
        System.assertEquals(expected, results);
    }
}