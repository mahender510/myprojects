trigger AccConTrigger on Contact (after insert,after delete,after undelete) {
    AccountContactCls obj1=new AccountContactCls();
    if(trigger.isafter)
    {
        if(trigger.isInsert || trigger.isUndelete)
        {
            obj1.onAfterInsert(trigger.new);
        }
    }
    if(trigger.isDelete)
    {
        obj1.onAfterDelete(trigger.old);
    }
}