package Extensions;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author NaveenB2004
 */
public class Database {

    public static String dbLocation
            = HotspotMaker.Details.space + "Extnsions\\Extensions.db";
    public static int dbUpdate = 0;

    public static Connection conn() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:sqlite:"
                    + HotspotMaker.Details.space + "Extnsions\\Extensions.db");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    public void updateDB() {
        String dbSource
                = "https://github.com/NaveenB2004/HotspotMaker/raw"
                + "/main/Extensions/Database/Extensions.db";
        try {
            FileUtils.copyURLToFile(new URL(dbSource), new File(dbLocation));
            dbUpdate = 1;
        } catch (MalformedURLException ex) {
            dbUpdate = 2;
            Logger.getLogger(Database.class.getName())
                    .log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            dbUpdate = 2;
            Logger.getLogger(Database.class.getName())
                    .log(Level.SEVERE, null, ex);
        }

    }

}
