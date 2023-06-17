package HotspotMaker;

import java.awt.Frame;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.swing.JOptionPane;

/**
 *
 * @author NaveenB2004
 */
public class Status {

    public void checkStatus() {
        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c",
                            "netsh wlan show drive");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                System.out.println(line);
                if (line.startsWith("Hosted network supported") && line.endsWith("Yes")) {
                    Details.support = true;
                }
            }
            if (Details.support = false) {
                JOptionPane.showMessageDialog(new Frame(),
                        "Your network interface doesn't support for make hotspot!");
                System.exit(0);
            }
        } catch (IOException e) {
            System.out.println(e);
        }

        try {
            ProcessBuilder processBuilder
                    = new ProcessBuilder("cmd.exe", "/c",
                            "netsh wlan show hostednetwork");
            processBuilder.redirectErrorStream(true);
            Process p = processBuilder.start();
            String line = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = bufferedReader.readLine()) != null) {
                System.out.println(line);
                if (line.startsWith("Status") && line.endsWith("Not started")) {
                    Details.status = false;
                }
            }
            System.out.println(Details.status);
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}
