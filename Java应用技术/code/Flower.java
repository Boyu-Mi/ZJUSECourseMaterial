public class Flower {
    private int petalCount = 0;
    private String s = new String("null");
    Flower(int petals){
        petalCount = petals;
        System.out.println("Constructor w/ int arg only, petalCount = "
        + petalCount);
    }

    Flower(String ss){
        s = ss;
        System.out.println("Constructor w/ String arg only, s = "
        + s);
    }

    Flower(String s, int petals){
        this(petals);
        //this(s);//cannot call twice!!
        this.s = s;
        System.out.println("int and string");
    }

    public static void main(String [] args){
        Flower f1 = new Flower("aaa", 1);
    }
}
