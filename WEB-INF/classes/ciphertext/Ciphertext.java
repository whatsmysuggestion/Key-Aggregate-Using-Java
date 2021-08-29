package ciphertext;
public class Ciphertext
{
public static void main(String arg[])
        {
Ciphertext a=new Ciphertext();
        System.out.println("Ciphertext");
        }

public static String get_Ciphertext(String str)
        {
        byte b[] = new byte[str.length()];
        byte result[] = new byte[str.length()];
//	 byte mod[] = new byte[str.length()];
        b=str.getBytes();
        for(int i=0;i<str.length();i++)
                {
                result[i] = (byte) ((byte) b[i] -(byte) 4);
//mod[i]=(byte) ((byte) b[i] % (byte) 4);
																										
                //System.out.println(b[i]+"-"+result[i]);
                }

        return ( new String(result) );
        }

public static String get_Plaintext(String str)
        {
        byte b[] = new byte[str.length()];
        byte result[] = new byte[str.length()];

        b=str.getBytes();
        for(int i=0;i<str.length();i++)
                {
                result[i] = (byte) ((byte) b[i]+(byte) 4);
                //System.out.println(b[i]+"-"+result[i]);
                }

        return ( new String(result) );

        }

}
