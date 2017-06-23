public class collectionsExamples
{
    public void listExamples()
    {
        system.debug('list methods demo');
        List<Integer> lstobj=new List<Integer>();
        lstobj.add(10);
        lstobj.add(20);
        lstobj.add(20);
        lstobj.add(1,30);
        
        integer i=lstobj.get(1);
        system.debug('value of i: '+i);
        system.debug('List1 values:'+lstobj);
        List<Integer> lstobj2=new List<Integer>();
        lstobj2.addAll(lstobj);
        lstobj2.set(0,100);
        system.debug('List2 values:'+lstobj2);
        
    }
    public void listStrEx()
    {
    	list<string> clr=new list<string>{'Black','Red','Green'};
    	clr.sort();
    	system.debug(clr);
    	system.assertEquals('Black',clr.get(0));
    	system.assertEquals('Red',clr.get(2));
    	system.assertEquals('Green',clr.get(1));
    	
    }
    public void setEx()
    {
    	system.debug('set example');
    	set<string> setobj=new set<string>();
        setobj.add('10');
        setobj.add('20');
        setobj.add('20');
        setobj.add('30');
        setobj.add('40');
        setobj.add('50');
        if(setobj.contains('50'))
        {
        	system.debug('number found');
        }
        else
        {
        	system.debug('else part');
        }
        system.debug('set values:'+setobj);
    }
    public void mapEx()
    {
    	system.debug('map example');
    	Map<string,string> mapobj=new Map<string,string>();
    	mapobj.put('mahender','adonda');
    	mapobj.put('pavan','bugata');
    	mapobj.put('avez','mohamed');
    	system.debug(mapobj);
    	string res=mapobj.get('mahender');
    	system.debug(res);
    	system.debug(mapobj.keySet());
    	system.debug(mapobj.values()); 
    	
    }
}