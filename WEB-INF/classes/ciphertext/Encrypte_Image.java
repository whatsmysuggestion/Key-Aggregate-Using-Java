package ciphertext;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
 
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

public class Encrypte_Image
{
public static void main(String arg[])
        {
Encrypte_Image a=new Encrypte_Image();
        System.out.println("Welcome to Privacy");
        }

public static void myencrypt(String str1,String str2,String str3)
        {
		 String path1=str1;
		 String path2=str2;
 		 String path3=str3;
 		 
 		 
      
        BufferedImage bgImage = readImage(path1);
 
        
        BufferedImage fgImage = readImage(path2);
 
       
        BufferedImage overlayedImage = overlayImages(bgImage, fgImage);
 
        
        if (overlayedImage != null){
            writeImage(overlayedImage, path3, "JPG");
            System.out.println("Overlay Completed...");
        }else
            System.out.println("Problem With Overlay...");
        }

public static BufferedImage overlayImages(BufferedImage bgImage,
            BufferedImage fgImage) {
 
        
        if (fgImage.getHeight() > bgImage.getHeight()
                || fgImage.getWidth() > fgImage.getWidth()) {
            JOptionPane.showMessageDialog(null,
                    "Foreground Image Is Bigger In One or Both Dimensions"
                            + "\nCannot proceed with overlay."
                            + "\n\n Please use smaller Image for foreground");
            return null;
        }
 
        
        
        Graphics2D g = bgImage.createGraphics();
        
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        
        g.drawImage(bgImage, 0, 0, null);
 
      
        g.drawImage(fgImage, 0, 0, null);
 
        g.dispose();
        return bgImage;
    }
    
 public static BufferedImage readImage(String fileLocation) {
        BufferedImage img = null;
        try {
            img = ImageIO.read(new File(fileLocation));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return img;
    }
 
  
    public static void writeImage(BufferedImage img, String fileLocation,
            String extension) {
        try {
            BufferedImage bi = img;
            File outputfile = new File(fileLocation);
            ImageIO.write(bi, extension, outputfile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
