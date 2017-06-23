public class kVF3Cls {

    public void serachRes()
    {
        acc=[select name,industry from account where industry=:str];
    }


    public String str { get; set; }
public list<account> acc{get;set;}
    public kVF3Cls()
    {
        acc=[select name,industry from account limit 5];
    }
}