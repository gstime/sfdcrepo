public class ChampAvailability {
    	@InvocableMethod(label='Cargospot Availability & Price'description='Provides list of available flights and applicable price for a specific origin-destination for supported airlines.')
    	public static List<ChampAvailabilityResponse> makeCallout(List<ChampAvailabilityRequest> req){
            
            List<ChampAvailabilityResponse> exResList =new List<ChampAvailabilityResponse>();
            ChampAvailabilityResponse exRes =new ChampAvailabilityResponse();
            String endPointUrl='';
            endPointUrl='https://api-gateway.champ.aero/csp/transport-means/v1/availability?accountNumber='+req[0].accountNumber+'&bookingType='+req[0].bookingType+'&carrierCodes='+req[0].carrierCodes+'&originAirportCode='+req[0].originAirportCode+'&destinationAirportCode='+req[0].destinationAirportCode+'&departureOn='+req[0].departureOn+'&weight='+req[0].weight;
        	System.debug(endPointUrl);
            
        	Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endPointUrl);
            request.setMethod('GET');
            request.setHeader('accept', 'application/json');
            request.setHeader('apikey', '86SJGNwRVnaK0864pugIbkYMPNxrAk5E');
            request.setHeader('Accept', 'application/json');
            
            HttpResponse response = http.send(request);
            // Parse the JSON response
            if(response.getStatusCode() == 200) {
                try{
                   String jsonString=response.getBody();
                   jsonString=jsonString.replace('"date":', '"date_x":');
                   jsonString=jsonString.replace('"number":', '"number_x":');
                   jsonString=jsonString.replace('"currency":', '"currency_x":');
                   jsonString=jsonString.replace('"_links":', '"links":');
                   jsonString=jsonString.replace('"cls__links":', '"cls_links":');
                   exRes = (ChampAvailabilityResponse)JSON.deserialize(jsonString,ChampAvailabilityResponse.class);
                   exResList.add(exRes);
                    System.debug(exResList);
                   /* for(ChampAvailabilityResponse.cls_routes r:exRes.routes){
                        for(ChampAvailabilityResponse.cls_segments sg:r.segments){
                           // System.debug(sg.transportMeans);
                        }
                    }*/
                     ChampBookingRequest bookingReq=new ChampBookingRequest();
                    ChampBookingRequest.cls_airWaybill cbwb=new ChampBookingRequest.cls_airWaybill();
                    cbwb.prefix='047';
                    cbwb.serial='34254216';
                    cbwb.referenceType='AIR WAYBILL';
                    bookingReq.airWaybill=cbwb;
                    bookingReq.agentAccountNumber='57450119112';
                    bookingReq.salesAreaCode='AMS';
                    bookingReq.originAirportCode='OPO';
                    bookingReq.destinationAirportCode='LIS';
                    bookingReq.reference='RJREF01';
                    bookingReq.pieces=1;
                    ChampBookingRequest.cls_weight cbrw=new ChampBookingRequest.cls_weight();
                    cbrw.amount=100;
                    cbrw.unit='KG';
                    ChampBookingRequest.cls_volume cbrv=new  ChampBookingRequest.cls_volume();
                    cbrv.amount=1;
                    cbrv.unit='MC';
                    bookingReq.weight=cbrw;
                    bookingReq.volume=cbrv;
                    bookingReq.natureOfGoods='CONSOL';
                    bookingReq.freightChargeType='Prepaid';
                   
                    ChampBookingRequest.cls_segments cbs=new ChampBookingRequest.cls_segments();
                    cbs.destinationAirportCode='LIS';
                    cbs.originAirportCode='OPO';
                    cbs.pieces=1;
                    cbs.spaceAllocationCode='NN';
                    
                   	ChampBookingRequest.cls_transportMeans cbt=new ChampBookingRequest.cls_transportMeans();
                    cbt.carrierCode='TP';
                    cbt.reqNumber='1939';
                    cbt.reqDate='2025-04-19';
                    
                    ChampBookingRequest.cls_weight cbw=new ChampBookingRequest.cls_weight();
                    cbw.amount=100;
                    cbw.unit='KG';
                    
                    ChampBookingRequest.cls_volume cbv=new ChampBookingRequest.cls_volume();
                    cbv.amount=1;
                    cbv.unit='MC';
                    
                    cbs.transportMeans=cbt;
                    cbs.weight=cbw;
                    cbs.volume=cbv;
                    
                   	List<ChampBookingRequest.cls_segments> cbsList=new List<ChampBookingRequest.cls_segments>();
                    cbsList.add(cbs);
                    bookingReq.segments=cbsList;
                    
                    ChampBookingRequest.cls_adhocPrice cba=new ChampBookingRequest.cls_adhocPrice();
                    cba.allInRate=false;
                    cba.calculationWeightType='Chargeable';
                    cba.currencyCode='EUR';
                    cba.rate=5;
                    cba.contact='+65 80000002';
                    
                    List<ChampBookingRequest.cls_adhocPrice> cbaList=new List<ChampBookingRequest.cls_adhocPrice>();
                    cbaList.add(cba);
                    
                    bookingReq.adhocPrice=cbaList;
                    
                    System.debug(bookingReq);
                    List<ChampBookingRequest> bookingReqList=new List<ChampBookingRequest>();
                    bookingReqList.add(bookingReq);
                    List<String> bookingAPIResponse=ChampBooking.makeBookingCallout(bookingReqList);
                    if(bookingAPIResponse!=null){
                       System.debug('### booking response ###'+bookingAPIResponse[0]); 
                    }
                }catch(Exception e){
                  System.debug('### SOMETHING WENT WORING ###'+e);  
                }
            } else {
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            } 
        return exResList;
    }
}