package Advanced.Extensions;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NaveenB2004
 */
public class Database {

    public static String dbLink
            = "https://raw.githubusercontent.com/NaveenB2004/HotspotMaker/main/Others/Extensions.db";

    public static Connection Rconn() {
        Connection Rconn = null;
        try {
            Rconn = DriverManager.getConnection("jdbc:sqlite::resource:" + dbLink);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rconn();
    }

    public static Connection Lconn() {
        Connection Lconn = null;
        if (!new File(HotspotMaker.Details.space + "\\Extnsions").exists()) {
            new File(HotspotMaker.Details.space + "\\Extnsions").mkdirs();
        }
        try {
            Lconn = DriverManager.getConnection("jdbc:sqlite:"
                    + HotspotMaker.Details.space + "\\Extnsions\\database.db");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Lconn();
    }

    public static void LdbSetup() {
        Connection conn = Lconn();
        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("CREATE TABLE extensions("
                    + "id INTEGER PRIMARY KEY,"
                    + "name TEXT NOT NULL,"
                    + "author TEXT NOT NULL,"
                    + "source TEXT NOT NULL,"
                    + "description TEXT NOT NULL,"
                    + "version TEXT NOT NULL,"
                    + "release TEXT NOT NULL,"
                    + "license TEXT NOT NULL,"
                    + "web TEXT NOT NULL"
                    + "direct TEXT NOT NULL)");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
