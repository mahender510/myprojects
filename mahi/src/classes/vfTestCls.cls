public class vfTestCls {
	public account acc{get;set;}
    public account acccpy{get;set;}
    public PageReference saveOnlyAcc() {
        insert acc;
        acccpy=acc;
        PageReference pr=new PageReference('/apex/vf2');
        return pr;
    }
    public PageReference saveAccSecond() {
        acc.id=acccpy.id;
        update acc;
        PageReference pr=new PageReference('/'+acc.id);
        return pr;
    }
    public vfTestCls()
    {
        acc=new account();
    }
}