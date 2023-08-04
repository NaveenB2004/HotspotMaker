package Main;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 *
 * @author NaveenB2004
 */
public class Extensions {

    public static void main(String[] args) {
        FlatDarkLaf.setup();
        new Sub.Main().setVisible(true);
    }
}
