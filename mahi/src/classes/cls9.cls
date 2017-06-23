public class cls9 {
public void met1()
{
    account acc=new account();
    acc.Name='Mentis solutions';
    acc.AnnualRevenue=1234567;
    insert acc;
    system.debug(acc);
    Contact con=new Contact();
    con.LastName='mahender';
    con.AccountId=acc.Id;
    insert con;
    system.debug(con);
    
}
    public void met2(string accid)
    {
     integer c=[select count() from contact where account.id=:accid];
      system.debug(c);  
        account acc=[select id,Name,Number_of_contacts__c from account where id=:accid];
        acc.Number_of_contacts__c=c.format();
        update acc;
    }
    public void met4()
    {
        for(integer i=0;i<200;i++)
        {
      account acc=new account();
            acc.Name='Mentis'+i;
            insert acc;
       contact con=new contact();
            con.LastName='Contacted'+i;
            con.AccountId=acc.id;
            insert con;
            system.debug(con);
        }
    }
    public void met3()
    {
        patient__c pt=new patient__c();
        pt.Full_Name__c='Bhargavi';
        pt.Nick_Name__c='bhar';
        pt.SSN_number__c='1234';
        pt.Email__c='bhargavi@gmail.com';
        
        insert pt;
        Diagnose__c di=new Diagnose__c();
        
        di.Diagnose_Name__c='TB Test';
        di.patient_info__c=pt.Id;
        insert di;
        system.debug(di);
    }
}