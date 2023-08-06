package Advanced.Extensions;

import Main.Settings;
import java.awt.Desktop;
import java.awt.Frame;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author NaveenB2004
 */
public class BProcess {

    Connection conn = Database.conn();
    String extDir = HotspotMaker.Details.space + "Extnsions\\";
    String winrar = extDir + "winrar\\WinRAR.exe";
    Actions actions = new Actions();
    JLabel actionsStatus = Actions.status;

    JLabel id = Extensions.jLabel5;
    JLabel name = Extensions.jLabel6;
    JLabel author = Extensions.jLabel7;
    JLabel description = Extensions.jLabel10;
    JLabel version = Extensions.jLabel12;
    JLabel release = Extensions.jLabel16;
    JLabel date = Extensions.jLabel19;
    JLabel status = Extensions.jLabel14;
    JButton source = Extensions.jButton8;
    JButton license = Extensions.jButton6;
    JButton web = Extensions.jButton4;
    JButton install = Extensions.jButton1;
    JButton uninstall = Extensions.jButton5;
    JButton open = Extensions.jButton3;

    String sourceLink;
    String licenseLink;
    String webLink;
    String directLink;

    String extId;
    boolean installed;

    public void tableClickEvt(String ExtId) {
        this.extId = ExtId;
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * "
                    + "FROM extensions "
                    + "WHERE id='" + ExtId + "'");
            while (rs.next()) {
                id.setText(rs.getString("id"));
                name.setText(rs.getString("name"));
                author.setText(rs.getString("author"));
                description.setText(rs.getString("description"));
                version.setText(rs.getString("version"));
                release.setText(rs.getString("release"));
                date.setText(rs.getString("date"));

                status.setText(getStatus(version.getText()));

                sourceLink = rs.getString("source");
                licenseLink = rs.getString("license");
                webLink = rs.getString("web");
                directLink = rs.getString("direct");

                btnEnable();
            }
        } catch (SQLException ex) {
            Logger.getLogger(BProcess.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    private void btnEnable() {
        source.setEnabled(true);
        license.setEnabled(true);
        web.setEnabled(true);

        if (new File(extDir + "ext-" + extId + "\\.starter").exists()) {
            install.setIcon(new ImageIcon(
                    getClass().getResource("/Imgs/ico_update_16px_dark.png")));
            install.setToolTipText("Re-install/Update");

            uninstall.setEnabled(true);
            open.setEnabled(true);
            installed = true;

        } else {
            install.setIcon(new ImageIcon(
                    getClass().getResource("/Imgs/ico_download_16px_dark.png")));
            install.setToolTipText("Install");
            installed = false;
        }
    }

    public void btnLicenseClickEvt() {
        callURL(licenseLink);
    }

    public void btnSourceClickEvt() {
        callURL(sourceLink);
    }

    public void btnWebClickEvt() {
        callURL(webLink);
    }

    public void btnUninstallClickEvt() {
        actions.setVisible(true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                setActions("Uninstalling...");
                try {
                    FileUtils.deleteDirectory(new File(extDir + "ext-" + extId));
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Uninstalled!");
                } catch (IOException ex) {
                    Logger.getLogger(BProcess.class.getName())
                            .log(Level.SEVERE, null, ex);
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Error!\n" + ex);
                }
            }
        }).start();
    }

    public void btnInstallClickEvt() {
        actions.setVisible(true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    setActions("Downloading...");
                    FileUtils.copyURLToFile(new URL(directLink),
                            new File(extDir + "tmp\\ext-" + extId + ".zip"));
                    
                    setActions("Checking Extractor...");
                    winrar();

                    setActions("Installing...");
                    new ProcessBuilder("cmd.exe", "/c",
                            "\"" + winrar + "\" "
                            + "x -o+ -ibck "
                            + extDir + "tmp\\ext-" + extId + ".zip "
                            + extDir + "ext-" + extId).start();

                    setActions("Finishing...");
                    FileUtils.deleteDirectory(new File(extDir + "tmp\\ext-" + extId + ".zip"));
                    status.setText(getStatus(version.getText()));

                    btnEnable();

                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Installed!");
                } catch (IOException ex) {
                    Logger.getLogger(BProcess.class.getName())
                            .log(Level.SEVERE, null, ex);
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Error!\n" + ex);
                }
            }
        }).start();
    }

    private void winrar() {
        if (!new File(winrar).exists()){
            try {
                FileUtils.copyURLToFile(new URL(""),
                        new File(winrar));
            } catch (MalformedURLException ex) {
                Logger.getLogger(BProcess.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(BProcess.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void btnOpenClickEvt() {

    }

    private String readStarter() {
        String path = null;
        if (new File(extDir + "ext-" + extId + "\\.starter").exists()) {
            try (Stream<String> lines = Files.lines(
                    Paths.get(extDir + "ext-" + extId + "\\.starter"))) {
                path = lines.skip(0).findFirst().get();
            } catch (IOException e) {
                Logger.getLogger(BProcess.class.getName())
                        .log(Level.SEVERE, null, e);
            }
        }
        return path;
    }

    private String getStatus(String version) {
        String rtnStatus = null;
        String mainApp = readStarter();
        if (mainApp != null) {
            try {
                ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c",
                        extDir + "ext-" + extId + "\\" + mainApp + " -v");
                processBuilder.redirectErrorStream(true);
                Process p = processBuilder.start();
                String line = null;
                BufferedReader bufferedReader
                        = new BufferedReader(new InputStreamReader(p.getInputStream()));
                while ((line = bufferedReader.readLine()) != null) {
                    rtnStatus = line;
                }
            } catch (IOException ex) {
                Logger.getLogger(BProcess.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
            if (!version.equals(rtnStatus)) {
                rtnStatus = "Update Available!";
            } else {
                rtnStatus = "Up-to-Date!";
            }
        } else {
            rtnStatus = "Not Installed!";
        }
        return rtnStatus;
    }

    private void callURL(String passedURL) {
        try {
            Desktop.getDesktop().browse(new URL(passedURL).toURI());
        } catch (IOException | URISyntaxException e) {
            Logger.getLogger(BProcess.class.getName())
                    .log(Level.SEVERE, null, e);
        }
    }

    private void setActions(String text) {
        if (actionsStatus != null) {
            actionsStatus.setText(text);
        }
    }

}
