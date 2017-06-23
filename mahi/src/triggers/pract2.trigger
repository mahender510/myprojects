trigger pract2 on Contact (after insert,after update) {
    prac1 obj1=new prac1();
    prac1 obj2=new prac1('ma',2);
    //obj1.prac1('mahender',1);
    prac1.met1();
    
    obj1.met2();
    integer x=obj1.met3();
    system.debug('****from trigger:'+x);
    obj1.condEx(6);
    obj1.loopsEx(5);
    
    
    
}