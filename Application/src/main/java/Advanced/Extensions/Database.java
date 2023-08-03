package Advanced.Extensions;

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
            conn = DriverManager.getConnection("jdbc:sqlite::resource:"
                    + "https://github.com/NaveenB2004/HotspotMaker/blob/main/Others/Extensions.db");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn();
    }

}
