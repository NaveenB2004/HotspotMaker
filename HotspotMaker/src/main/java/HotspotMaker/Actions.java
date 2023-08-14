package HotspotMaker;

import Main.Settings;
import java.awt.Color;
import java.awt.Frame;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import javax.swing.JOptionPane;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author NaveenB2004
 */
public class Actions {

    Extensions.Actions actions = new Extensions.Actions();

    public static String workingPath() {
        String workingPath = null;
        try {
            workingPath = new File(HotspotMaker.class.getProtectionDomain()
                    .getCodeSource().getLocation().toURI()).getPath();
        } catch (URISyntaxException ex) {
            Logger.getLogger(Actions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return workingPath;
    }

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
        }, "Hotspot Status").start();
    }

    public void checkUpdateStatus() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                if (new File(Details.space + "AutoUpdate.ini").exists()) {
                    try (Stream<String> lines
                            = Files.lines(Paths.get(Details.space
                                    + "AutoUpdate.ini"))) {
                        Details.autoUpdate = lines.skip(0).findFirst().get()
                                .equals("Enabled");
                    } catch (IOException ex) {
                        Logger.getLogger(Actions.class.getName())
                                .log(Level.SEVERE, null, ex);
                    }
                }

                String tempversion = null;
                try {
                    URL url = new URL(
                            "https://raw.githubusercontent.com/"
                            + "naveenb2004/HotspotMaker/main/Others/LatestVersion.txt");
                    URLConnection con = url.openConnection();
                    InputStream is = con.getInputStream();
                    try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
                        String line;
                        while ((line = br.readLine()) != null) {
                            tempversion = line;
                        }
                    }
                    if (tempversion != null && !tempversion.equals(Details.version)) {
                        if (Details.autoUpdate == false) {
                            int download = JOptionPane.showConfirmDialog(null,
                                    "New Version Available!\nDo you want to "
                                    + "download the new version?"
                                    + "\nVersion : " + tempversion,
                                    "Warning", JOptionPane.YES_NO_OPTION);
                            if (download == JOptionPane.YES_OPTION) {
                                downloadUpdate(tempversion);
                            }
                        } else {
                            downloadUpdate(tempversion);
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
        }, "Update Check").start();
    }

    private void downloadUpdate(String tempversion) {
        actions.setVisible(true);
        actions.setTitle("Update");
        setAction("Downloading update (v" + tempversion + ") ...");

        String jarURL = "https://github.com/NaveenB2004/"
                + "HotspotMaker/releases/download/v" + tempversion
                + "/Hotspot.Maker.Demo.jar";
        String exeURL = "https://github.com/NaveenB2004/"
                + "HotspotMaker/releases/download/v" + tempversion
                + "/Hotspot.Maker.Portable.exe";

        String url;
        String name;
        if (workingPath().endsWith("jar")) {
            url = jarURL;
            name = "jar";
        } else {
            url = exeURL;
            name = "exe";
        }

        try {
            if (new File(Details.space + "HotspotMaker.temp").exists()) {
                FileUtils.delete(new File(Details.space + "HotspotMaker.temp"));
            }
            FileUtils.copyURLToFile(new URL(url), new File(Details.space
                    + "HotspotMaker.temp"));
            new File(Details.space + "HotspotMaker.temp")
                    .renameTo(new File(Details.space + "HotspotMaker." + name));
            actions.dispose();
            JOptionPane.showMessageDialog(new Frame(), "Download completed!\n"
                    + "Next time you start, update will install.");
        } catch (MalformedURLException ex) {
            Logger.getLogger(Actions.class.getName())
                    .log(Level.SEVERE, null, ex);
            actions.dispose();
            JOptionPane.showMessageDialog(new Frame(), "Error\n" + ex);
        } catch (IOException ex) {
            Logger.getLogger(Actions.class.getName())
                    .log(Level.SEVERE, null, ex);
            actions.dispose();
            JOptionPane.showMessageDialog(new Frame(), "Error\n" + ex);
        }
    }

    private void setAction(String text) {
        if (Extensions.Actions.status != null) {
            Extensions.Actions.status.setText(text);
        }
    }

    public void updateAndRestart() {
        String ext;
        if (workingPath().endsWith("jar")) {
            ext = "jar";
        } else {
            ext = "exe";
        }
        if (new File(Details.space + "Installer.bat").exists()) {
            try {
                FileUtils.delete(new File(Details.space + "Installer.bat"));
            } catch (IOException ex) {
                Logger.getLogger(Actions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
        if (new File(Details.space + "HotspotMaker." + ext).exists()) {
            System.out.println("exist");
            try {
                // wait 5 seconds to stop the application
                // delete the base app
                // restore the base app with update
                try (PrintStream out = new PrintStream(
                        new File(Details.space + "Installer.bat"))) {
                    out.println("@Echo off");
                    out.println("echo Updating Hotspot Maker...");
                    out.println("timeout /t 5");
                    out.println("del \"" + workingPath() + "\"");
                    out.println("move \"" + Details.space + "HotspotMaker."
                            + ext + "\" \"" + workingPath() + "\"");
                    out.println("start \"" + workingPath() + "\"");
                    out.println("exit");
                } catch (FileNotFoundException e) {
                    Logger.getLogger(Settings.class.getName())
                            .log(Level.SEVERE, null, e);
                }
                new ProcessBuilder("cmd.exe", "/c", "start "
                        + Details.space + "Installer.bat").start();
                System.exit(0);
            } catch (IOException ex) {
                Logger.getLogger(Actions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
    }

}
