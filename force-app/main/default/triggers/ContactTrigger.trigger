trigger ContactTrigger on Contact (after insert, after update,after delete, after undelete) {
// update, delete, undelete & insert are the states where account needs to be updated 
//Check if is delete trigger and get the updated contacts
list<Contact> updContacts = Trigger.isDelete? Trigger.old: Trigger.new;
Set <Id> accountIds = new set<Id>();

// Check if Contact has an ID and add it to the accounts to be updated
for (contact c: updContacts){
    if(c.AccountId != null){
        accountIds.add(c.AccountId);
    }
}

// Check if any accoutns need to be update and use aggregate SOQL query to get the count & update the accounts
if (accountIds.size()>0){
    list<account> accToUpd = new list<account>();
    for (AggregateResult accAgr : [SELECT AccountId AccId, Count(id) ContactCount 
                                FROM Contact 
                                WHERE AccountId in: accountIds 
                                GROUP BY AccountId]){
                                    Account a = new Account();
                                    a.Id = (Id) accAgr.get('AccId'); 
                                    a.Number_of_Contacts__c = (Integer) accAgr.get('ContactCount');
                                    accToUpd.add(a);
                                }
    try{
        update accToUpd;
    }catch(System.Exception e){
        system.debug('The following exception has occurred: ' + e.getMessage());
    }
}

}