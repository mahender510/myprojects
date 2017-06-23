public class cls7 {
public void met1()
{
   list<patient__c> pt=[select id,name,Age__c,(select name,Patient_name__c,price__c from diagnosis__r) from patient__c]; 
    for(patient__c o1:pt)
    {
        system.debug('list of patients:'+o1.id+'==>'+o1.Name+'\t'+o1.diagnosis__r);
        list<Diagnose__c> da=o1.diagnosis__r;
        for(Diagnose__c o2:da)
        {
            system.debug('list of diag. associated:'+o2.Id+'==>'+o2.Name+' \t'+o2.Patient_name__c);
        }
    }
}
}