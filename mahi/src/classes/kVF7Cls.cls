public class kVF7Cls {
    public account acc{get;set;}
    public string str{get;set;}
    public PageReference display() {
        acc=[select id,name,phone from account where industry=:str limit 1];
        return null;
    }

}