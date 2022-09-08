class PrivateFather {
    private int i = 10;
    {
        System.out.println("father member");
    }

    public PrivateFather(){
        System.out.println("Father()'s i = " + i);
        increment();
    }
    public void increment(){
        System.out.println("Father's i = " + i);
        i++;
    }

}

public class Son extends PrivateFather{
    private int i = 20;
    {
        System.out.println("son member");
    }

    public Son(){
        System.out.println("Son()'s i = " + i);
        increment();
    }
    public void increment(){
        System.out.println("Son's i = " + i);
        i--;
    }
    public static void main(String[] args){
        Son s = new Son();
    }
}