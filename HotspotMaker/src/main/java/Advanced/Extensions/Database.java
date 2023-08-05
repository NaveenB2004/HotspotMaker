package Advanced.Extensions;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author NaveenB2004
 */
public class Database {

    public static Connection conn() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:sqlite:"
                    + HotspotMaker.Details.space + "\\Extnsions\\database.db");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    public static boolean updateDB() {
        boolean connection = false;

        String dbSource = "https://github.com/NaveenB2004/HotspotMaker/raw/main/Extensions/Database/Extensions.db";
        String localSource = HotspotMaker.Details.space + "\\Extnsions\\database.db";

        try {
            FileUtils.copyURLToFile(new URL(dbSource), new File(localSource));
            connection = true;
        } catch (MalformedURLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return connection;
    }

}
