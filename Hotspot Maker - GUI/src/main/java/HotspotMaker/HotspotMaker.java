/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package HotspotMaker;

import com.formdev.flatlaf.FlatDarkLaf;
import com.formdev.flatlaf.FlatLightLaf;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;
import javax.swing.JOptionPane;
import javax.swing.JWindow;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author naveenb2004
 */
public class HotspotMaker extends JWindow {

    public static void main(String[] args) {
        Splash splash = new Splash();
        splash.setVisible(true);

        if (!new File(details.space).exists()) {
            new File(details.space).mkdirs();
        }

        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c", "netsh wlan show drive");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                if (line.equals("    Hosted network supported  : Yes")) {
                    details.support = true;
                }
            }
            if (details.support = false) {
                JOptionPane.showMessageDialog(splash,
                        "Your network interface doesn't support for make hotspot!");
                System.exit(0);
            }
        } catch (IOException e) {
            System.out.println(e);
        }

        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c", "netsh wlan show hostednetwork");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                if (line.equals("    Status                 : Started")) {
                    details.status = true;
                }
            }
        } catch (IOException e) {
            System.out.println(e);
        }

        File themes = new File(details.space + "Theme.ini");
        if (themes.exists()) {
            try (Stream<String> lines = Files.lines(Paths.get(details.space + "Theme.ini"))) {
                String theme = lines.skip(0).findFirst().get();
                if (theme.equals("Light")) {
                    FlatLightLaf.setup();
                }
                if (theme.equals("Dark")) {
                    FlatDarkLaf.setup();
                }
                if (theme.equals("Default")) {
                    try {
                        UIManager.setLookAndFeel(
                                UIManager.getSystemLookAndFeelClassName());
                    } catch (ClassNotFoundException | IllegalAccessException | InstantiationException
                            | UnsupportedLookAndFeelException ex) {
                        System.out.println("0003" + ex);
                    }
                }
            } catch (IOException ex) {
                System.out.println("0004" + ex);
            }
        } else {
            try {
                UIManager.setLookAndFeel(
                        UIManager.getSystemLookAndFeelClassName());
            } catch (ClassNotFoundException | IllegalAccessException | InstantiationException
                    | UnsupportedLookAndFeelException ex) {
                System.out.println("0005" + ex);
            }
        }

        Main.MainUI main = new Main.MainUI();
        splash.dispose();
        main.setVisible(true);
    }
}
