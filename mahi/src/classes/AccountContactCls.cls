public class AccountContactCls {
    set<id> conAccId=new set<id>();
    list<account> acc=new list<account>();
    
    public void onbeforeInsert()
    {
        
    }
    public void onbeforeUpdate()
    {
        
    }
    public void onbeforeDelete()
    {
        
    }
    public void onAfterInsert(list<contact> newConList)
    {
        system.debug('***'+newConList);
        for(contact con:newConList)
        {
            conAccId.add(con.AccountId);
        }
        calculate(conAccId);
        getNames(conAccId);
    }
    public void onAfterUpdate(list<contact> newConList)
    {
        
    }
    public void onAfterDelete(list<contact> newConList)
    {
        for(contact con:newConList)
        {
            conAccId.add(con.AccountId);
        }
        calculate(conAccId);
        getNames(conAccId);
    }
    public void calculate(set<id> conAccId)
    {
        AggregateResult[] getConCount=[select count(id),accountid from contact where accountid in :conAccId group by accountid];
        for(AggregateResult ar:getConCount)
        {
            id accId=(id)ar.get('accountid');
            integer count=(integer)ar.get('expr0');
            account ac=new account(id=accId);
            ac.Number_of_contacts__c=count.format();
            acc.add(ac);
        }
        update acc;
    }
    public void getNames(set<id> conAccId)
    {
        list<account> accConList=[select id,name,(select firstname,lastname from contacts) from account where id in :conAccId];
        list<account> updateList=new list<account>();
        system.debug('~~~~~~~~~~~'+accConList);
        for(account acc:accConList)
        {
            //system.debug('****Account: '+acc);
            list<contact> conList=acc.contacts;
            //system.debug('****contact list: '+conList);
            string conFnLn='';
            for(contact con:conList)
            {
                //system.debug('****Contacts: '+con.FirstName+' '+con.LastName);
                conFnLn+= con.FirstName+' '+con.LastName+';';
            }
            //system.debug('****fn ln:'+conFnLn);
            acc.Contacts_List__c=conFnLn;
            updateList.add(acc);
            //acc.Contacts_List__c=s;
        }
        update updateList;
    }
    public void getNamesold(set<id> conAccId)
    {
        list<contact> conLst=[select id,firstname,lastname,accountid,account.Contacts_List__c from contact where accountid in :conAccId];
        list<account> conAcc=new list<account>();
        string s='';
        for(contact con:conLst)
        {
            id accId=(id)con.get('accountid');
            account ac=new account(id=accId);
            s+=con.FirstName+' '+con.LastName+';';
            ac.Contacts_List__c=s;
            conAcc.add(ac);
        }
        //update conAcc;
        system.debug('****'+conAcc);
        
    }
}