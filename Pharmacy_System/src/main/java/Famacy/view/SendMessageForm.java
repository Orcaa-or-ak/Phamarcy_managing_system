/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Famacy.view;

import Famacy.model.Employee;
import Famacy.model.Message;
import Famacy.repository.AccountRepository;
import Famacy.repository.EmployeeRepository;
import Famacy.repository.MessageRepository;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Cruis
 */
public class SendMessageForm extends javax.swing.JFrame {

    private static String username;
    JTextArea messageTextArea;

    private EmployeeRepository employeeRepository;
    private MessageRepository messageRepository;

    private List<JCheckBox> userCheckBoxes;

    public SendMessageForm(String username) {
        this.username = username;
        employeeRepository = new EmployeeRepository();
        messageRepository = new MessageRepository();        
        
        initComponents();
        
        loadEmployeeList();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        sendMessageLabel = new javax.swing.JLabel();
        checkboxScrollPane = new javax.swing.JScrollPane();
        selectAllButton = new javax.swing.JButton();
        nextButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        sendMessageLabel.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        sendMessageLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sendMessageLabel.setText("Send Message");

        checkboxScrollPane.setBorder(javax.swing.BorderFactory.createTitledBorder("Select User"));

        selectAllButton.setText("All");
        selectAllButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                selectAllButtonActionPerformed(evt);
            }
        });

        nextButton.setText("Next");
        nextButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nextButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(sendMessageLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(checkboxScrollPane)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(271, Short.MAX_VALUE)
                .addComponent(selectAllButton, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(2, 2, 2)
                .addComponent(nextButton, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(sendMessageLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(checkboxScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(selectAllButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(nextButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void nextButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nextButtonActionPerformed
        // TODO add your handling code here:
        proceedToMessage();
    }//GEN-LAST:event_nextButtonActionPerformed

    private void selectAllButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_selectAllButtonActionPerformed
        // TODO add your handling code here:
        selectAllUsers();
    }//GEN-LAST:event_selectAllButtonActionPerformed

    private void loadEmployeeList() {
        List<Employee> employees = employeeRepository.findAll();
        userCheckBoxes = new ArrayList<>();
        JPanel checkBoxPanel = new JPanel();
        checkBoxPanel.setLayout(new BoxLayout(checkBoxPanel, BoxLayout.Y_AXIS));
        for (Employee employee : employees) {
            JCheckBox checkBox = new JCheckBox(employee.getName());
            userCheckBoxes.add(checkBox);
            checkBoxPanel.add(checkBox);
        }
        checkboxScrollPane.setViewportView(checkBoxPanel);
    }

    private void selectAllUsers() {
        for (JCheckBox checkBox : userCheckBoxes) {
            checkBox.setSelected(true);
        }
    }    
    
    private void proceedToMessage() {
        List<String> selectedUsers = new ArrayList<>();
        for (JCheckBox checkBox : userCheckBoxes) {
            if (checkBox.isSelected()) {
                selectedUsers.add(checkBox.getText());
            }
        }

        if (selectedUsers.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please select at least one user.");
            return;
        }

        // Add the message input panel and send button
        JPanel messagePanel = new JPanel(new BorderLayout());
        messageTextArea = new JTextArea();
        messageTextArea.setBorder(BorderFactory.createTitledBorder("Message"));
        messagePanel.add(new JScrollPane(messageTextArea), BorderLayout.CENTER);

        JPanel sendPanel = new JPanel(new BorderLayout());
        JButton sendButton = new JButton("Send Message");
        sendPanel.add(sendButton, BorderLayout.EAST);

        getContentPane().removeAll();
        getContentPane().setLayout(new BorderLayout());
        getContentPane().add(messagePanel, BorderLayout.CENTER);
        getContentPane().add(sendPanel, BorderLayout.SOUTH);

        sendButton.addActionListener(e -> sendMessage(selectedUsers));

        // Refresh the frame
        revalidate();
        repaint();
    }
    
    private void sendMessage(List<String> selectedUsers) {
        String messageContent = messageTextArea.getText();

        for (String user : selectedUsers) {
            Integer receiverId = employeeRepository.findEmployeeIdByName(user);
            Integer senderId = AccountRepository.findEmployeeIdByUsername(username);

            if (receiverId != null && senderId != null) {
                Message message = new Message();
                message.setSenderID(senderId);
                message.setReceiverID(receiverId);
                message.setContent(messageContent);

                // Debugging information to verify message before saving
                System.out.println("Sending message from ID " + senderId + " to ID " + receiverId + " with content: "
                        + messageContent);

                messageRepository.saveMessage(message);

                // Debugging information to verify message was saved
                System.out.println("Message saved for user: " + user);
            } else {
                // Debugging information for potential issues with IDs
                System.out.println("Failed to find sender or receiver ID for user: " + user);
            }
        }

        JOptionPane.showMessageDialog(this, "Message sent to selected users.");
        dispose();
        MessageForm messageForm = new MessageForm(username);
        messageForm.setVisible(true);
    }
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(SendMessageForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(SendMessageForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(SendMessageForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(SendMessageForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new SendMessageForm("user1").setVisible(true);
//            }
//        });
//    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane checkboxScrollPane;
    private javax.swing.JButton nextButton;
    private javax.swing.JButton selectAllButton;
    private javax.swing.JLabel sendMessageLabel;
    // End of variables declaration//GEN-END:variables
}
