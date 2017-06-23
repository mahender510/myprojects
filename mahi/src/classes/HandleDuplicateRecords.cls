public class HandleDuplicateRecords {
    public void getRecords(list<account> lstRecords)
    {
        list<account> accList=[select name from account];
        for(account newAcc:lstRecords)
        {
            for(account acc:acclist)
            {
                if(acc.name==newAcc.name)
                {
                    newAcc.name.adderror('Name already exist');
                }
            }
        }
    }
    public void getRecordsList(list<account> lstRecords)
    {
        list<account> accList=[select name,industry from account];
        for(account newAcc:lstRecords)
        {
            for(account acc:acclist)
            {
                if(acc.name==newAcc.name && acc.Industry==newAcc.Industry)
                {
                    newAcc.name.adderror('Name with same industry already exist');
                }
            }
        }

    }
}