@isTest(seeAllData=false)
public class ChampAvailabilityTest {
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
        String 	payLoad=		'{'+
		'    "routes": ['+
		'        {'+
		'            "segments": ['+
		'                {'+
		'                    "onload": {'+
		'                        "code": "SIN",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Changi International Airport",'+
		'                        "timeArea": "Asia/Singapore"'+
		'                    },'+
		'                    "offload": {'+
		'                        "code": "COK",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Cochin International Airport",'+
		'                        "timeArea": "Asia/Kolkata"'+
		'                    },'+
		'                    "transportMeans": {'+
		'                        "id": "25847692",'+
		'                        "reference": "XS769/06SEP",'+
		'                        "date": "2020-09-06",'+
		'                        "mode": "AIR",'+
		'                        "carrier": {'+
		'                            "code": "XS"'+
		'                        },'+
		'                        "transportNumber": "769",'+
		'                        "scheduledDeparture": "2020-09-06T16:40:00",'+
		'                        "scheduledArrival": "2020-09-06T19:05:00",'+
		'                        "type": {'+
		'                            "code": "77W"'+
		'                        }'+
		'                    }'+
		'                }'+
		'            ],'+
		'            "price": {'+
		'                "amount": 1025.5,'+
		'                "currency": {'+
		'                    "code": "SGD",'+
		'                    "name": "Singapore Dollars"'+
		'                },'+
		'                "type": "Street"'+
		'            }'+
		'        },'+
		'        {'+
		'            "segments": ['+
		'                {'+
		'                    "onload": {'+
		'                        "code": "SIN",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Changi International Airport",'+
		'                        "timeArea": "Asia/Singapore"'+
		'                    },'+
		'                    "offload": {'+
		'                        "code": "COK",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Cochin International Airport",'+
		'                        "timeArea": "Asia/Kolkata"'+
		'                    },'+
		'                    "transportMeans": {'+
		'                        "id": "25847692",'+
		'                        "reference": "XS765/06SEP",'+
		'                        "date": "2020-09-06",'+
		'                        "mode": "AIR",'+
		'                        "carrier": {'+
		'                            "code": "XS"'+
		'                        },'+
		'                        "transportNumber": "765",'+
		'                        "scheduledDeparture": "2020-09-06T20:55:00",'+
		'                        "scheduledArrival": "2020-09-06T23:10:00",'+
		'                        "type": {'+
		'                            "code": "777"'+
		'                        }'+
		'                    }'+
		'                }'+
		'            ],'+
		'            "price": {'+
		'                "amount": 950,'+
		'                "currency": {'+
		'                    "code": "SGD",'+
		'                    "name": "Singapore Dollars"'+
		'                },'+
		'                "type": "Street"'+
		'            }'+
		'        },'+
		'        {'+
		'            "segments": ['+
		'                {'+
		'                    "onload": {'+
		'                        "code": "SIN",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Changi International Airport",'+
		'                        "timeArea": "Asia/Singapore"'+
		'                    },'+
		'                    "offload": {'+
		'                        "code": "KUL",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Kuala Lumpur International Airport",'+
		'                        "timeArea": "Asia/Kuala_Lumpur"'+
		'                    },'+
		'                    "transportMeans": {'+
		'                        "id": "25847692",'+
		'                        "reference": "XS540/06SEP",'+
		'                        "date": "2020-09-06",'+
		'                        "mode": "AIR",'+
		'                        "carrier": {'+
		'                            "code": "XS"'+
		'                        },'+
		'                        "transportNumber": "540",'+
		'                        "scheduledDeparture": "2020-09-06T10:25:00",'+
		'                        "scheduledArrival": "2020-09-06T11:20:00",'+
		'                        "type": {'+
		'                            "code": "777"'+
		'                        }'+
		'                    }'+
		'                },'+
		'                {'+
		'                    "onload": {'+
		'                        "code": "KUL",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Kuala Lumpur International Airport",'+
		'                        "timeArea": "Asia/Kuala_Lumpur"'+
		'                    },'+
		'                    "offload": {'+
		'                        "code": "COK",'+
		'                        "type": "AIRPORT",'+
		'                        "name": "Cochin International Airport",'+
		'                        "timeArea": "Asia/Kolkota"'+
		'                    },'+
		'                    "transportMeans": {'+
		'                        "id": "25847692",'+
		'                        "reference": "XS369/06SEP",'+
		'                        "date": "2020-09-06",'+
		'                        "mode": "AIR",'+
		'                        "carrier": {'+
		'                            "code": "XS"'+
		'                        },'+
		'                        "transportNumber": "369",'+
		'                        "scheduledDeparture": "2020-09-06T14:10:00",'+
		'                        "scheduledArrival": "2020-09-06T15:45:00",'+
		'                        "type": {'+
		'                            "code": "777"'+
		'                        }'+
		'                    }'+
		'                }'+
		'            ],'+
		'            "price": {'+
		'                "amount": 1150,'+
		'                "currency": {'+
		'                    "code": "SGD",'+
		'                    "name": "Singapore Dollars"'+
		'                },'+
		'                "type": "Street"'+
		'            }'+
		'        }'+
		'    ],'+
		'    "_links": {'+
		'        "self": {'+
		'            "href": "https://api-gateway.champ.aero/csp/transport-means/v1/availability?accountNumber=78453124633&bookingType=S&carrierCodes=XS&originAirportCode=SIN&destinationAirportCode=LHR&departureOn=2020-12-25&weight=150.5"'+
		'        }'+
		'    },'+
		'    "page": {'+
		'        "number": 1,'+
		'        "size": 10,'+
		'        "totalPages": 1,'+
		'        "totalElements": 3'+
		'    }'+
		'}';
        User u=[SELECT ID FROM USER LIMIT 1];
        System.runAs(u) {
            ChampAvailabilityRequest req=new ChampAvailabilityRequest();
            req.accountNumber='64472700003';
            req.bookingType='S';
            req.carrierCodes='TP';
            req.originAirportCode='OPO';
            req.destinationAirportCode='AMS';
            req.departureOn='2025-04-19';
            req.weight=58;
            List<ChampAvailabilityRequest> reqList=new List<ChampAvailabilityRequest>();
            reqList.add(req);
            
            Test.setMock(HttpCalloutMock.class, new AvailabilityHttpCalloutMock());
            Test.startTest();
            List<ChampAvailabilityResponse> response = ChampAvailability.makeCallout(reqList);
            ChampAvailabilityRequest.parse(System.JSON.serialize(req));
            ChampAvailabilityResponse.parse(payLoad);
            Test.stopTest();
            System.assert(response != null);
        }
	}
}