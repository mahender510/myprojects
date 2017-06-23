public class vcls4 {
    public void met1()
    {
        //for single contact
        account acc=[select id,name,Number_of_contacts__c from account where name='Mentis solutions'];
        list<contact> conList=[select firstname,lastname from contact where accountid=:acc.id];
        if(conList.size()>0)
        {
            acc.Number_of_contacts__c=conList.size().format();
        }
        update acc;
        system.debug('****'+conList.size());
        system.debug('account:'+acc+' \n contact list:'+conList);
    }
    public void met2()
    {
        ///for multiple records
        list<account> accList=[select id,name from account];
        list<account> accConList=[select id,name,Number_of_contacts__c,(select firstname,lastname from contacts) from account where id=:accList];
        list<account> modifyAccList=new list<account>();
        for(account acc:accConList)
        {
            system.debug('****Account: '+acc.Name);
            list<contact> conList=acc.contacts;
            if(acc.Number_of_contacts__c!=conList.size().format())
            {
            acc.Number_of_contacts__c=conList.size().format();
            modifyAccList.add(acc);
            system.debug('****'+acc.Number_of_contacts__c);
            }
        }
        update modifyAccList;
    }
    public void met3()
    {
        //method to add firstname and lastname to Contacts_List__c
        list<account> accList=[select id,name from account];
        list<account> accConList=[select id,name,(select firstname,lastname from contacts) from account where id=:accList];
        list<account> updateList=new list<account>();
        system.debug('***'+accConList.get(2));
        for(account acc:accConList)
        {
            //system.debug('****Account: '+acc);
            list<contact> conList=acc.contacts;
            //system.debug('****contact list: '+conList);
            string conFnLn='';
            for(contact con:conList)
            {
                //system.debug('****Contacts: '+con.FirstName+' '+con.LastName);
                conFnLn+= con.FirstName+' '+con.LastName+';';
            }
            //system.debug('****fn ln:'+conFnLn);
            acc.Contacts_List__c=conFnLn;
            updateList.add(acc);
            //acc.Contacts_List__c=s;
        }
        update updateList;
    }
    public void met4()
    {
        //to create 200 accounts and associated contacts based on old for loop
        list<account> accList=new list<account>();
        list<contact> conList=new list<contact>();
        integer x=1;
        for(integer i=1;i<=200;i++)
        {
            //system.debug('*********account adding'+i);
            account acc=new account();
            acc.name='Test Account'+i;
            accList.add(acc);
            
            //system.debug('*********account: '+acc);
        }
        insert accList;
        // system.debug('*******Inserting before***'+accList);
        //for(account c:accList)
        for(integer j=0;j<200;j++)
        {
            contact con=new contact();
            con.LastName='Test Contact'+j;
            con.AccountId=accList[j].id;
            conList.add(con);
        }
        insert conList;
        system.debug('*****'+conList);
    }
    public void met5()
    {
        //adding number of contacts count to Number_of_contacts__c
        list<account> accList=[select id,name from account];
        list<contact> conList=[select id,name,accountid,account.name from contact where accountid in :accList];
        map<id,list<contact>> accConMap=new map<id,list<contact>>(); 
        list<account> upLst=new list<account>();
        for(contact con:conList)
        {
            if(accConMap.containsKey(con.AccountId))
            {
                list<contact> exConLst=accConMap.get(con.AccountId);
                exConLst.add(con);
                accConMap.put(con.AccountId, exconlst);
                //system.debug('****exConLst size'+exConLst.size());
            }
            else
            {
                list<contact> tempConLst=new list<contact>();
                tempConLst.add(con);
                accConMap.put(con.AccountId, tempConLst);
                //system.debug('****tempConLst size'+tempConLst.size());
            }
        }
        for(account ac:[select id,name,Number_of_contacts__c from account where id in :accConMap.keySet()])
        {
            ac.Number_of_contacts__c=accConMap.get(ac.id).size().format();
            upLst.add(ac);
        }
        update upLst;
    }
    public void met6(string empid)
    {
        //to get sum of salary, maximum salary and minimum salary based on the account id parameter
        AggregateResult[] groupedResults  = [SELECT sum(salary__c) sum,max(salary__c) max,min(salary__c) min FROM Salary__c where Employee__r.id=:empid];
        double sumAmount = double.valueOf(groupedResults[0].get('sum')); 
        double maxAmount = double.valueOf(groupedResults[0].get('max')); 
        double minAmount = double.valueOf(groupedResults[0].get('min'));
        Employee__c emp=[select id,Maximum_Sal__c,Minimum_Sal__c,Total_Sal__c from Employee__c where id=:empid];
        emp.Maximum_Sal__c=maxAmount.format();
        emp.Minimum_Sal__c=minAmount.format();
        emp.Total_Sal__c=sumAmount.format();
        update emp;
    }
    public void met7()
    {
        //to get sum,max and min salaries for all accounts
        list<Employee__c> empList=[select id,name from Employee__c];
        list<Employee__c> empConList=[select id,name,(select salary__c from Salarys__r) from Employee__c where id=:empList];
        list<Employee__c> updateList=new list<Employee__c>();
        for(Employee__c emp:empConList)
        {
            list<salary__c> conList=emp.Salarys__r;
            decimal sum=0;
            conList.sort();
            for(integer i=0;i<conList.size();i++)
            {
                if(i==0)
                {
                    emp.Minimum_Sal__c=conList[0].salary__c.format();
                }
                if(i==conList.size()-1)
                {
                    emp.Maximum_Sal__c=conList[conList.size()-1].salary__c.format();
                }
                system.debug('***'+conList[i].salary__c);
                sum+= conList[i].salary__c;
            }
           /* for(salary__c con:conList)
            {
                sum+= con.salary__c;
                emp.Maximum_Sal__c=con.salary__c.format();
            }*/
            // emp.Maximum_Sal__c=conList[0];
            emp.Total_Sal__c=sum.format();
            //system.debug('****'+conList);
            updateList.add(emp);
        }
        update updateList;
    }

 public void met8()
    {
        //to get sum of opportunities associated with account
        list<account> accList=[select id,name from account];
        list<opportunity> oppList=[select id,name,accountid,account.name from opportunity where accountid in :accList];
        map<id,list<opportunity>> accoppMap=new map<id,list<opportunity>>(); 
        list<account> upLst=new list<account>();
        for(opportunity opp:oppList)
        {
            if(accoppMap.containsKey(opp.AccountId))
            {
                list<opportunity> exoppLst=accoppMap.get(opp.AccountId);
                exoppLst.add(opp);
                accoppMap.put(opp.AccountId, exopplst);
                //system.debug('****exoppLst size'+exoppLst.size());
            }
            else
            {
                list<opportunity> tempoppLst=new list<opportunity>();
                tempoppLst.add(opp);
                accoppMap.put(opp.AccountId, tempoppLst);
                //system.debug('****tempoppLst size'+tempoppLst.size());
            }
        }
        for(account ac:[select id,name,Number_of__c from account where id in :accoppMap.keySet()])
        {
            ac.Number_of__c=accoppMap.get(ac.id).size();
            upLst.add(ac);
        }
        update upLst;
    }
     public void met9()
    {
        //to get number of cases associated with account
        list<account> accList=[select id,name from account];
        list<case> csList=[select id,accountid,account.name from case where accountid in :accList];
        map<id,list<case>> acccsMap=new map<id,list<case>>(); 
        list<account> upLst=new list<account>();
        for(case cs:csList)
        {
            if(acccsMap.containsKey(cs.AccountId))
            {
                list<case> excsLst=acccsMap.get(cs.AccountId);
                excsLst.add(cs);
                acccsMap.put(cs.AccountId, excslst);
                //system.debug('****excsLst size'+excsLst.size());
            }
            else
            {
                list<case> tempcsLst=new list<case>();
                tempcsLst.add(cs);
                acccsMap.put(cs.AccountId, tempcsLst);
                //system.debug('****tempcsLst size'+tempcsLst.size());
            }
        }
        for(account ac:[select id,name,Number_of_cases__c from account where id in :acccsMap.keySet()])
        {
            ac.Number_of_cases__c=acccsMap.get(ac.id).size();
            upLst.add(ac);
        }
        update upLst;
    }
    public void met10()
    {
        //to create 200 accounts and its associated contact with traditional for loop
        list<account> accList=new list<account>();
        list<contact> conList=new list<contact>();
        integer x=1;
        for(integer i=1;i<=200;i++)
        {
            //system.debug('*********account adding'+i);
            account acc=new account();
            acc.name='Test Account'+i;
            accList.add(acc);
        }
        insert accList;
        for(account c:accList)
        {
            contact con=new contact();
            con.LastName='Test Contact'+x;
            con.AccountId=c.id;
            conList.add(con);
            x++;
        }
        insert conList;
        system.debug('*****'+conList);
    }
    public void met11()
    {
        //to get sum of salary, maximum salary and minimum salary for all accounts using aggregate functions
        list<Employee__c> empList=[select id,name,Total_Sal__c,(select id,salary__c from Salarys__r) from Employee__c];
        list<Employee__c> updateList=new list<Employee__c>();
        list<AggregateResult> groupedResults  = [SELECT Employee__c,sum(salary__c) sum,max(salary__c) max,min(salary__c) min FROM Salary__c group by Employee__c];
        map<id,decimal> mapSumLst=new map<id,decimal>();
        map<id,decimal> mapMaxLst=new map<id,decimal>();
        map<id,decimal> mapMinLst=new map<id,decimal>();
        for(AggregateResult ar:groupedResults)
        {
            mapSumLst.put((id)ar.get('Employee__c'), (decimal)ar.get('sum'));
            mapMaxLst.put((id)ar.get('Employee__c'), (decimal)ar.get('max'));
            mapMinLst.put((id)ar.get('Employee__c'), (decimal)ar.get('min'));
        }
        for(Employee__c emp:empList)
        {
            emp.Total_Sal__c=mapSumLst.get(emp.id).format();
            emp.Maximum_Sal__c=mapMaxLst.get(emp.id).format();
            emp.Minimum_Sal__c=mapMinLst.get(emp.id).format();
            updatelist.add(emp);
        }
        update updatelist;
           system.debug('***'+mapSumLst);
        //Employee__c emp=[select id,Maximum_Sal__c,Minimum_Sal__c,Total_Sal__c from Employee__c where id=:empid];
        
    }
}