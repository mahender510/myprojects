public class leadCls {
    set<id> leadId=new set<id>();
    set<id> leadAccId=new set<id>();
    list<account> acc=new list<account>();
    list<lead> ld=new list<lead>();
    list<vendor__c> c=new list<vendor__c>();
	public void met1(list<lead> ls)
    {
        //list<vendor__c> ch=[select id,name from vendor__c where lead_name__c=:ls.id];
        system.debug('******'+ls);
        for(lead l1:ls)
        {
            leadId.add(l1.id);
            leadAccId.add(l1.ConvertedAccountId);
        }
        list<vendor__c> ch=[select id,name,Contact_Email__c from vendor__c where lead_name__c in :leadId];
        system.debug('*****'+ch);
        for(vendor__c c1:ch)
        {
            if(leadAccId!=null)
            {
                for(id i:leadAccId)
                {
                    c1.acc__c=i;
                    c1.lead_name__c=null;
                }
            }
            c.add(c1);
        }
        update c;
    }
}