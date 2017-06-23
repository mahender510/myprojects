public class kVF2Cls {

    public boolean retVal { get; set; }

    public void save() {
        insert acc;
        insert con;
        insert opp;
        retVal=false;
    }

    public account acc{get;set;}
    public contact con{get;set;}
    public opportunity opp{get;set;}
    public kVF2Cls(){
        acc=new account();
        con=new contact();
        opp=new opportunity();
        retVal=true;
    }
    
}