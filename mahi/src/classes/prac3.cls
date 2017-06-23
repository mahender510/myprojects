public class prac3 {
	public void mult(integer x)
    {
        integer counter=1;
        system.debug('******using while');
        while(counter<=x)
        {
            system.debug(x+'*'+counter+'='+x*counter);
            counter++;
        }
        integer counter1=1;
        system.debug('******using do while');
        do
        {
            system.debug(x+'*'+counter1+'='+x*counter1);
            counter1++;
        }while(counter1<=x);
        system.debug('******using for');
        for(integer i=0;i<=x;i++)
        {
            system.debug(x+'*'+i+'='+x*i);
        }
    }
}