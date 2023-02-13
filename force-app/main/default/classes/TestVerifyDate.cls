@isTest
private class TestVerifyDate {
    @isTest
    public static void testCloseDate() {
        Date date1 = Date.newInstance(2022,02,13);
        Date date2 = Date.newInstance(2022,02,20);

        Date resDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, resDate, 'dates are not within 30 days');
    }
    @isTest
    public static void testFarDate() {
        Date date1 = Date.newInstance(2022,02,13);
        Date date2 = Date.newInstance(2022,05,20);
        Date endOfMonth = Date.newInstance(2022,02,28);

        Date resDate = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(endOfMonth, resDate, 'test Far Date failed');
    }

    @isTest
    public static void testInvalidDate() {
        Date date1 = Date.newInstance(2022,02,13);
        Date date2 = Date.newInstance(2022,05,20);
        Date endOfMonth = Date.newInstance(2022,05,31);

        Date resDate = VerifyDate.CheckDates(date2,date1);
        System.assertEquals(endOfMonth, resDate, '');
    }
}