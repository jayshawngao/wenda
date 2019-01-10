package com.jayshawn.async.handler;

import com.jayshawn.async.EventHandler;
import com.jayshawn.async.EventModel;
import com.jayshawn.async.EventType;
import com.jayshawn.model.Message;
import com.jayshawn.model.User;
import com.jayshawn.service.MessageService;
import com.jayshawn.service.UserService;
import com.jayshawn.util.WendaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Date;
import java.util.List;


@Component
public class LikeHandler implements EventHandler {
    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

    
    @Override
    public void doHandle(EventModel model) {
        Message message = new Message();
        // 系统发送了一条消息
        message.setFromId(WendaUtil.SYSTEM_USERID);
        message.setToId(model.getEntityOwnerId());
        message.setCreatedDate(new Date());
        User user = userService.getUser(model.getActorId());
        message.setContent("用户" + user.getName()
                + "赞了你的评论,question/" + model.getExt("questionId"));
        // 把该条记录加入数据库，用户刷新时可以获取到
        messageService.addMessage(message);
    }

    @Override
    public List<EventType> getSupportEventTypes() {
        return Arrays.asList(EventType.LIKE);
    }


}
