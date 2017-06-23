public class vcls3 {
	public void met1()
    {
    list<account> accList=new list<account>();
    list<contact> conList=new list<contact>();
    for(integer i=0;i<2;i++)
    {
        //system.debug('*********account adding'+i);
        account acc=new account();
        acc.name='Test Account'+i;
        accList.add(acc);
        
       //system.debug('*********account: '+acc);
    }
        insert accList;
        // system.debug('*******Inserting before***'+accList);
        for(integer j=0;j<2;j++)
        {
            contact con=new contact();
            con.LastName='Test Contact'+j;
            con.AccountId=accList[j].id;
            conList.add(con);
        }
        insert conList;
        system.debug('*****'+conList);
	}
    public void met4()
    {
        Account[] acc = [SELECT Id, Name FROM Account WHERE Name like '%test%']; 
		delete acc;
    }
}