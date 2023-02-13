@isTest 
private class TemperatureConverterTest {
    @isTest static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.FarenheightToCelsius(70);
        System.assertEquals(21.11, celsius);
    }
    @isTest static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.FarenheightToCelsius(32);
        System.assertEquals(0, celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FarenheightToCelsius(212);
        System.assertEquals(100, celsius, 'Boiling point temperature is not expected.');
    }

    @isTest static void testNegativeTemp() {
        Decimal celsius = TemperatureConverter.FarenheightToCelsius(-10);
        System.assertEquals(-23.33, celsius);
    }
}