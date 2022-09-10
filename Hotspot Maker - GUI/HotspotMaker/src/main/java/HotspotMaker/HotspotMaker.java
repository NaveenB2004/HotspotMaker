/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package HotspotMaker;

import com.formdev.flatlaf.FlatDarkLaf;
import com.formdev.flatlaf.FlatLightLaf;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import javax.swing.ImageIcon;
import javax.swing.JWindow;
import javax.swing.UIManager;

/**
 *
 * @author NaveenBalasooriya
 */
public class HotspotMaker extends JWindow {

    //add all images to src/main/resources/pkg(imgs)/
    Image splashScreen;
    ImageIcon imageIcon;

    public HotspotMaker() {
        splashScreen = Toolkit.getDefaultToolkit().getImage(getClass().getResource("/Imgs/Splash.jpg"));
        // Create ImageIcon from Image
        imageIcon = new ImageIcon(splashScreen);
        // Set JWindow size from image size
        setSize(imageIcon.getIconWidth(), imageIcon.getIconHeight());
        // Get current screen size
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        // Get x coordinate on screen for make JWindow locate at center
        int x = (screenSize.width - getSize().width) / 2;
        // Get y coordinate on screen for make JWindow locate at center
        int y = (screenSize.height - getSize().height) / 2;
        // Set new location for JWindow
        setLocation(x, y);
        // Make JWindow visible
        setVisible(true);
    }

    // Paint image onto JWindow
    public void paint(Graphics g) {
        super.paint(g);
        g.drawImage(splashScreen, 0, 0, this);
    }

    public static void main(String[] args) {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c", "call supportcheck.bat");
            processBuilder.redirectErrorStream(true);
            processBuilder.start();
        } catch (Exception e) {
            System.out.println("0001" + e);
        }

        File myObj = new File("theme.ini");
        try {
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                if (data.equals("Default")) {
                    try {
                        UIManager.setLookAndFeel(
                                UIManager.getSystemLookAndFeelClassName());
                    } catch (Exception e) {
                        System.out.println("0002" + e);
                    }
                } else if (data.equals("Dark")) {
                    FlatDarkLaf.setup();
                } else if (data.equals("Light")) {
                    FlatLightLaf.setup();
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("0003" + e);
            try {
                UIManager.setLookAndFeel(
                        UIManager.getSystemLookAndFeelClassName());
            } catch (Exception ex) {
                System.out.println("0004" + ex);
            }
        }

        HotspotMaker splash = new HotspotMaker();
        try {
            // Make JWindow appear for 3 seconds before disappear
            Thread.sleep(3000);
            splash.dispose();
        } catch (Exception e) {
            System.out.println("0005" + e);
        }

        Main.MainUI main = new Main.MainUI();
        main.setVisible(true);
    }
}
