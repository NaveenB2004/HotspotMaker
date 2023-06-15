package HotspotMaker;

import com.formdev.flatlaf.FlatDarkLaf;
import com.formdev.flatlaf.FlatLaf;
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
 * @author NaveenB2004
 */
public class HotspotMaker extends JWindow {

    public static void main(String[] args) {
        setTheme();
        
        Splash splash = new Splash();
        splash.setVisible(true);

        if (!new File(Details.space).exists()) {
            new File(Details.space).mkdirs();
        }

        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c", "netsh wlan show drive");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                if (line.endsWith("Hosted network supported  : Yes")) {
                    Details.support = true;
                }
            }
            if (Details.support = false) {
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
                if (line.endsWith("Not started")) {
                    Details.status = false;
                }
            }
        } catch (IOException e) {
            System.out.println(e);
        }

        Main.MainUI main = new Main.MainUI();
        splash.dispose();
        main.setVisible(true);
    }

    public static void setTheme() {
        File themes = new File(Details.space + "Theme.ini");
        if (themes.exists()) {
            try (Stream<String> lines = Files.lines(Paths.get(Details.space + "Theme.ini"))) {
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
        FlatLaf.updateUI();
    }
}
