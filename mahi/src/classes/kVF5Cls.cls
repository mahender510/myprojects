public class kVF5Cls {

    public PageReference prev() {
         return page.kVF5;
    }


    public PageReference save() {
        insert acc;
        insert con;
        return null;
    }


    public contact con { get; set; }

    public PageReference next() {
        return page.kVF6;
    }


    public account acc { get; set; }
    public kVF5Cls()
    {
        acc=new account();
        con=new contact();
    }
}