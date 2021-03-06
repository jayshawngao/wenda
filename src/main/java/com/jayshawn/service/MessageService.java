package com.jayshawn.service;

import com.jayshawn.dao.MessageDAO;
import com.jayshawn.model.Message;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MessageService {
    @Autowired
    MessageDAO messageDAO;

    @Autowired
    SensitiveService sensitiveService;

    public int addMessage(Message message) {
        message.setContent(sensitiveService.filter(message.getContent()));
        return messageDAO.addMessage(message);
    }

    public List<Message> getConversationDetail(String conversationId, int offset, int limit) {
        return messageDAO.getConversationDetail(conversationId, offset, limit);
    }

    public List<Message> getConversationList(int userId, int offset, int limit) {
        return messageDAO.getConversationList(userId, offset, limit);
    }

    public int getConvesationUnreadCount(int userId, String conversationId) {
        return messageDAO.getConvesationUnreadCount(userId, conversationId);
    }
    
    public int updateConvesationUnreadCount(@Param("userId") int userId, @Param("conversationId") String conversationId){
    	return messageDAO.updateConvesationUnreadCount(userId, conversationId);
    }

	public int getConversationCount(String conversationId) {
		return messageDAO.getConversationCount(conversationId);
	}
}
