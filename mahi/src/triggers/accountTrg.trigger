trigger accountTrg on Account (before update) {
system.debug('entered into trigger');
account newacc=trigger.new[0];
account oldacc=trigger.old[0];
if(newacc.name!=oldacc.name)
{
    newacc.description='account has been updated';
}
else
{
    newacc.description='account not updated';
}
Map<Id, Account> newaccmap=trigger.newMap;
Map<Id, Account> oldaccmap=trigger.oldMap;
/*
List<Account> newacclist=newaccmap.value();
for(Account acc : newacclist)
{
    Account oacc=oldaccmap.get(acc.id);
}
/* before insert code
list<Account> acclist=trigger.new;
system.debug(acclist);
Account newacc=acclist[0];
newacc.name=newacc.name+' - trigger';
newacc.phone='9132717532';
//insert newacc;
*/
system.debug('end of trigger');

}