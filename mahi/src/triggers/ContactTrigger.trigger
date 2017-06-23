trigger ContactTrigger on Contact (after insert,after delete,after undelete) {
    ///trigger to update number of contacts in account field using aggregate SOQL query
    system.debug('****'+trigger.new);
    list<account> acc=new list<account>();
    set<id> conAccId=new set<id>();
    
    if(trigger.isInsert || trigger.isUndelete)
    {
       // system.debug('****'+trigger.newMap.size());
        for(contact con:trigger.new)
        {
            conAccId.add(con.AccountId);
        }
        
    }
    if(trigger.isDelete)
    {
        system.debug('****'+trigger.oldMap);
        for(contact con:trigger.old)
        {
            conAccId.add(con.AccountId);
        }
    }
    
    AggregateResult[] getConCount=[select count(id) c,accountid from contact where accountid in :conAccId group by accountid];
    for(AggregateResult ar:getConCount)
    {
        id accId=(id)ar.get('accountid');
        integer count=(integer)ar.get('c');
        account ac=new account(id=accId);
        ac.Number_of_contacts__c=count.format();
        acc.add(ac);
    }
    update acc;
}