package HotspotMaker;

import java.awt.AWTException;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Menu;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.Toolkit;
import java.awt.TrayIcon;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.MalformedURLException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.CodeSource;
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
    private static SystemTray tray;
    private static PopupMenu menu;
    private static TrayIcon icon = null;
    private static MenuItem start;
    private static MenuItem stop;

    public void duplicateStatus() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                String port = "2004";
                if (new File(Details.space + "defPort.ini").exists()) {
                    try (Stream<String> lines = Files.lines(Paths.get(Details.space
                            + "defPort.ini"))) {
                        port = lines.skip(0).findFirst().get();
                    } catch (IOException e) {
                        Logger.getLogger(Actions.class.getName())
                                .log(Level.SEVERE, null, e);
                    }
                }
                try {
                    ServerSocket server = new ServerSocket(Integer.parseInt(port));
                    while (true) {
                        server.accept();
                        ActionEvent e = null;
                        trayOpenListner(e);
                    }
                } catch (IOException ex) {
                    try {
                        new Socket("localhost", Integer.parseInt(port));
                    } catch (IOException ex1) {
                        Logger.getLogger(Actions.class.getName())
                                .log(Level.SEVERE, null, ex1);
                    }
                    System.exit(0);
                }
            }
        }).start();
    }

    public void setTrayIcon() {
        if (SystemTray.isSupported() == true) {
            tray = SystemTray.getSystemTray();
            menu = new PopupMenu();
            icon = new TrayIcon(Toolkit.getDefaultToolkit().getImage(
                    getClass().getResource("/Imgs/Icon.png")), "Hotspot Maker");

            Menu open = new Menu("Hotspot Maker");
            start = new MenuItem("Start");
            stop = new MenuItem("Stop");
            MenuItem extensions = new MenuItem("Extensions");
            MenuItem settings = new MenuItem("Settings");
            MenuItem about = new MenuItem("About");
            MenuItem exit = new MenuItem("Exit");

            icon.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayOpenListner(e);
                }
            });
            start.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayStartListner(e);
                }
            });
            stop.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayStopListner(e);
                }
            });
            extensions.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayExtensionsListner(e);
                }
            });
            settings.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    traySettingsListner(e);
                }
            });
            about.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayAboutListner(e);
                }
            });
            exit.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    trayExitListner(e);
                }
            });

            open.add(start);
            open.add(stop);

            menu.add(open);
            menu.add(extensions);
            menu.add(settings);
            menu.add(about);
            menu.add(exit);

            icon.setPopupMenu(menu);
            icon.setImageAutoSize(true);

            try {
                tray.add(icon);
            } catch (AWTException ex) {
                Logger.getLogger(Actions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateTrayIcon(boolean status) {
        if (icon != null) {
            String updatedIcon;
            if (status == true) {
                start.setEnabled(false);
                stop.setEnabled(true);
                updatedIcon = "active";
            } else {
                start.setEnabled(true);
                stop.setEnabled(false);
                updatedIcon = "deactive";
            }
            icon.setImage(Toolkit.getDefaultToolkit().getImage(
                    getClass().getResource("/Imgs/Icon_" + updatedIcon + ".png")));
        }
    }

    private void trayOpenListner(ActionEvent e) {
        Details.fromTrayMenu = true;
        if (Details.main == null) {
            Details.main = new Main.MainUI();
        }
        Details.main.setVisible(true);
    }

    private void trayStartListner(ActionEvent e) {
        if (Details.defCred()[0].equals("true")) {
            start.setEnabled(false);
            String command = "netsh wlan set hostednetwork mode=allow ssid=\""
                    + Details.defCred()[1] + "\" key=\"" + Details.defCred()[2]
                    + "\" && netsh wlan start hostednetwork";
            new Main.MainUI().silentProcess(command);
        } else {
            int download = JOptionPane.showConfirmDialog(null,
                    "Set default SSID & Password first!\nDo you want to do it now?",
                    "Warning", JOptionPane.YES_NO_OPTION);
            if (download == JOptionPane.YES_OPTION) {
                traySettingsListner(e);
            }
        }
    }

    private void trayStopListner(ActionEvent e) {
        String command = "netsh wlan stop hostednetwork";
        new Main.MainUI().silentProcess(command);
    }

    private void trayExtensionsListner(ActionEvent e) {
        Details.fromTrayMenu = true;
        if (Details.extensions == null) {
            Details.extensions = new Extensions.Extensions();
        }
        Details.extensions.setVisible(true);
    }

    private void traySettingsListner(ActionEvent e) {
        Details.fromTrayMenu = true;
        if (Details.settings == null) {
            Details.settings = new Main.Settings();
        }
        Details.settings.setVisible(true);
    }

    private void trayAboutListner(ActionEvent e) {
        Details.fromTrayMenu = true;
        if (Details.about == null) {
            Details.about = new Main.About();
        }
        Details.about.setVisible(true);
    }

    private void trayExitListner(ActionEvent e) {
        System.exit(0);
    }

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
                                updateTrayIcon(false);
                                Details.status = false;
                                if (Main.MainUI.realState != null) {
                                    Main.MainUI.realState.setText("Not Started!");
                                    Main.MainUI.realState.setBackground(Color.YELLOW);
                                    Main.MainUI.realState.setForeground(Color.BLACK);
                                }
                            }
                            if (line.endsWith("Started")) {
                                updateTrayIcon(true);
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
                        if (Details.autoUpdate() == false) {
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
        if (new File(Details.space + "HotspotMaker." + ext).exists()) {
            try {
                // wait 5 seconds to stop the application
                // delete the base app
                // restore the base app with update
                try (PrintStream out = new PrintStream(
                        new File(Details.space + "Installer.bat"))) {
                    out.println("@Echo off");
                    out.println("title Hotspot Maker - Updater");
                    out.println("echo Updating Hotspot Maker...");
                    out.println("timeout /t 5");
                    out.println("del \"" + workingPath() + "\"");
                    out.println("move \"" + Details.space + "HotspotMaker."
                            + ext + "\" \"" + workingPath() + "\"");
                    out.println(appTrigger());
                    out.println("exit");
                } catch (FileNotFoundException e) {
                    Logger.getLogger(Actions.class.getName())
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

    private static String appTrigger() {
        String appTrigger = null;
        try {
            CodeSource codeSource = HotspotMaker.class.getProtectionDomain().getCodeSource();
            File jarFile = new File(codeSource.getLocation().toURI().getPath());
            String jarDir = jarFile.getParentFile().getPath();

            if (workingPath().endsWith("jar")) {
                if (new File(jarDir + "\\JRE\\bin\\java.exe").exists()) {
                    appTrigger = "start \"" + jarDir + "\\JRE\\bin\\javaw.exe\" \""
                            + workingPath() + "\"";
                } else {
                    appTrigger = "start javaw -jar \"" + workingPath() + "\"";
                }
            } else {
                appTrigger = "\"" + workingPath() + "\"";
            }

        } catch (URISyntaxException ex) {
            Logger.getLogger(Actions.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return appTrigger;
    }

}
