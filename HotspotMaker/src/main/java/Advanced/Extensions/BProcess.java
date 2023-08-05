package Advanced.Extensions;

import java.awt.Desktop;
import java.awt.Frame;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
                setActions("Downloading...");
                try {
                    FileUtils.copyURLToFile(new URL(directLink),
                            new File(extDir + "tmp\\ext-" + extId + ".zip"));
                    setActions("Installing...");

                    new ProcessBuilder("cmd.exe", "/c",
                            "\"" + winrar + "\" "
                            + "x "
                            + extDir + "tmp\\ext-" + extId + ".zip "
                            + extDir + "ext-" + extId).start();

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

    public void btnOpenClickEvt() {

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
