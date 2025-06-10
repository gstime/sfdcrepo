global with sharing class AccountPlanner {

 webservice static String fullName(String firstName, String lastName){
     String greetMessage = 'Welcome '+firstName+' '+lastName;
     return greetMessage;
  }

  webservice static AccountWrapper createAccount(AccountWrapper accountRec){ 

    AccountWrapper accountResponse = new AccountWrapper();

    Account accRec = new Account();
    accRec.Name = accountRec.Name;
    accRec.Rating = accountRec.Rating;
    accRec.Industry = accountRec.Industry;
    accRec.Phone = accountRec.Phone;
    accRec.AccountNumber = accountRec.AccountNumber;
    
    insert accRec;
    Contact conRec = new Contact();
    conRec.LastName = accountRec.contactLastName;
    conRec.AccountId = accRec.Id;
    insert conRec;
    
    accountResponse = accountRec;
    
    return accountResponse;
    
}

global class AccountWrapper {

    webservice String Name;
    webservice String Rating;
    webservice String Industry;
    webservice String Phone;
    webservice String AccountNumber;
    webservice String contactLastName;
    
   }
 
 }