package com.jayshawn.controller;


import com.jayshawn.model.EntityType;
import com.jayshawn.model.HostHolder;
import com.jayshawn.model.Question;
import com.jayshawn.model.User;
import com.jayshawn.model.ViewObject;
import com.jayshawn.service.CommentService;
import com.jayshawn.service.FollowService;
import com.jayshawn.service.QuestionService;
import com.jayshawn.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    QuestionService questionService;

    @Autowired
    UserService userService;
    
    @Autowired
    CommentService commentService;
    
    @Autowired
    FollowService followService;
    
    @Autowired
    HostHolder hostHolder;

    private List<ViewObject> getQuestions(int userId, int offset, int limit) {
        List<Question> questionList = questionService.getLatestQuestions(userId, offset, limit);
        List<ViewObject> vos = new ArrayList<>();
        for (Question question : questionList) {
            ViewObject vo = new ViewObject();
            vo.set("question", question);
            vo.set("user", userService.getUser(question.getUserId()));
            vo.set("followerCount", followService.getFollowerCount(EntityType.ENTITY_QUESTION, question.getId()));
            vos.add(vo);
        }
        return vos;
    }

    @RequestMapping(path = {"/","index"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String index(Model model,
                        @RequestParam(value = "pop", defaultValue = "0") int pop) {
    	model.addAttribute("vos", getQuestions(0, 0, 10));
        return "index";
    }
    

    
    

    @RequestMapping(path = {"/user/{userId}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String userIndex(Model model, @PathVariable("userId") int userId) {
        model.addAttribute("vos", getQuestions(userId, 0, 10));

        User user = userService.getUser(userId);
        ViewObject vo = new ViewObject();
        vo.set("user", user);
        vo.set("commentCount", commentService.getUserCommentCount(userId));
        vo.set("followerCount", followService.getFollowerCount(EntityType.ENTITY_USER, userId));
        vo.set("followeeCount", followService.getFolloweeCount(userId, EntityType.ENTITY_USER));
        if (hostHolder.getUser() != null) {
            vo.set("followed", followService.isFollower(hostHolder.getUser().getId(), EntityType.ENTITY_USER, userId));
        } else {
            vo.set("followed", false);
        }
        model.addAttribute("profileUser", vo);
        return "profile";
    }
    
    @RequestMapping(path={"/data"})
    @ResponseBody
    public String sessionId(HttpServletRequest request, @RequestParam("element")String element){
    	String jSessionId = request.getSession().getId();
    	File file = new File("d:\\workspace\\userdata\\wenda\\"+jSessionId);
    	if(!file.exists()){
    		try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	try {
			Writer writer = new BufferedWriter(new FileWriter(file,true));
			writer.append(element+"\n");
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	return "success";
    	
    	
    }
}
