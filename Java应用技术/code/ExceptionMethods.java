public class ExceptionMethods {
    public static void f() throws Exception {
        throw new Exception("Here's my Exception.");
    }

    public static void main(String[] args){
        try{
            f();
        }catch(Exception e){
            System.out.println("e.getMessage:" + e.getMessage());
            System.out.println("e.toString:" + e.toString());
            System.out.println("e.printStackTrace:");
            e.printStackTrace();
        }
    }
}
