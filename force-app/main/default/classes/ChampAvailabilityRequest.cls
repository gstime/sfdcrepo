public class ChampAvailabilityRequest {
    @InvocableVariable(required=true)
    public String accountNumber;
    @InvocableVariable
    public String bookingType;
    @InvocableVariable(required=true)
    public String carrierCodes;
    @InvocableVariable(required=true)
    public String originAirportCode;
    @InvocableVariable(required=true)
    public String destinationAirportCode;
    @InvocableVariable(required=true)
    public String departureOn;
    @InvocableVariable(required=true)
    public Double weight;
    
    public static ChampAvailabilityRequest parse(String json){
		return (ChampAvailabilityRequest) System.JSON.deserialize(json, ChampAvailabilityRequest.class);
	}
}