public class kVF1Cls {

    public String inputVal { get; set; }
    public account acc{get;set;}
    public void results()
    {
        acc=[select name,industry from account where industry=:inputVal limit 1];
        
    }
    
}