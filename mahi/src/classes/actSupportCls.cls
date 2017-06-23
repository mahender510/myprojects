public class actSupportCls {

    public void removeRow() {
        contactAddList.remove(contactAddList.size()-1);
    }


    public void save() {
        system.debug('***contactList**'+contactList );
        system.debug('***contactAddList **'+contactAddList );
        insert contactAddList; 
    }

    public List<contact> contactList {get;set;}
    public List<contact> contactAddList {get;set;}   
     
    public actSupportCls()
    {
        contactAddList = new List<contact>();
        contactAddList.add(new contact());
    }
    
    public void AddRow()
    {
        contactAddList.add(new contact());
    }  

}