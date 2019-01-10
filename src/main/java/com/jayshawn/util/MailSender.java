package com.jayshawn.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.jayshawn.async.EventModel;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
public class MailSender implements InitializingBean {
    private static final Logger logger = LoggerFactory.getLogger(MailSender.class);
    private JavaMailSenderImpl mailSender;
    private static String regex = "^[a-zA-Z0-9][a-zA-Z0-9_\\.]+[a-zA-Z0-9]@[a-z0-9]{2,7}(\\.[a-z]{2,3}){1,3}$";
    private static Pattern pattern = Pattern.compile(regex);
    
    public static boolean isMail(String s){
    	Matcher matcher = pattern.matcher(s);
    	return matcher.matches();
    }
    
    public boolean sendEmail(EventModel model) {
        try {
            SimpleMailMessage message=new SimpleMailMessage();  
            message.setFrom(model.getExt("from"));  
            message.setTo(model.getExt("to"));  
            message.setSubject(model.getExt("subject"));  
            String text = "您的账号 "+model.getExt("username")+" 在 "+model.getExt("date")+" 发生了异常登录！";
            message.setText(text);  
            mailSender.send(message);
            return true;
        } catch (Exception e) {
            logger.error("发送邮件失败" + e.getMessage());
            return false;
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        mailSender = new JavaMailSenderImpl();
        mailSender.setUsername("jayshawn@qq.com");
        mailSender.setPassword("gylsuhfoqgpabbeb");
        mailSender.setHost("smtp.qq.com");
        Properties javaMailProperties = new Properties();  
        javaMailProperties.put("mail.smtp.auth", true);   
        javaMailProperties.put("mail.smtp.starttls.enable", true);   
        javaMailProperties.put("mail.smtp.timeout", 5000);   
        mailSender.setJavaMailProperties(javaMailProperties);  
    }
}
