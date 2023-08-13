package HotspotMaker;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.Frame;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author NaveenB2004
 */
public class Actions {

    public void checkStarterStatus() {
        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c",
                            "netsh wlan show drive");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains("Hosted network supported") 
                        && line.endsWith("No")) {
                    JOptionPane.showMessageDialog(new Frame(),
                            "Your network interface doesn't support for make hotspot!");
                    System.exit(0);
                }
            }
        } catch (IOException e) {
            Logger.getLogger(Actions.class.getName())
                    .log(Level.SEVERE, null, e);
        }
    }

    public void checkHotspotStatus() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        ProcessBuilder processBuilder
                                = new ProcessBuilder("cmd.exe", "/c",
                                        "netsh wlan show hostednetwork");
                        processBuilder.redirectErrorStream(true);
                        Process p = processBuilder.start();
                        String line = null;
                        BufferedReader bufferedReader = new BufferedReader(
                                new InputStreamReader(p.getInputStream()));
                        while ((line = bufferedReader.readLine()) != null) {
                            if (line.endsWith("Not started")) {
                                Details.status = false;
                                if (Main.MainUI.realState != null) {
                                    Main.MainUI.realState.setText("Not Started!");
                                    Main.MainUI.realState.setBackground(Color.YELLOW);
                                    Main.MainUI.realState.setForeground(Color.BLACK);
                                }
                            }
                            if (line.endsWith("Started")) {
                                Details.status = true;
                                if (Main.MainUI.realState != null) {
                                    Main.MainUI.realState.setText("Started!");
                                    Main.MainUI.realState.setBackground(Color.GREEN);
                                    Main.MainUI.realState.setForeground(Color.BLACK);
                                }
                            }
                            if (line.contains("Number of clients")
                                    && Main.MainUI.clientsConnected != null) {
                                String[] clients = line.split(": ");
                                Main.MainUI.clientsConnected.setText(clients[1]);
                            }
                            if (line.contains("Max number of clients")
                                    && Main.MainUI.clientsCanConnect != null) {
                                String[] clients = line.split(": ");
                                Main.MainUI.clientsCanConnect.setText(clients[1]);
                            }
                        }
                    } catch (IOException e) {
                        Logger.getLogger(Actions.class.getName())
                                .log(Level.SEVERE, null, e);
                    }
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Actions.class.getName())
                                .log(Level.SEVERE, null, ex);
                    }
                }
            }
        }).start();
    }

    public void checkUpdateStatus() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                String tempversion = null;
                try {
                    URL url = new URL(
                            "https://raw.githubusercontent.com/"
                            + "naveenb2004/HotspotMaker/main/Others/LatestVersion.txt");
                    URLConnection con = url.openConnection();
                    InputStream is = con.getInputStream();
                    try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
                        String line = null;
                        while ((line = br.readLine()) != null) {
                            tempversion = line;
                        }
                    }
                    if (!tempversion.equals(Details.version)) {
                        int download = JOptionPane.showConfirmDialog(null,
                                "New Version Available!\nDo you want to download the new version?"
                                + "\nVersion : " + tempversion,
                                "Warning", JOptionPane.YES_NO_OPTION);
                        if (download == JOptionPane.YES_OPTION) {
                            try {
                                Desktop.getDesktop().browse(new URL(
                                        "https://github.com/naveenb2004/HotspotMaker/releases").toURI());
                            } catch (IOException | URISyntaxException e) {
                                Logger.getLogger(Actions.class.getName())
                                        .log(Level.SEVERE, null, e);
                            }
                        }
                    }
                } catch (MalformedURLException e) {
                    Logger.getLogger(Actions.class.getName())
                            .log(Level.SEVERE, null, e);
                } catch (IOException e) {
                    Logger.getLogger(Actions.class.getName())
                            .log(Level.SEVERE, null, e);
                }
            }
        }).start();
    }

}
