package HotspotMaker;

import com.formdev.flatlaf.FlatDarkLaf;
import com.formdev.flatlaf.FlatLaf;
import com.formdev.flatlaf.FlatLightLaf;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.swing.JLabel;
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
        JLabel status = Splash.jLabel3;

        status.setText("Checking application status...");
        new Actions().duplicateStatus();
        
        status.setText("Checking directories...");
        if (!new File(Details.space).exists()) {
            new File(Details.space).mkdirs();
        }

        status.setText("Adding tray icon...");
        new Actions().setTrayIcon();

        status.setText("Checking hotspot support...");
        new Actions().checkStarterStatus();
        status.setText("Checking hotspot status...");
        new Actions().checkHotspotStatus();

        status.setText("Checking installable updates...");
        new Actions().updateAndRestart();
        status.setText("Checking for updates...");
        new Actions().checkUpdateStatus();
        status.setText("Checking for extensions updates...");
        new Actions().extAutoUpdate();

        // this delay added cuz checkHotspotStatus()
        // getting some time to read the current status
        // and arrange the UI
        status.setText("Setting up UI...");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(HotspotMaker.class.getName())
                    .log(Level.SEVERE, null, ex);
        }

        if (Details.main == null) {
            Details.main = new Main.MainUI();
        }
        Details.main.setVisible(true);
        splash.dispose();
    }

    public static void setTheme() {
        File themes = new File(Details.space + "Theme.ini");
        if (themes.exists()) {
            try (Stream<String> lines = Files.lines(Paths.get(Details.space
                    + "Theme.ini"))) {
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
                            | UnsupportedLookAndFeelException e) {
                        Logger.getLogger(HotspotMaker.class.getName())
                                .log(Level.SEVERE, null, e);
                    }
                }
            } catch (IOException e) {
                Logger.getLogger(HotspotMaker.class.getName())
                        .log(Level.SEVERE, null, e);
            }
        } else {
            try (PrintStream out = new PrintStream(new File(Details.space + "Theme.ini"))) {
                out.println("Default");
            } catch (FileNotFoundException e) {
                Logger.getLogger(HotspotMaker.class.getName())
                        .log(Level.SEVERE, null, e);
            }
            setTheme();
        }
        FlatLaf.updateUI();
    }
}
