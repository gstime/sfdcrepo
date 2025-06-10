//add a comment for testing 
public class ChampBooking {
    @InvocableMethod(label='Cargospot Availability & Price'description='Provides list of available flights and applicable price for a specific origin-destination for supported airlines.')
	public static List<String> makeBookingCallout(List<ChampBookingRequest> bookingReqList){
        
        String URL='';
        List<String> urlList=new List<String>();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api-gateway.champ.aero/booking/v2/bookings');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('apikey', '86SJGNwRVnaK0864pugIbkYMPNxrAk5E');
        req.setMethod('POST');
        req.setTimeout(120000);

        String rqString = System.JSON.serialize(bookingReqList[0]);
    
        // we need to replace the DateExchange by Date because Date and number is a reserved string
        String finalJson = rqString.replace('reqNumber', 'number');
       	finalJson = finalJson.replace('reqDate', 'date');
        System.debug('### rqString ###'+finalJson);
        req.setBody(finalJson);
 
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        try {
            response = http.send(req);
            if (response.getStatusCode() == 200) {
              URL = 'https://www.tapcargo.com/en/Tracking-Results?countryCode='+bookingReqList[0].airWaybill.prefix+'&consignmentNote='+bookingReqList[0].airWaybill.serial;
    		  System.debug(bookingReqList[0].airWaybill.serial);
        	  System.debug(URL);
              System.debug('### booking ###'+response.getBody());
              urlList.add(URL);
               
            }else{
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()+' '+response.getBody());
            }
            	
        } catch(Exception e) {
            System.debug('### SOMETHING WENT WRONG ###'+e.getMessage());
    	}
        return urlList;
        
    }
}