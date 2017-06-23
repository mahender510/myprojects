public class class1 {
    public void met1()
    {
 integer a=5;
        string ss='hi ra this is mahi from NJ';
        string ot=ss.substring(5);
        system.debug('original string '+ss);
        system.debug('substring is '+ot);
        boolean retval=ss.startsWith('hi');
        system.debug('res is: '+retval);
            system.debug(a);
    string x='mahender';
    system.debug(x);
        list<string> sr=new list<string>{'mahi','pa1'};
            system.debug(sr);
        list<integer> l1=new list<Integer>();
            l1.add(20);l1.add(20);l1.add(20);
        l1.add(2, 30);
        
            system.debug('number in list are: '+l1);
        set<Integer> sv=new set<Integer>(); 
        
        sv.add(10);sv.add(10);sv.add(20);sv.add(20);
            system.debug('number in set are: '+sv);
        time nowi=time.newInstance(1, 2, 3, 4);
        time addt=nowi.addHours(2);
        //system.debug(nowi);
        system.debug('added: '+addt);
        }
}