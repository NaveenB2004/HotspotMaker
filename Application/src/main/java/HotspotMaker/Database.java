package HotspotMaker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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
            conn = DriverManager.getConnection("jdbc:sqlite:");
        } catch (SQLException ex) {
            Logger.getLogger(Advanced.Extensions.Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn();
    }
}
