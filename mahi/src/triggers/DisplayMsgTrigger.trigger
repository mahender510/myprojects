trigger DisplayMsgTrigger on Account (before insert,before update) {
    c1 obj1=new c1();
    obj1.displayMsg();
    obj1.met2();
    obj1.met3('mahender');
    obj1.met4('mahender',1);
    string ss=obj1.met6('returned val');
    system.debug('from trigger:'+ss);
}