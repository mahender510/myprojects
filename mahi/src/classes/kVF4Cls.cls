public class kVF4Cls {
    public list<account> acc{get;set;}
    
    public string str{get;set;}
    public kVF4Cls()
    {
        
    }
    public void serachRes()
    {
        acc=[select name,industry from account where industry=:str];
    }
}