package Sub;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
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
    boolean updateVer = false;

    public void update() {
        // github clone path
        DB.dbLocation = "D:\\a\\HotspotMaker\\HotspotMaker\\Extensions\\Database\\Extensions.db";
        conn = DB.conn();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, starter "
                    + "FROM extensions");
            while (rs.next()) {
                dbUpdate(rs.getString(1), rs.getString(2));
            }
            if (updateVer == true) {
                String formatter = new SimpleDateFormat("yyyyMMddHHmmss")
                        .format(new Date());
                try {
                    Statement stmt0 = conn.createStatement();
                    stmt0.executeUpdate("UPDATE version "
                            + "SET date='" + formatter + "' WHERE id='1'");
                    System.out.println("Database updated!");
                } catch (SQLException ex) {
                    Logger.getLogger(Main.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            } else {
                System.out.println("No updates available!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Update.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    private void dbUpdate(String id, String starter) {
        System.out.println("Updating ID : " + id + " @ Starter : " + starter);
        boolean tempUpdate = false;
        JSONParser parser = new JSONParser();
        Object obj;
        try {
            URL url = new URL(starter);
            URLConnection urlConn = url.openConnection();
            obj = parser.parse(new BufferedReader(new InputStreamReader(urlConn.getInputStream())));
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
                ResultSet rs = stmt.executeQuery("SELECT * "
                        + "FROM extensions "
                        + "WHERE id='" + id + "'");
                while (rs.next()) {
                    if (!rs.getString(2).equals(name)
                            || !rs.getString(3).equals(author)
                            || !rs.getString(4).equals(description)
                            || !rs.getString(5).equals(version)
                            || !rs.getString(6).equals(release)
                            || !rs.getString(7).equals(date)
                            || !rs.getString(8).equals(source)
                            || !rs.getString(9).equals(license)
                            || !rs.getString(10).equals(web)
                            || !rs.getString(11).equals(download)
                            || !rs.getString(12).equals(starterx)) {
                        tempUpdate = true;
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(Update.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
            if (tempUpdate == true) {
                updateVer = true;
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
