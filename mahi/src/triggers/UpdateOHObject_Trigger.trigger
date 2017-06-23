trigger UpdateOHObject_Trigger on Lead (after update) {
    leadCls cls=new leadCls();
    cls.met1(trigger.new);
}