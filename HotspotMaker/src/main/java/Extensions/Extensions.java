package Extensions;

import java.awt.Desktop;
import java.awt.Frame;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author NaveenB2004
 */
public class Extensions extends javax.swing.JFrame {

    /**
     * Creates new form Extensions
     */
    public Extensions() {
        initComponents();
        startup();
        this.setIconImage(Toolkit.getDefaultToolkit().getImage(
                getClass().getResource("/Imgs/Icon.png")));
    }

    Actions actions = new Actions();
    Connection conn;
    JLabel status = Actions.status;
    DefaultTableModel model;
    String extDir = HotspotMaker.Details.space + "Extnsions\\";
    String winrar = extDir + "winrar\\WinRAR.exe";
    String extId;

    String sourceLink;
    String licenseLink;
    String webLink;
    String directLink;
    String starterLink;

    private void startup() {
        model = (DefaultTableModel) jTable1.getModel();
        actions.setVisible(true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                status.setText("Checking Database...");
                if (!new File(Database.dbLocation).exists()) {
                    updateDB();
                } else {
                    readDB();
                }
            }
        }).start();
    }

    private void updateDB() {
        if (!actions.isVisible()) {
            actions.setVisible(true);
        }
        setActions("Downloading Database...");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
        Database.dbUpdate = 0;
        Database.updateDB();
        while (Database.dbUpdate == 0) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
        if (Database.dbUpdate == 1) {
            String ver = jLabel22.getText();
            readDB();
            if (!ver.equals(jLabel22.getText())) {
                ver = "Hooray! New version of Database!";
            } else {
                ver = "";
            }
            JOptionPane.showMessageDialog(new Frame(),
                    "Done!\n" + ver);
        } else {
            actions.dispose();
            JOptionPane.showMessageDialog(new Frame(),
                    "Something went wrong!\nTry again later!");
        }
    }

    private void readDB() {
        conn = Database.conn();
        model.setRowCount(0);
        clearFields();
        setActions("Fetching Data...");
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT date "
                    + "FROM version");
            while (rs.next()) {
                jLabel22.setText(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Extensions.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(id) "
                    + "FROM extensions");
            while (rs.next()) {
                jLabel21.setText(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Extensions.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, name, author "
                    + "FROM extensions");
            while (rs.next()) {
                Object[] row = {rs.getString(1), rs.getString(2),
                    rs.getString(3)};
                model.addRow(row);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Extensions.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        actions.dispose();
    }

    private void clearFields() {
        jLabel5.setText("---");
        jLabel6.setText("---");
        jLabel7.setText("---");
        jLabel10.setText("---");
        jLabel14.setText("---");
        jLabel12.setText("---");
        jLabel12.setText("---");
        jLabel12.setText("---");
        jButton6.setEnabled(false);
        jButton8.setEnabled(false);
        jButton4.setEnabled(false);
        jButton5.setEnabled(false);
        jButton1.setEnabled(false);
        jButton3.setEnabled(false);
        jButton1.setIcon(new ImageIcon(
                getClass().getResource("/Imgs/ico_download_16px_dark.png")));
        jButton1.setToolTipText("Install");
    }

    private void setActions(String text) {
        if (status != null) {
            status.setText(text);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jFileChooser1 = new javax.swing.JFileChooser();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jButton4 = new javax.swing.JButton();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jButton6 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jLabel17 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        jButton8 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jLabel18 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        jButton7 = new javax.swing.JButton();

        jFileChooser1.setDialogTitle("Import Extension (.source)");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Extensions");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Name", "Author"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        if (jTable1.getColumnModel().getColumnCount() > 0) {
            jTable1.getColumnModel().getColumn(0).setMaxWidth(60);
        }

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), "Details : "));

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_download_16px_dark.png"))); // NOI18N
        jButton1.setToolTipText("Install");
        jButton1.setEnabled(false);
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_open_16px_dark.png"))); // NOI18N
        jButton3.setToolTipText("Open");
        jButton3.setEnabled(false);
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jLabel2.setText("ID : ");

        jLabel1.setText("Name : ");

        jLabel3.setText("Author : ");

        jLabel4.setText("Description : ");

        jLabel5.setText("---");

        jLabel6.setText("---");

        jLabel7.setText("---");

        jLabel10.setText("---");

        jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_web_16px_dark.png"))); // NOI18N
        jButton4.setToolTipText("Web");
        jButton4.setEnabled(false);
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jLabel11.setText("Version : ");

        jLabel12.setText("---");

        jLabel13.setText("Status : ");

        jLabel14.setText("---");

        jLabel15.setText("Release : ");

        jLabel16.setText("---");

        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_copyright_16px_dark.png"))); // NOI18N
        jButton6.setToolTipText("License");
        jButton6.setEnabled(false);
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_delete_16px_dark.png"))); // NOI18N
        jButton5.setToolTipText("Uninstall");
        jButton5.setEnabled(false);
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jLabel17.setText("Date : ");

        jLabel19.setText("---");

        jButton8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_source_16px_dark.png"))); // NOI18N
        jButton8.setToolTipText("Source");
        jButton8.setEnabled(false);
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel11, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                            .addComponent(jLabel15, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel12, javax.swing.GroupLayout.DEFAULT_SIZE, 80, Short.MAX_VALUE)
                            .addComponent(jLabel16, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton8, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel13, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel14, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel17, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel19, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel5)
                    .addComponent(jLabel11)
                    .addComponent(jLabel12))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel6)
                    .addComponent(jLabel15)
                    .addComponent(jLabel16))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jLabel7)
                    .addComponent(jLabel17)
                    .addComponent(jLabel19))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel10))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel13)
                    .addComponent(jLabel14))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton8, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 472, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 254, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_about_16px_dark.png"))); // NOI18N
        jButton2.setToolTipText("About");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel18.setText("Extensions Found : ");

        jLabel20.setText("Database version : ");

        jLabel21.setText("---");

        jLabel22.setText("---");

        jButton7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imgs/ico_database_16px_dark.png"))); // NOI18N
        jButton7.setToolTipText("Check Database Updates");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel18, javax.swing.GroupLayout.DEFAULT_SIZE, 120, Short.MAX_VALUE)
                            .addComponent(jLabel20, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 237, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(jLabel21, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton7, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel18)
                            .addComponent(jLabel21))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel20)
                            .addComponent(jLabel22)))
                    .addComponent(jButton7, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        // TODO add your handling code here:
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
        new Main.MainUI().setVisible(true);
    }//GEN-LAST:event_formWindowClosed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
        // TODO add your handling code here:
        new Thread(new Runnable() {
            @Override
            public void run() {
                jButton7.setEnabled(false);
                updateDB();
                jButton7.setEnabled(true);
            }
        }).start();
    }//GEN-LAST:event_jButton7ActionPerformed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        clearFields();
        extId = model.getValueAt(jTable1.getSelectedRow(), 0).toString();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * "
                    + "FROM extensions "
                    + "WHERE id='" + extId + "'");
            while (rs.next()) {
                jLabel5.setText(rs.getString("id"));
                jLabel6.setText(rs.getString("name"));
                jLabel7.setText(rs.getString("author"));
                jLabel10.setText(rs.getString("description"));
                jLabel12.setText(rs.getString("version"));
                jLabel16.setText(rs.getString("release"));
                jLabel19.setText(rs.getString("date"));

                jLabel14.setText(getStatus(jLabel12.getText()));

                sourceLink = rs.getString("source");
                licenseLink = rs.getString("license");
                webLink = rs.getString("web");
                directLink = rs.getString("download");
                starterLink = rs.getString("starter");

                btnEnable();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Extensions.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        // TODO add your handling code here:
        callURL(licenseLink);
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        // TODO add your handling code here:
        callURL(sourceLink);
    }//GEN-LAST:event_jButton8ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        callURL(webLink);
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
        actions.setVisible(true);
        tempBtnDisable();
        new Thread(new Runnable() {
            @Override
            public void run() {
                setActions("Uninstalling...");
                try {
                    FileUtils.deleteDirectory(new File(extDir + "ext-" + extId));
                    jLabel14.setText(getStatus(jLabel12.getText()));
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Uninstalled!");
                } catch (IOException ex) {
                    Logger.getLogger(Extensions.class.getName())
                            .log(Level.SEVERE, null, ex);
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Error!\n" + ex);
                }
                btnEnable();
            }
        }).start();
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        actions.setVisible(true);
        tempBtnDisable();
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    setActions("Downloading...");
                    FileUtils.copyURLToFile(new URL(directLink),
                            new File(extDir + "tmp\\ext-" + extId + ".zip"));
                    FileUtils.copyURLToFile(new URL(starterLink),
                            new File(extDir + "tmp\\ext-" + extId + ".starter"));

                    setActions("Checking Installer...");
                    winrar();

                    setActions("Installing...");
                    if (!new File(extDir + "ext-" + extId).exists()) {
                        new File(extDir + "ext-" + extId).mkdirs();
                    }
                    if (new File(extDir + "ext-" + extId + "\\.starter").exists()) {
                        FileUtils.delete(new File(extDir + "ext-" + extId + "\\.starter"));
                    }
                    FileUtils.moveFile(new File(extDir + "tmp\\ext-" + extId + ".starter"),
                            new File(extDir + "ext-" + extId + "\\.starter"));
                    ProcessBuilder extract = new ProcessBuilder("cmd.exe", "/c",
                            "\"" + winrar + "\" "
                            + "x -o+ -ibck "
                            + extDir + "tmp\\ext-" + extId + ".zip "
                            + extDir + "ext-" + extId);
                    Process install = extract.start();
                    install.waitFor();

                    setActions("Finishing...");
                    FileUtils.delete(new File(extDir + "tmp\\ext-" + extId + ".zip"));
                    jLabel14.setText(getStatus(jLabel12.getText()));
                    actions.dispose();
                    JOptionPane.showMessageDialog(new Frame(), "Installed!");
                } catch (IOException | InterruptedException ex) {
                    Logger.getLogger(Extensions.class.getName())
                            .log(Level.SEVERE, null, ex);
                    actions.dispose();
                }
                btnEnable();
            }
        }).start();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        if (readStarter()[6] != null) {
            boolean launchStatus = false;
            try {
                ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c",
                        "\"" + readStarter()[3] + "\"");
                processBuilder.redirectErrorStream(true);
                Process p = processBuilder.start();
                String line = null;
                BufferedReader bufferedReader
                        = new BufferedReader(new InputStreamReader(p.getInputStream()));
                while ((line = bufferedReader.readLine()) != null) {
                    if (line.contains(readStarter()[4])) {
                        launchStatus = true;
                    }
                }
            } catch (IOException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }

            if (launchStatus == true) {
                try {
                    new ProcessBuilder("cmd.exe", "/c",
                            readStarter()[2]
                            + "\"" + extDir + "ext-" + extId + "\\" + readStarter()[0] + "\"")
                            .start();
                } catch (IOException ex) {
                    Logger.getLogger(Extensions.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            } else {
                int option = JOptionPane.showConfirmDialog(this,
                        "Required runtime not installed!\n"
                        + "Required runtime : " + readStarter()[1] + "\n"
                        + "Do you want to install it now?",
                        "Runtime Error!",
                        JOptionPane.YES_NO_OPTION);
                if (option == JOptionPane.YES_OPTION) {
                    callURL(readStarter()[5]);
                }
            }
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        callURL("https://github.com/NaveenB2004/HotspotMaker/blob/"
                + "main/Extensions/README.md");
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Extensions.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Extensions.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Extensions.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Extensions.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Extensions().setVisible(true);
            }
        });
    }

    private String getStatus(String version) {
        String rtnStatus = null;
        if (readStarter()[6] != null) {
            try {
                ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c",
                        readStarter()[2]
                        + "\"" + extDir + "ext-" + extId + "\\" + readStarter()[0] + "\" -v");
                processBuilder.redirectErrorStream(true);
                Process p = processBuilder.start();
                String line = null;
                BufferedReader bufferedReader
                        = new BufferedReader(new InputStreamReader(p.getInputStream()));
                while ((line = bufferedReader.readLine()) != null) {
                    System.out.println(line);
                    rtnStatus = line;
                }
            } catch (IOException ex) {
                Logger.getLogger(Extensions.class.getName())
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

    private String[] readStarter() {
        String[] starter = new String[7];
        starter[6] = null;
        if (new File(extDir + "ext-" + extId + "\\.starter").exists()) {
            JSONParser parser = new JSONParser();
            try {
                FileReader reader = new FileReader(extDir + "ext-" + extId + "\\.starter");
                Object obj = parser.parse(reader);
                JSONObject jsonObject = (JSONObject) obj;
                starter[0] = (String) jsonObject.get("ExeName");
                starter[1] = (String) jsonObject.get("Runtime");
                starter[2] = ((String) jsonObject.get("RuntimeCall")) + " ";
                starter[3] = (String) jsonObject.get("RuntimeAvailability");
                starter[4] = (String) jsonObject.get("AvailabilityOutcome");
                starter[5] = (String) jsonObject.get("RuntimeDownload");
                starter[6] = "valid";
                reader.close();
            } catch (FileNotFoundException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            } catch (IOException | ParseException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
        return starter;
    }

    private void btnEnable() {
        jTable1.setEnabled(true);
        jButton7.setEnabled(true);
        jButton8.setEnabled(true);
        jButton6.setEnabled(true);
        jButton4.setEnabled(true);
        jButton1.setEnabled(true);

        if (new File(extDir + "ext-" + extId + "\\.starter").exists()) {
            jButton1.setIcon(new ImageIcon(
                    getClass().getResource("/Imgs/ico_update_16px_dark.png")));
            jButton1.setToolTipText("Re-install/Update");

            jButton5.setEnabled(true);
            jButton3.setEnabled(true);

        } else {
            jButton1.setIcon(new ImageIcon(
                    getClass().getResource("/Imgs/ico_download_16px_dark.png")));
            jButton1.setToolTipText("Install");
        }
    }

    private void winrar() {
        if (!new File(winrar).exists()) {
            setActions("Downloading Installer...");
            try {
                FileUtils.copyURLToFile(new URL(
                        "https://github.com/NaveenB2004/HotspotMaker/raw/"
                        + "main/Extensions/Installer/WinRAR.exe"),
                        new File(winrar));
            } catch (MalformedURLException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Extensions.class.getName())
                        .log(Level.SEVERE, null, ex);
            }
        }
    }

    private void callURL(String passURL) {
        try {
            Desktop.getDesktop().browse(new URL(passURL).toURI());
        } catch (IOException | URISyntaxException e) {
            Logger.getLogger(Extensions.class.getName())
                    .log(Level.SEVERE, null, e);
        }
    }

    private void tempBtnDisable() {
        jTable1.setEnabled(false);
        jButton5.setEnabled(false);
        jButton1.setEnabled(false);
        jButton3.setEnabled(false);
        jButton7.setEnabled(false);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JFileChooser jFileChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
