public class vcls2 {
	public void met1(string empid)
    {
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
}