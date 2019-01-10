 package com.jayshawn.controller;

import com.jayshawn.async.EventModel;
import com.jayshawn.async.EventProducer;
import com.jayshawn.async.EventType;
import com.jayshawn.model.Comment;
import com.jayshawn.model.EntityType;
import com.jayshawn.model.HostHolder;
import com.jayshawn.model.ViewObject;
import com.jayshawn.service.CommentService;
import com.jayshawn.service.QuestionService;
import com.jayshawn.service.SensitiveService;
import com.jayshawn.service.UserService;
import com.jayshawn.util.WendaUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jayshawn on 2016/7/2.
 */
@Controller
public class CommentController {
    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @Autowired
    HostHolder hostHolder;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @Autowired
    QuestionService questionService;

    @Autowired
    SensitiveService sensitiveService;
    
    @Autowired
    EventProducer eventProducer;

    @RequestMapping(path = {"/addComment"}, method = {RequestMethod.POST})
    public String addComment(@RequestParam("questionId") int questionId,
                             @RequestParam("content") String content) {
        try {
        	// 过滤content
//        	content = new String(content.getBytes("8859_1"), "utf8");
            content = HtmlUtils.htmlEscape(content);
            content = sensitiveService.filter(content);
            Comment comment = new Comment();
            if (hostHolder.getUser() != null) {
                comment.setUserId(hostHolder.getUser().getId());
            } else {
                comment.setUserId(WendaUtil.ANONYMOUS_USERID);
            }
            comment.setContent(content);
            comment.setEntityId(questionId);
            comment.setEntityType(EntityType.ENTITY_QUESTION);
            comment.setCreatedDate(new Date());
            comment.setStatus(0);

            commentService.addComment(comment);
            // 更新题目里的评论数量
            int count = commentService.getCommentCount(comment.getEntityId(), comment.getEntityType());
            questionService.updateCommentCount(comment.getEntityId(), count);
            
            eventProducer.fireEvent(new EventModel(EventType.COMMENT)
                    .setActorId(hostHolder.getUser().getId()).setEntityId(questionId)
                    .setEntityType(EntityType.ENTITY_QUESTION).setEntityOwnerId(questionService.getById(questionId).getUserId()));            
            
        } catch (Exception e) {
            logger.error("增加评论失败" + e.getMessage());
        }
        return "redirect:/question/" + String.valueOf(questionId);
    }
}
