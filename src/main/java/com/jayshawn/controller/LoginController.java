package com.jayshawn.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jayshawn.async.EventModel;
import com.jayshawn.async.EventProducer;
import com.jayshawn.async.EventType;
import com.jayshawn.service.UserService;
import com.jayshawn.util.JedisAdapter;
import com.jayshawn.util.RedisKeyUtil;
import com.jayshawn.util.WendaUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    UserService userService;
    
    @Autowired
    EventProducer eventProducer;
    
    @Autowired
    JedisAdapter jedisAdapter;

    @RequestMapping(path = {"/reg"})
    public String reg(Model model, @RequestParam("username") String username,
                      @RequestParam("password") String password,
                      @RequestParam("email") String email,
                      @RequestParam(value="next", required=false) String next,
                      @RequestParam(value="rememberme", defaultValue = "false") boolean rememberme,
                      HttpServletResponse response, HttpServletRequest request) {
        try {
            Map<String, Object> map = userService.register(username, password, email);
            if (map.containsKey("ticket")) {
                // 把ticket存入Cookie，并加入响应头部，返回给客户端
            	Cookie cookie = new Cookie("ticket", map.get("ticket").toString());
                cookie.setPath("/");
                if (rememberme) {
                    cookie.setMaxAge(3600*24*5);
                }
                response.addCookie(cookie);
                if (StringUtils.isNotBlank(next)) {
                    return "redirect:" + WendaUtil.getRelativePath(next, request);
                }
                return "redirect:/";
            } else {
                model.addAttribute("msg", map.get("msg"));
                return "register";
            }

        } catch (Exception e) {
            logger.error("注册异常" + e.getMessage());
            model.addAttribute("msg", "服务器错误");
            return "register";
        }
    }

    @RequestMapping(path = {"/reglogin"})
    public String regloginPage(Model model, @RequestParam(value = "next", required = false) String next) {
        model.addAttribute("next", next);
        return "login";
    }
    
    @RequestMapping(path = {"/register"})
    public String regPage(Model model, @RequestParam(value = "next", required = false) String next) {
        model.addAttribute("next", next);
        return "register";
    }    
   

    @RequestMapping(path = {"/login"})
    public String login(Model model, @RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam(value="next", required = false) String next,
                        @RequestParam(value="rememberme", defaultValue = "false") boolean rememberme,
                        HttpServletResponse response, HttpServletRequest request) {
        try {
            Map<String, Object> map = userService.login(username, password);
            if (map.containsKey("ticket")) {
            	// 把ticket存入Cookie，并加入响应头部，返回给客户端
            	Cookie cookie = new Cookie("ticket", map.get("ticket").toString());
                cookie.setPath("/");
                if (rememberme) {
                    cookie.setMaxAge(3600*24*5);
                }
                response.addCookie(cookie);
                
                if (StringUtils.isNotBlank(next)) {
                    return "redirect:" + WendaUtil.getRelativePath(next, request);
                }
                return "redirect:/";
            } else {
                model.addAttribute("msg", map.get("msg"));
                return "login";
            }

        } catch (Exception e) {
            logger.error("登陆异常" + e.getMessage());
            return "login";
        }
    }

    @RequestMapping(path = {"/logout"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String logout(@CookieValue("ticket") String ticket) {
        userService.logout(ticket);
        return "redirect:/";
    }

}