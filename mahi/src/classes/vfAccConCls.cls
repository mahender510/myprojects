public class vfAccConCls {

    public account acc{get;set;}
    public contact con{get;set;}
    public account acccpy;
    
    public PageReference saveOnlyAcc() {
        system.debug('***entered into save method***'+acc);
        
        insert acc;
        acccpy=acc;
        system.debug('***end of save method***'+acccpy);
        PageReference pr=new PageReference('/apex/vfAccConPage');
        return pr;
        
    }
    public PageReference saveAccCon() {
        system.debug('***entered into save method***'+acc);
        
        //insert acc;
        con.accountid=acccpy.id;
        insert con;
        system.debug('***end of save method***'+con);
        PageReference pr=new PageReference('/'+acc.id);
        return pr;
        
    }
    
    // custom controller
    public vfAccConCls()
    {
        system.debug('***entered into constructor***'+acc);
        acc=new account();
        con=new contact();
        system.debug('***end of constructor***'+acc);
    }
    //ext controller
    public vfAccConCls(ApexPages.StandardController std)
    {
        system.debug('***entered into par constructor***'+acc);
        acc=new account();
        con=new contact();
        system.debug('***end of par constructor***'+acc);
    }
    public PageReference next()
    {
        insert acc;
        PageReference pr=new PageReference('/apex/vfAccConPage');
        pr.setRedirect(true);
        return pr;
    }
    public PageReference previous()
    {
        PageReference pr=new PageReference('/apex/vfAccPage');
        pr.setRedirect(true);
        return pr;
    }

}