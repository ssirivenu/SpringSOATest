public class AccountController {
    @AuraEnabled
    public static List<Account> getAccountRecord(){
        return new List<Account>([Select Id,Name,Phone,Website 
                                  FROM Account 
                                  ORDER BY CreatedDate 
                                  DESC LIMIT 10]);
    }
}