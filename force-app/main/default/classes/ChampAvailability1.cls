public class ChampAvailability1 {
    	//@InvocableMethod(label='Availablity' iconName='resource:myPackageNamespace__google:top')
    	public static void makeCallout(){
            String endPointUrl='';
            String accountNumber='64472700003';
            String bookingType='S';
            String carrierCodes='TP';
            String originAirportCode='OPO';
            String destinationAirportCode='AMS';
            String departureOn='2025-04-19';
            Double weight=58;
            endPointUrl='https://api-gateway.champ.aero/csp/transport-means/v1/availability?accountNumber='+accountNumber+'&bookingType='+bookingType+'&carrierCodes='+carrierCodes+'&originAirportCode='+originAirportCode+'&destinationAirportCode='+destinationAirportCode+'&departureOn='+departureOn+'&weight='+weight;
        	System.debug(endPointUrl);
            ChampAvailabilityResponse exRes =new ChampAvailabilityResponse();
        	Http http = new Http();
            HttpRequest request = new HttpRequest();
            //request.setEndpoint('https://api-gateway.champ.aero/csp/transport-means/v1/availability?accountNumber=78453124633&bookingType=S&carrierCodes=XS&originAirportCode=SIN&destinationAirportCode=LHR&departureOn=2020-12-25&weight=150.5');
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
                    
                   //System.debug(jsonString);
                    //ChampAvailabilityResponse.routes r=exRes.routes;
                    /*for(Integer i=0; i<exRes.routes.size();i++){
                        //cls_segments sg=new cls_segments();
            			 //System.debug(exRes.routes[i].segments.size());
                        for(Integer j=0; j<exRes.routes[i].segments.size();j++){
                             ChampAvailabilityResponse.cls_onload ld=exRes.routes[i].segments[j].onload;
                          //System.debug(exRes.routes[i].segments[j].onload.code);  
                        }
        			}*/
                    //System.debug(exRes.routes.size());
                    //Call booking service 
                    ChampBookingRequest bookingReq=new ChampBookingRequest();
                    ChampBookingRequest.cls_airWaybill cbwb=new ChampBookingRequest.cls_airWaybill();
                    cbwb.prefix='047';
                    cbwb.serial='34245326';
                    cbwb.referenceType='AIR WAYBILL';
                    bookingReq.airWaybill=cbwb;
                    bookingReq.agentAccountNumber='57450119112';
                    bookingReq.salesAreaCode='SIN';
                    bookingReq.originAirportCode='SIN';
                    bookingReq.destinationAirportCode='LHR';
                    bookingReq.reference='RJREF01';
                    bookingReq.pieces=1;
                    ChampBookingRequest.cls_weight cbrw=new ChampBookingRequest.cls_weight();
                    cbrw.amount=150;
                    cbrw.unit='KG';
                    ChampBookingRequest.cls_volume cbrv=new  ChampBookingRequest.cls_volume();
                    cbrv.amount=1;
                    cbrv.unit='MC';
                    bookingReq.weight=cbrw;
                    bookingReq.volume=cbrv;
                    bookingReq.natureOfGoods='CONSOL';
                    bookingReq.freightChargeType='Prepaid';
                   
                    ChampBookingRequest.cls_segments cbs=new ChampBookingRequest.cls_segments();
                    cbs.destinationAirportCode='SIN';
                    cbs.originAirportCode='LHR';
                    cbs.pieces=1;
                    
                   	ChampBookingRequest.cls_transportMeans cbt=new ChampBookingRequest.cls_transportMeans();
                    cbt.carrierCode='TP';
                    cbt.reqDate='675';
                    cbt.reqNumber='2025-04-13';
                    
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
                    String str = JSON.serialize(bookingReq);
                    System.debug('--str--'+str);
                    
                    for(ChampAvailabilityResponse.cls_routes r:exRes.routes){
                        for(ChampAvailabilityResponse.cls_segments sg:r.segments){
                            System.debug(sg.transportMeans);
                        }
                    }
                    String bookingAPIResponse=ChampBooking.makeBookingCallout(bookingReq);
                    System.debug('--bookingAPIResponse--'+bookingAPIResponse);
                }catch(Exception e){
                  System.debug('--Error--'+e);  
                }
            } else {
                //System.debug(response.getBody());
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            }
        
        //return exRes;
    }
}