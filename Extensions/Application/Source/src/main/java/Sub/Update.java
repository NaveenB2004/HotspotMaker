package Sub;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author NaveenB2004
 */
public class Update {

    Connection conn;

    public void update() {
        DB.dbLocation = "D:\\a\\HotspotMaker\\HotspotMaker\\Extensions\\Database\\Extensions.db";

        conn = DB.conn();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, starter "
                    + "FROM extensions");
            while (rs.next()) {
                dbUpdate(rs.getString(1), rs.getString(2));
            }

            try {
                Statement stmt0 = conn.createStatement();
                stmt0.executeUpdate("INSERT INTO version "
                        + "(date) VALUES "
                        + "('" + new SimpleDateFormat("yyyyMMddHHmmss")
                                .format(new Date()) + "')");
            } catch (SQLException ex) {
                Logger.getLogger(DB.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    private void dbUpdate(String id, String starter) {
        System.out.println("Updating ID : " + id + " @ Starter : " + starter);
        JSONParser parser = new JSONParser();
        Object obj;
        try {
            obj = parser.parse(new FileReader(starter));
            JSONObject jsonObject = (JSONObject) obj;

            String name = (String) jsonObject.get("Name");
            String author = (String) jsonObject.get("Author");
            String description = (String) jsonObject.get("Description");
            String version = (String) jsonObject.get("Version");
            String release = (String) jsonObject.get("Release");
            String date = (String) jsonObject.get("Date");
            String source = (String) jsonObject.get("Source");
            String license = (String) jsonObject.get("License");
            String web = (String) jsonObject.get("Web");
            String download = (String) jsonObject.get("Download");
            String starterx = (String) jsonObject.get("Starter");

            try {
                Statement stmt = conn.createStatement();
                stmt.executeUpdate("UPDATE extensions "
                        + "SET name='" + name + "', "
                        + "author='" + author + "', "
                        + "description='" + description + "', "
                        + "version='" + version + "', "
                        + "release='" + release + "', "
                        + "date='" + date + "', "
                        + "source='" + source + "', "
                        + "license='" + license + "', "
                        + "web='" + web + "', "
                        + "download='" + download + "', "
                        + "starter='" + starterx + "' "
                        + "WHERE id='" + id + "'");
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Update.class.getName())
                    .log(Level.SEVERE, null, ex);
        } catch (IOException | ParseException ex) {
            Logger.getLogger(Update.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }
}
