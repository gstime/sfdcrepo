public class ChampBookingRequest {
    @InvocableVariable(required=true)
	public cls_airWaybill airWaybill;
    @InvocableVariable(required=true)
	public String agentAccountNumber;	//57450119112
    @InvocableVariable
	public String salesAreaCode;	//AMS
    @InvocableVariable(required=true)
	public String originAirportCode;	//AMS
    @InvocableVariable(required=true)
	public String destinationAirportCode;	//LIS
    @InvocableVariable(required=true)
	public String reference;	//RJREF01
    @InvocableVariable(required=true)
	public Integer pieces;	//1
    @InvocableVariable(required=true)
	public cls_weight weight;
    @InvocableVariable
	public cls_volume volume;
    @InvocableVariable(required=true)
	public String natureOfGoods;	//CONSOL
    @InvocableVariable
	public String freightChargeType;	//Prepaid
    @InvocableVariable(required=true)
	public cls_segments[] segments;
    @InvocableVariable
	public String remarks;	//Free text captured as remarks
    @InvocableVariable(required=true)
	public cls_adhocPrice[] adhocPrice;
	public class cls_airWaybill {
        @InvocableVariable(required=true)
		public String referenceType;	//AIR WAYBILL
        @InvocableVariable(required=true)
		public String prefix;	//047
        @InvocableVariable
		public String serial;	//34245326
	}
	public class cls_weight {
        @InvocableVariable
		public Integer amount;	//100
        @InvocableVariable
		public String unit;	//KG
	}
	public class cls_volume {
        @InvocableVariable
		public Integer amount;	//1
        @InvocableVariable
		public String unit;	//MC
	}
	public class cls_segments {
        @InvocableVariable(required=true)
		public String originAirportCode;	//AMS
        @InvocableVariable(required=true)
		public String destinationAirportCode;	//LIS
        @InvocableVariable(required=true)
		public cls_transportMeans transportMeans;
        @InvocableVariable(required=true)
		public String spaceAllocationCode;	//NN
        @InvocableVariable(required=true)
		public Integer pieces;	//1
        @InvocableVariable(required=true)
		public cls_weight weight;
        @InvocableVariable
		public cls_volume volume;
	}
	public class cls_transportMeans {
        @InvocableVariable(required=true)
		public String carrierCode;	//TP
        @InvocableVariable(required=true)
		public String reqNumber;	//675
        @InvocableVariable(required=true)
		public String reqDate;	//2025-04-13
	}
	public class cls_adhocPrice {
        @InvocableVariable
		public boolean allInRate;
        @InvocableVariable
		public String calculationWeightType;	//Chargeable
        @InvocableVariable(required=true)
		public String currencyCode;	//EUR
        @InvocableVariable
		public Integer rate;	//5
        @InvocableVariable
		public String contact;	//+65 80000002
	}
	public static ChampBookingRequest parse(String json){
		return (ChampBookingRequest) System.JSON.deserialize(json, ChampBookingRequest.class);
	}
}