trigger AccountTrigger on Account (before insert,after insert) {
    system.debug('****new rec'+trigger.new);
    list<account> accLst=trigger.new;
    if(trigger.isBefore && trigger.isInsert)
    {
        for(account acc:accLst)
        {
            if(acc.phone==''||acc.phone==null)
            {
            acc.phone='9132717532';
            }
        }
    }
    if(trigger.isAfter && trigger.isInsert)
    {
        list<contact> conLst=new list<contact>();
        for(account acc:trigger.new)
        {
            contact con=new contact();
            con.lastname='Unknown';
            con.FirstName=acc.Name;
            con.AccountId=acc.id;
            conLst.add(con);
        }
        insert conLst;
    }
}