package HotspotMaker;

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

    public static final String version = "3.6";
    public static boolean status = true;
    public static final String space = "C:\\ProgramData\\NaveenB2004\\HospotMaker\\";
    public static String oneTimeSSID = "";
    public static String oneTimePassword = "";
    public static boolean fromTrayMenu = false;

    public static boolean autoAppUpdate() {
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

    public static boolean autoExtUpdate() {
        if (new File(space + "AutoUpdateExt.ini").exists()) {
            try (Stream<String> lines
                    = Files.lines(Paths.get(space + "AutoUpdateExt.ini"))) {
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
    
    public static String[] defCred() {
        String[] cred = new String[3];
        cred[0] = "false";
        if (new File(space + "Credentials.ini").exists()) {
            cred[0] = "true";
            try (Stream<String> lines = Files.lines(
                    Paths.get(space + "Credentials.ini"))) {
                cred[1] = lines.skip(0).findFirst().get();
            } catch (IOException e) {
                Logger.getLogger(Details.class.getName())
                        .log(Level.SEVERE, null, e);
            }
            try (Stream<String> lines = Files.lines(
                    Paths.get(space + "Credentials.ini"))) {
                cred[2] = lines.skip(1).findFirst().get();
            } catch (IOException e) {
                Logger.getLogger(Details.class.getName())
                        .log(Level.SEVERE, null, e);
            }
        }
        return cred;
    }

    // form availability
    public static Main.About about = null;
    public static Main.MainUI main = null;
    public static Main.Settings settings = null;
    public static Extensions.Extensions extensions = null;
}
