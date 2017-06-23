public class class3 {
public void soqlprac()
{
    list<string> name=new list<string>{'mahe','ma'};
    list<Account> acc=[select name from Account limit 3];
    system.debug(acc);
    list<patient__c> pc=[select Full_Name__c from patient__c where Full_Name__c in :name];
    system.debug(pc);
}
}