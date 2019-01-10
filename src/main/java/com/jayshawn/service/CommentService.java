package com.jayshawn.service;

import com.jayshawn.dao.CommentDAO;
import com.jayshawn.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentService {
    @Autowired
    private CommentDAO commentDAO;

    // 获取属于一个实体的所有评论
    public List<Comment> getCommentsByEntity(int entityId, int entityType) {
        return commentDAO.selectByEntity(entityId, entityType);
    }

    // 添加评论
    public int addComment(Comment comment) {
        return commentDAO.addComment(comment);
    }

    // 获取属于某个实体的评论数
    public int getCommentCount(int entityId, int entityType) {
        return commentDAO.getCommentCount(entityId, entityType);
    }

    // 删除一条评论
    public void deleteComment(int entityId, int entityType) {
        commentDAO.updateStatus(entityId, entityType, 1);
    }

	public Comment getCommentById(int commentId) {
		return commentDAO.getCommentById(commentId);
	}
	
    public int getUserCommentCount(int userId) {
        return commentDAO.getUserCommentCount(userId);
    }
}
