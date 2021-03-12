public class BasicCallOut {
    public static HttpResponse makeGetCallout(String foo1, String foo2) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://postman-echo.com/get?foo1='+foo1+'&foo2='+foo2);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug('Response recieved:'+ results);
            }else{
                system.debug('Response Failed with code:'+response.getStatusCode());
            }
   		return response;
	}
}