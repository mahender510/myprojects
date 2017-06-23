public class actionSupportExCls {
    integer count=0;
    public PageReference incCounter() {
        count++;
        return null;
    }


    public integer getCount() {
        return count;
    }

}