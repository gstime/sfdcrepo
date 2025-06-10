@RestResource(urlMapping='/bulkTestApi/*')
global without sharing class PostmanBulkRequestAPI {
	@HttpPost
    global static List<Case> submitRequest(InquiryInfo request) {
        System.debug('---api call from postman---');
        if(request.caseInfo!=null){
			insert request.caseInfo;            
        }
        return request.caseInfo;
    }
    @HttpGet
    global static String submitRequest() {
        System.debug('---api call from postman---');
        return 'Wellcome';
    }
    global class InquiryInfo{
        List<Case> caseInfo=new List<Case>();
    }
    
}