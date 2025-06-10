public class ChampAvailabilityResponse {
    @InvocableVariable
	public cls_routes[] routes;
    @InvocableVariable
	public cls_links links;
    @InvocableVariable
	public cls_page page;
	public class cls_routes {
        @InvocableVariable
		public cls_segments[] segments;
        @InvocableVariable
		public cls_price price;
	}
	public class cls_segments {
        @InvocableVariable
		public cls_onload onload;
        @InvocableVariable
		public cls_offload offload;
        @InvocableVariable
		public cls_transportMeans transportMeans;
	}
	public class cls_onload {
        @InvocableVariable
		public String code;	//SIN
        @InvocableVariable
		public String type;	//AIRPORT
        @InvocableVariable
		public String name;	//Changi International Airport
        @InvocableVariable
		public String timeArea;	//Asia/Singapore
	}
	public class cls_offload {
        @InvocableVariable
		public String code;	//COK
        @InvocableVariable
		public String type;	//AIRPORT
        @InvocableVariable
		public String name;	//Cochin International Airport
        @InvocableVariable
		public String timeArea;	//Asia/Kolkata
	}
	public class cls_transportMeans {
        @InvocableVariable
		public String id;	//25847692
        @InvocableVariable
		public String reference;	//XS769/06SEP
        @InvocableVariable
		public String date_x;	//2020-09-06
        @InvocableVariable
		public String mode;	//AIR
        @InvocableVariable
		public cls_carrier carrier;
        @InvocableVariable
		public String transportNumber;	//769
        @InvocableVariable
		public String scheduledDeparture;	//2020-09-06T16:40:00
        @InvocableVariable
		public String scheduledArrival;	//2020-09-06T19:05:00
        @InvocableVariable
		public cls_type type;
	}
	public class cls_carrier {
        @InvocableVariable
		public String code;	//XS
	}
	public class cls_type {
        @InvocableVariable
		public String code;	//77W
	}
	public class cls_price {
        @InvocableVariable
		public Double amount;	//1025.5
        @InvocableVariable
		public cls_currency currency_x;
        @InvocableVariable
		public String type;	//Street
	}
	public class cls_currency {
        @InvocableVariable
		public String code;	//SGD
        @InvocableVariable
		public String name;	//Singapore Dollars
	}
	public class cls_links {
        @InvocableVariable
		public cls_self self;
	}
	public class cls_self {
        @InvocableVariable
		public String href;	//https://api-gateway.champ.aero/csp/transport-means/v1/availability?accountNumber=78453124633&bookingType=S&carrierCodes=XS&originAirportCode=SIN&destinationAirportCode=LHR&departureOn=2020-12-25&weight=150.5
	}
	public class cls_page {
        @InvocableVariable
		public Integer number_x;	//1
        @InvocableVariable
		public Integer size;	//10
        @InvocableVariable
		public Integer totalPages;	//1
        @InvocableVariable
		public Integer totalElements;	//3
	}
	public static ChampAvailabilityResponse parse(String json){
		return (ChampAvailabilityResponse) System.JSON.deserialize(json, ChampAvailabilityResponse.class);
	}
}