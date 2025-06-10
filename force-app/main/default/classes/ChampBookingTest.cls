@isTest(seeAllData=false)
public class ChampBookingTest {
	@TestSetup
    static void makeData(){
        
        
        insert new Group(Name='ATL-Ops', DeveloperName='Test');
        
        Profile p = [Select Id from Profile WHERE Name = 'System Administrator'];
        
        User usr = new User();
        usr.FirstName = 'Test User';
        usr.LastName = 'Number One';
        usr.Email = 'test@test.tap.com';
        usr.Username = 'test@test.tap.com';
        usr.Alias = 'tester';
        //usr.ContactId = con.Id;
        usr.ProfileId = p.Id;
        usr.TimeZoneSidKey    = 'America/Denver';
        usr.LocaleSidKey      = 'en_US';
        usr.EmailEncodingKey  = 'UTF-8';
        usr.LanguageLocaleKey = 'en_US';
        insert usr;        
    }
    @isTest
    static void makeCalloutTest() {
       	String payLoad=		'{'+
		'      "airWaybill":{'+
		'         "referenceType": "AIR WAYBILL",'+
		'         "prefix":"047",'+
		'         "serial": "34245326"'+
		'      },'+
		'      "agentAccountNumber": "57450119112",'+
		'      "salesAreaCode":"AMS",'+
		'      "originAirportCode":"AMS",'+
		'      "destinationAirportCode":"LIS",'+
		'      "reference": "RJREF01",'+
		'      "pieces":1,'+
		'      "weight":{'+
		'         "amount":100,'+
		'         "unit":"KG"'+
		'      },'+
		'      "volume": {'+
		'        "amount": 1,'+
		'        "unit": "MC"'+
		'      },      '+
		'      "natureOfGoods":"CONSOL",'+
		'      "freightChargeType":"Prepaid",'+
		'      "segments":['+
		'         {'+
		'            "originAirportCode":"AMS",'+
		'            "destinationAirportCode":"LIS",'+
		'            "transportMeans":{'+
		'               "carrierCode":"TP",'+
		'               "number":"675",'+
		'               "date":"2025-04-13"'+
		'            },'+
		'            "spaceAllocationCode":"NN",'+
		'            "pieces":1,'+
		'            "weight":{'+
		'               "amount":100,'+
		'               "unit":"KG"'+
		'            },   '+
		'            "volume": {'+
		'            "amount": 1,'+
		'            "unit": "MC"'+
		'            }              '+
		'         }'+
		'      ],'+
		'        "specialHandlingCodes": ['+
		'        "PER"'+
		'      ],'+
		'      "handlingRemarks": ['+
		'          "Handling for the heavy cargo items - line1.",'+
		'          "Handling for the heavy cargo items - line2."'+
		'      ],'+
		'      "OSIRemarks": ['+
		'        "Must be stored upright1 - other service information from external",'+
		'        "Must be stored upright2 - other service information from external"'+
		'      ],'+
		'      "remarks": "Free text captured as remarks",'+
		'      "adhocPrice": ['+
		'        {'+
		'            "allInRate": false,'+
		'            "calculationWeightType": "Chargeable",'+
		'            "currencyCode": "EUR",'+
		'            "contact": "+65 80000002"'+
		'        }'+
		'      ]'+
		'    }';
        User u=[SELECT ID FROM USER LIMIT 1];
        System.runAs(u) {
            
            ChampBookingRequest bookingReq=(ChampBookingRequest)JSON.deserialize(payLoad,ChampBookingRequest.class);
            List<ChampBookingRequest> bookingReqList=new List<ChampBookingRequest>();
            bookingReqList.add(bookingReq);
                
            Test.setMock(HttpCalloutMock.class, new AvailabilityHttpCalloutMock());
            Test.startTest();
            List<String> bookingAPIResponse=ChampBooking.makeBookingCallout(bookingReqList);
            ChampBookingRequest.parse(payLoad);
            Test.stopTest();
            System.assert(bookingAPIResponse != null);
        }
	}
}