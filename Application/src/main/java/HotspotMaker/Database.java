package HotspotMaker;

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

    public static Connection conn() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:sqlite:" + Details.space + "database.db");
            Statement stmt = conn.createStatement();
            stmt.execute("PRAGMA foreign_keys = ON");
        } catch (SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }

    public void mkdb() {
        try {
            Statement stmt = conn().createStatement();
            stmt.executeUpdate("CREATE TABLE credentials("
                    + "id INTEGER PRIMARY KEY,"
                    + "SSID TEXT NOT NULL,"
                    + "password TEXT NOT NULL)");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Statement stmt = conn().createStatement();
            stmt.executeUpdate("CREATE TABLE lookandfeel("
                    + "id INTEGER PRIMARY KEY,"
                    + "theme TEXT NOT NULL)");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
