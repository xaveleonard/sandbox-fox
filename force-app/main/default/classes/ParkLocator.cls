public class ParkLocator {
    public static List<String> country(String country) {
        parkService.ParksImplPort location = new  parkService.ParksImplPort();
        List<String> result = location.byCountry(country);
        System.debug(result);
        return result;
    }
}