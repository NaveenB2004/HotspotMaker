package Main;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 *
 * @author NaveenB2004
 */
public class Extensions {

    public static void main(String[] args) {
        try {
            if (args[0].equals("-update")) {
                new Sub.Update().update();
            }
        } catch (Exception e) {
            FlatDarkLaf.setup();
            new Sub.Main().setVisible(true);
        }
    }
}
