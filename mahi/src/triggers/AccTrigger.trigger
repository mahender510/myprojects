trigger AccTrigger on Account (before insert,after insert,before update,after update) {
    system.debug('****'+trigger.new);
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            system.debug('***before insert before new***'+trigger.new);
            system.debug('***before insert before newmap ***'+trigger.newMap);
            system.debug('***before insert before old***'+trigger.old);
            system.debug('***before insert before oldmap ***'+trigger.oldMap);
        }
        if(trigger.isUpdate)
        {
            system.debug('***before update before  new***'+trigger.new);
            system.debug('***before update before  newmap ***'+trigger.newMap);
            system.debug('***before update before  old***'+trigger.old);
            system.debug('***before update before  oldmap ***'+trigger.oldMap);
            for(account newAcc:trigger.new)
            {
                map<id,account> oldAccMap=trigger.oldMap;
                account oldAcc=oldAccMap.get(newAcc.Id);
                /*if(newAcc.Name!=trigger.oldMap.get(newAcc.Id).name)
                {
                    
                }*/
                if(newAcc.phone!=oldAcc.phone)
                {
                    newAcc.name=newAcc.Name+' '+newAcc.phone;
                }
            }
        }
        if(trigger.isDelete)
        {
            system.debug('***before update before  new***'+trigger.new);
            system.debug('***before update before  newmap ***'+trigger.newMap);
            system.debug('***before update before  old***'+trigger.old);
            system.debug('***before update before  oldmap ***'+trigger.oldMap);
        }
    }
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            system.debug('***isafter insert after new***'+trigger.new);
            system.debug('***isafter insert after newmap ***'+trigger.newMap);
            system.debug('***isafter insert after old***'+trigger.old);
            system.debug('***isafter insert after oldmap ***'+trigger.oldMap);
            
        }
        if(trigger.isUpdate)
        {
             system.debug('***isafter update after  new***'+trigger.new);
            system.debug('***isafter update after  newmap ***'+trigger.newMap);
            system.debug('***isafter update after  old***'+trigger.old);
            system.debug('***isafter update after  oldmap ***'+trigger.oldMap);
        }
        if(trigger.isDelete)
        {
            system.debug('***before update before  new***'+trigger.new);
            system.debug('***before update before  newmap ***'+trigger.newMap);
            system.debug('***before update before  old***'+trigger.old);
            system.debug('***before update before  oldmap ***'+trigger.oldMap);
        }
    }
}