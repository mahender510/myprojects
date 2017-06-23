public class AccountCustCtrlEx {
    
    public PageReference saveAcc() {
        system.debug('***entered into save method***'+acc);
        
        insert acc;
        con.accountid=acc.id;
        insert con;
        system.debug('***end of save method***'+acc);
        PageReference pr=new PageReference('/'+acc.id);
        return pr;
        
    }
    
    public account acc{get;set;}
    public contact con{get;set;}
    // custom controller
    public AccountCustCtrlEx()
    {
        system.debug('***entered into constructor***'+acc);
        acc=new account();
        //con=new contact();
        system.debug('***end of constructor***'+acc);
    }
    //ext controller
    public AccountCustCtrlEx(ApexPages.StandardController std)
    {
        system.debug('***entered into constructor***'+acc);
        acc=new account();
        system.debug('***end of constructor***'+acc);
    }
}