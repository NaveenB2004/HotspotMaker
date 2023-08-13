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

        new Actions().checkStarterStatus();
        new Actions().checkHotspotStatus();

        new Actions().checkUpdateStatus();

        // this delay added cuz checkHotspotStatus()
        // getting some time to read the current status
        // and arrange the UI
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(HotspotMaker.class.getName())
                    .log(Level.SEVERE, null, ex);
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
