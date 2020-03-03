package fr.scabois.scabotheque.services;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class ApplicationMailer {
    @Resource
    private JavaMailSender javaMailSender;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private SimpleMailMessage preConfiguredMessage;

    public void sendAdherentMail(Criteria criteria) {

    }

    public void sendHTMLMail(String from, String to, String subject, String body) {
	try {
	    InternetAddress[] parsed;
	    try {
		parsed = InternetAddress.parse(to.replaceAll("(?:\\[|\\])?", ""));
	    } catch (AddressException e) {
		throw new IllegalArgumentException("Not valid email: " + to + "\nSource -> " + e.getMessage(), e);
	    }

	    MimeMessage mailMessage = javaMailSender.createMimeMessage();
	    mailMessage.setSubject(subject, "UTF-8");

	    MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true, "UTF-8");
	    helper.setFrom(from);
	    helper.setTo(parsed);
	    helper.setText(body, true);

	    javaMailSender.send(mailMessage);
	} catch (MessagingException ex) {
	    throw new RuntimeException(ex);
	}
    }

    /**
     * This method will send compose and send the message
     */
    public void sendMail(String from, String to, String subject, String body) {
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom(from);
	message.setTo(to);
	message.setSubject(subject);
	message.setText(body);
	mailSender.send(message);
    }

    /**
     * This method will send a pre-configured message
     */
    public void sendPreConfiguredMail(String message) {
	SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
	mailMessage.setText(message);
	mailSender.send(mailMessage);
    }
}