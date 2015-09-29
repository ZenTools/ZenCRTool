package com.beingjavaguys.sendMail;

import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;

import freemarker.template.TemplateException;

import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;

public class MailUtility {
	
	
	
	public static void sendEmail(String from,String to,String subject, String body) throws IOException, TemplateException
	   {      
			
	      // Recipient's email ID needs to be mentioned.
	      //String to = "abundela@cisco.com";

	      // Sender's email ID needs to be mentioned
	      //String from = "abundela@cisco.com";

	      // Assuming you are sending email from localhost
	      String host = "javamail.cisco.com";

	      // Get system properties
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);

	      // Get the default Session object.
	      Session session = Session.getDefaultInstance(properties);

	      try{
	    	
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);
	         MimeMessageHelper helper =new MimeMessageHelper(message, true);
	         // Set From: header field of the header.
	         helper.setFrom(new InternetAddress(from));
	       //  helper.setRecipients(Message.RecipientType.TO, recipientAddress);	
	         helper.setTo(new InternetAddress(to));
	         // Set Subject: header field
	         helper.setSubject(subject);
	     
	         
	         
	         
	         
	         
	
	         helper.setText("",body);

	         // Send message
	         Transport.send(message);
	         System.out.println("EMS notification test message");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }  
		 
	   }



}
