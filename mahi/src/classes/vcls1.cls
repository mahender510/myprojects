public class vcls1 {
	public void met1(string accid)
    {
        integer c=[select count() from contact where account.id=:accid];
        list<contact> con=[select firstname,lastname,account.Contacts_List__c from contact where Account.id=:accid];
        account acc=[select Contacts_List__c from account where id=:accid];
        string s='';
        //list<account> acc=[select ];
        for(integer i=0;i<c;i++)
        {
            s+=con[i].firstname+' '+con[i].lastname+';';
            system.debug('******'+i+'******'+s);
        }
        
        acc.Contacts_List__c=s;
        update acc;
    }
}