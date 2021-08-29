package ciphertext;
import java.io.*;
import java.awt.*;
import java.awt.image.*;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
 
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

public class Reconstruction
{
public static void main(String arg[])
        {
Reconstruction a=new Reconstruction();
        System.out.println("Welcome to Reconstruction");
        
}
public static void Image_Reconstruction(String str1,String str2,String str3)
        {
		 
		 String path1=str1;
		 String path2=str2;
 		 String path3=str3;
 		 
 		File path; // base path of the images

			try{
			// load source images
			BufferedImage image = ImageIO.read(new File(path1));
			BufferedImage overlay = ImageIO.read(new File(path2));
			
			// create the new image, canvas size is the max. of both image sizes
			int w = Math.max(image.getWidth(), overlay.getWidth());
			int h = Math.max(image.getHeight(), overlay.getHeight());
			BufferedImage combined = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
			
			// paint both images, preserving the alpha channels
			Graphics g = combined.getGraphics();
			g.drawImage(image, 0, 0, null);
			g.drawImage(overlay, 0, 0, null);
			
			
				
			
			// Save as new image
			ImageIO.write(combined, "PNG", new File(path3));
        
        	}
        	catch (IOException e) {
            e.printStackTrace();
        	}
        }


    

 
  
    

}
