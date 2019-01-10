package com.jayshawn.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayshawn.async.EventModel;
import com.jayshawn.async.EventProducer;
import com.jayshawn.async.EventType;
import com.jayshawn.dao.LoginTicketDAO;
import com.jayshawn.dao.UserDAO;
import com.jayshawn.model.LoginTicket;
import com.jayshawn.model.User;
import com.jayshawn.util.JedisAdapter;
import com.jayshawn.util.MailSender;
import com.jayshawn.util.RedisKeyUtil;
import com.jayshawn.util.WendaUtil;



@Service
public class UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LoginTicketDAO loginTicketDAO;
    
    @Autowired
    private JedisAdapter jedisAdapter;
    
    @Autowired
    EventProducer eventProducer;

    public Map<String, Object> register(String username, String password, String email) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StringUtils.isBlank(username)) {
            map.put("msg", "用户名不能为空");
            return map;
        }

        if (StringUtils.isBlank(password)) {
            map.put("msg", "密码不能为空");
            return map;
        }
        
        if (StringUtils.isBlank(email)||!MailSender.isMail(email)) {
            map.put("msg", "邮箱不合法");
            return map;
        }

        User user = userDAO.selectByName(username);

        if (user != null) {
            map.put("msg", "用户名已经被注册");
            return map;
        }

        // 密码强度
        user = new User();
        user.setName(username);
        user.setSalt(UUID.randomUUID().toString().substring(0, 5));
        String head = String.format("http://images.nowcoder.com/head/%dt.png", new Random().nextInt(1000));
        user.setHeadUrl(head);
        user.setPassword(WendaUtil.MD5(password+user.getSalt()));
        user.setEmail(email);
        userDAO.addUser(user);

        // 登陆，添加ticket
        String ticket = addLoginTicket(user.getId());
        map.put("ticket", ticket);
        return map;
    }


    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StringUtils.isBlank(username)) {
            map.put("msg", "用户名不能为空");
            return map;
        }

        if (StringUtils.isBlank(password)) {
            map.put("msg", "密码不能为空");
            return map;
        }

        User user = userDAO.selectByName(username);

        if (user == null) {
            map.put("msg", "用户名不存在");
            return map;
        }

        if (!WendaUtil.MD5(password+user.getSalt()).equals(user.getPassword())) {
            map.put("msg", "密码不正确");
            String key = RedisKeyUtil.getLoginExceptionKey(username);
            if(jedisAdapter.get(key)==null){
            	jedisAdapter.setex(key, 100, "1");
            }else{
            	jedisAdapter.incr(key);
            	if(Integer.valueOf(jedisAdapter.get(key))>=3){
            		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            		jedisAdapter.del(key);
            		eventProducer.fireEvent(new EventModel(EventType.LOGIN)
                            .setExt("username", username).setExt("to", userDAO.selectByName(username).getEmail()).setExt("date", dateFormat.format(new Date())));
            	map.put("msg", "错误次数太多，异常邮件已发送！");
            	}
            } 
            return map;
        }

        // 添加ticket
        String ticket = addLoginTicket(user.getId());
        map.put("ticket", ticket);
        map.put("userId", user.getId());
        return map;
    }

    private String addLoginTicket(int userId) {
        LoginTicket ticket = new LoginTicket();
        ticket.setUserId(userId);
        Date date = new Date();
        date.setTime(date.getTime() + 1000*3600*24);
        ticket.setExpired(date);
        ticket.setStatus(0);
        ticket.setTicket(UUID.randomUUID().toString().replaceAll("-", ""));
        loginTicketDAO.addTicket(ticket);
        return ticket.getTicket();
    }

    public User getUser(int id) {
        return userDAO.selectById(id);
    }

    public void logout(String ticket) {
        loginTicketDAO.updateStatus(ticket, 1);
    }
    
    public User selectByName(String name) {
        return userDAO.selectByName(name);
    }
}
