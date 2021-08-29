package Key_Aggregate;

import java.math.*;
import java.util.*;
import java.security.*;
import java.io.*;



public class Diffie_Hellman
{
	public static void main(String arg[])
        {
			Diffie_Hellman a=new Diffie_Hellman();
        	System.out.println("Welcome to Diffie Hellman");
        }

    	
    //Elgamal Encryption 
    public static String key_exchange(String c11,String xx, String pp)
        {
        	
        	BigInteger c1 = new BigInteger(c11);
        	
	        BigInteger p = new BigInteger(pp);
	        
	        BigInteger x = new BigInteger(xx);
	        
	        BigInteger k2 = c1.modPow(x, p);
	        
	        return k2.toString();
		 	
    	}

  


}
