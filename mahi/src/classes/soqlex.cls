public with sharing class soqlex {
    public void createRec()
    {
    	list<account> lst=new list<account>();
    	account acc=new account();
    	system.debug('first: '+acc);
    	acc.Name='vijaya laxmi2';
    	acc.Active__c='Yes';
    	system.debug('second: '+acc);
    	lst.add(acc);
    	
    	account acc1=new account();
    	system.debug('first: '+acc1);
    	acc1.Name='vijaya laxmi3';
    	acc1.Active__c='Yes';
    	system.debug('second: '+acc1);
    	lst.add(acc1);
    	
    	account acc2=new account();
    	system.debug('first: '+acc2);
    	acc2.Name='vijaya laxmi4';
    	acc2.Active__c='Yes';
    	system.debug('second: '+acc2);
    	lst.add(acc2);
    	
    	insert lst;
    	
    	//system.debug('last: '+acc);
    	
    	/*contact con=new contact();
    	con.LastName='vijaya';
    	con.AccountId=acc.id;
    	insert con;
    	system.debug('contact: '+con);
    	*/
    }
    public void updateacc()
    {
    	contact c=[Select Name, LastName, Id, AccountId From Contact c where id='0034100000PfWqW'];
    	c.LastName='laxmi';
    	update c;
    	System.debug(c);
    }
    public void upserteacc()
    {
    	list<contact> conlst=[Select Name, LastName, Id, AccountId From Contact c where id='0034100000PfWqW'];
    	System.debug('contacts list: '+conlst);
    	for(contact con:conlst)
    	{
    		con.LastName='adonda new';
    	}
    	System.debug('**********contacts list: '+conlst);
    	contact newcon=new contact(LastName='new ln');
    	conlst.add(newcon);
    	upsert(conlst);
    	System.debug(conlst);
    }
    public void queryrec()
    {
    	list<contact> conList=[Select Name, LastName, AccountId From Contact];
    	System.debug('\n\n******'+conList);
    	System.debug('\n\n****** Contacts list');
    	for(contact con:conList)
    	{
    		System.debug(con);
    	}
    	list<account> acc=[select name,active__c from account where active__c in('yes','no')];
    	system.debug('\n\n*****'+acc);
    	System.debug('\n\n****** inside for loop');
    	for(account accrec:[select name,active__c from account where active__c in('yes','no')])
    	{
    		System.debug(accrec);
    	}
    }
    public void createAccAndCon()
    {
    	
    }
    
}