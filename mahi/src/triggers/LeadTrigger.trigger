trigger LeadTrigger on Lead (before update) 
{
	list<lead> ldLst=trigger.new;
	//account acc;
	//list<account> acc=ldLst.ConvertedAccountId;
	//system.debug('****'+acc);
    for(Lead lead : ldLst) 
    {
        if (Lead.IsConverted)
        {
        String accid = lead.ConvertedAccountId;
        Account acc = [SELECT Id,type FROM Account WHERE id = :accid];
        	//acc=lead.ConvertedAccountId;
        	acc.type=lead.type__c;
            system.debug('************isconverted');
            update acc;
        }
        else
        {
            system.debug('*****not converted');
        }
    }
}