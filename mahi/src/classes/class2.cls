public class class2 {
    public void met1(){
    list<string> cou=new LIST<String>{'india','usa','aus','pak','sa'};
        Map<Integer,String> mapval=new Map<Integer,String>();
        mapval.put(1, 'India');
        mapval.put(2, 'us');
        mapval.put(3, 'uk');
        mapval.put(4, 'aus');
        mapval.put(5, 'pak');
        mapval.put(5, 'ban');
        System.debug(mapval.get(1));
        System.debug('keys are:'+mapval.keySet());
        System.debug('values are:'+mapval.values());
        list<list<integer>> listval=new list<list<Integer>>();
        list<Integer> list1=new list<Integer>{10,20,30};
            list<Integer> list2=new list<Integer>{10,20,30,40};
        listval.add(list1);
        listval.add(list2);
        system.debug(listval);
        
        }
}