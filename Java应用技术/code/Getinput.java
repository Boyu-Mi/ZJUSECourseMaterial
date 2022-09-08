public class Getinput {
    public static void main(String[] args){
        byte buffer[] = new byte[256];
        try{
            int bytes = System.in.read(buffer, 0, 256);
            String str = new String(buffer, 0, bytes);
            System.out.println(str + ":" + bytes + ":" + str.length());
            for(int i = 0; i < str.length(); ++i){
                System.out.println(str.charAt(i));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
