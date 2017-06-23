public class c1 {
    public c1()
    {
        string s='name from constructor';
        integer i1=6;
        if(i1>6)
        {
        	system.debug('**************condition satisfied: '+i1);    
        }
        else
        {
            system.debug('**************condition failed: '+i1);
        }
        system.debug('**************'+s);
    }
    public void displayMsg()
    {
        system.debug('**************Hello SFDC');
    }
    public void met2()
    {
        system.debug('*****From method 2');
    }
    public void met3(string s)
    {
        system.debug('***********parameterized method:'+s);
    }
    public void met4(string name,integer id)
    {
        system.debug('********name'+name+'*********'+id);
    }
    public integer met5()
    {
        system.debug('***************from return type int');
        return 6;
    }
    public string met6(string s)
    {
        system.debug('***************from string return type');
        return s;
    }
    
}