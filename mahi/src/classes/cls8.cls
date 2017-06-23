public class cls8 {
public void met2()
{
    list<account> acc=[select id,name,phone from account limit 5];
    system.debug(acc);
    for(account rec:acc)
    {
        rec.phone='9849150913';
    }
    //acc.phone='9030042963';
    update(acc);
    system.debug(acc);
}
     public void met3()
    {
        contact c=[select id,name,phone,account.name,account.phone from contact where account.name!='' limit 1];
        system.debug(c);
        c.phone='12345';
        c.Account.phone='7654332';
        system.debug(c.account);
        update c;
        update c.account;
        system.debug(c);
        system.debug(c.account);
    }
}