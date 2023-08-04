package Sub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NaveenB2004
 */
public class DB {

    public static String dbLocation;

    public static Connection conn() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:sqlite::memory:");
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }

    public void mkdb() {
        Connection conn = conn();
        if (!dbLocation.endsWith("Extensions.db")) {
            dbLocation += "\\Extensions.db";
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
                        + "date TEXT NOT NULL,"
                        + "license TEXT NOT NULL,"
                        + "web TEXT NOT NULL,"
                        + "direct TEXT NOT NULL)");
            } catch (SQLException ex) {
                Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                Statement stmt = conn.createStatement();
                stmt.executeUpdate("CREATE TABLE version("
                        + "id INTEGER PRIMARY KEY,"
                        + "date TEXT NOT NULL)");
                Statement stmt0 = conn.createStatement();
                stmt0.executeUpdate("INSERT INTO version "
                        + "(date) VALUES "
                        + "('" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "')");
            } catch (SQLException ex) {
                Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                Statement stmt = conn.createStatement();
                stmt.executeUpdate("restore from " + dbLocation);
            } catch (SQLException ex) {
                Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
