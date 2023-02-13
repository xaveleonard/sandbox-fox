public class TemperatureConverter {
    // Takes a Fahrenheit temp and returns celcius equivalent
    public static Decimal FarenheightToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}