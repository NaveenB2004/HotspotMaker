package HotspotMaker;

import Main.Settings;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;

/**
 *
 * @author NaveenB2004
 */
public class Details {

    public static String version = "3.4";
    public static boolean status = true;
    public static String space = "C:\\ProgramData\\NaveenB2004\\HospotMaker\\";
    public static boolean defCred;
    public static String oneTimeSSID = "";
    public static String oneTimePassword = "";

    public static boolean onCloseMinimize() {
        if (new File(space + "OnClose.ini").exists()) {
            try (Stream<String> lines
                    = Files.lines(Paths.get(space + "OnClose.ini"))) {
                String theme = lines.skip(0).findFirst().get();
                if (theme.equals("exit")) {
                    return false;
                }
            } catch (IOException e) {
                Logger.getLogger(Details.class.getName())
                        .log(Level.SEVERE, null, e);
            }
        }
        return true;
    }

    public static boolean autoUpdate() {
        if (new File(space + "AutoUpdate.ini").exists()) {
            try (Stream<String> lines
                    = Files.lines(Paths.get(space + "AutoUpdate.ini"))) {
                if (lines.skip(0).findFirst().get().equals("Disabled")) {
                    return false;
                }
            } catch (IOException e) {
                Logger.getLogger(Details.class.getName())
                        .log(Level.SEVERE, null, e);
            }
        }
        return true;
    }

}
