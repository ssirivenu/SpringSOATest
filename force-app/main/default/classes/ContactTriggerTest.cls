@isTest
private class ContactTriggerTest {
@isTest static void TestContactAdded() {
        // Test data setup
        Account acc = new account (Name='Test Account');
    	insert acc;
        contact cont = new contact(Lastname='Test Contact',AccountId=acc.id);
        insert cont;
        
    account acctu = [select id, Number_Of_Contacts__c from account where name = 'Test Account'];

        System.assertEquals(1,acctu.Number_of_Contacts__c);
    }
}