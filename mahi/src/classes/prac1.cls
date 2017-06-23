public class prac1 {
	public prac1()
    {
        string s='mahender';
        system.debug('**************'+s);
    }
    public prac1(string s,integer a)
    {
        system.debug('******string:'+s+'******integer val:'+a);
    }
    public static void met1()
    {
        system.debug('****from static method');
    }
    public void met2()
    {
        system.debug('********void method');
    }
    public integer met3()
    {
        integer a=3;
        return a;
    }
    public void condEx(integer a)
    {
        if(a>10)
        {
            system.debug(a+'****greater then 10');
        }
        else
        {
            system.debug(a+'****less then 10');
        }
    }
    public void loopsEx(integer a)
    {
        for(integer i=0;i<a;i++)
        {
            system.debug('******from loops: '+i);
        }
    }
}