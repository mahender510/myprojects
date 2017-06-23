public class loginCls {

    public PageReference registerUser() {
        return null;
    }


    public String password { get; set; }
    public Consultant__c res{get;set;}
    public String userName { get; set; }
    public Consultant__c con { get; set; }    
    public PageReference login() {
        con=[select id,name from Consultant__c where Email__c=:userName and password__c=:password];
        res=con;
        //PageReference pr=new PageReference('/apex/timesheet');
        //pr.setRedirect(true);
        return page.timesheet;
    }

    public loginCls()
    {
       // con=new Consultant__c();
    }
}