public class MemberPopup 
{

    public void removeRow() {
        memberAddList.remove(memberAddList.size()-1);
    }


    public void save() {
        system.debug('***memberList**'+memberList );
        system.debug('***memberAddList **'+memberAddList );
        insert memberAddList; 
    }

    public List<Member__c> memberList {get;set;}
    public List<Member__c> memberAddList {get;set;}
    public String memberName {get;set;}   
     
    public MemberPopup()
    {
        memberAddList = new List<Member__c>();
        memberAddList.add(new Member__c());
    }
    
    public void AddRow()
    {
        memberAddList.add(new Member__c());
    }  
}