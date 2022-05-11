public class HolidayUtil {
    public class CustomException extends Exception {}

    public static HttpResponse getHolidays(String currentYear) {
        HttpResponse result = null;
        HttpRequest req = new HttpRequest();
        Http http = new Http();

        try {
            if(String.isEmpty(currentYear)){
                throw new CustomException('Parameter is needed - String Current Year');
            }

            req.setEndpoint('callout:BrasilApiFeriados/' + currentYear);
            req.setMethod('GET');
        
            result = http.send(req);
            if(result.getStatusCode() == 200){
                System.debug('Call successfull! ' + result + ' Status Code: ' + result.getStatusCode());
            }else{
                System.debug('Call failed! ' + result + ' Status Code: ' + result.getStatusCode());
            } 
        } catch( System.Exception ex ) {
            System.debug('Call Exception:' + ex.getMessage());
            System.debug('Call Stack Trace:' + ex.getStackTraceString());
            result = null;
        }
        
        return result;
    }
}