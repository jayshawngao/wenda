package com.jayshawn.dao;

import com.jayshawn.model.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


@Mapper
public interface MessageDAO {
    String TABLE_NAME = " message ";
    String INSERT_FIELDS = " from_id, to_id, content, has_read, conversation_id, created_date ";
    String SELECT_FIELDS = " id, " + INSERT_FIELDS;

    // 新增一条message
    @Insert({"insert into ", TABLE_NAME, "(", INSERT_FIELDS,
            ") values (#{fromId},#{toId},#{content},#{hasRead},#{conversationId},#{createdDate})"})
    int addMessage(Message message);

    // 和某人的对话信息 ，按时间降序
    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where conversation_id=#{conversationId} order by created_date desc limit #{offset}, #{limit}"})
    List<Message> getConversationDetail(@Param("conversationId") String conversationId,
                                        @Param("offset") int offset, @Param("limit") int limit);
    
    @Select({"select count(id) from ",TABLE_NAME," where conversation_id=#{conversationId}"})
    int getConversationCount(@Param("conversationId") String conversationId);

    // 某个用户发给userId的未读的消息数
    @Select({"select count(id) from ", TABLE_NAME, " where has_read=0 and to_id=#{userId} and conversation_id=#{conversationId}"})
    int getConvesationUnreadCount(@Param("userId") int userId, @Param("conversationId") String conversationId);

    // 属于userId的，所有消息的列表
    @Select({"SELECT * FROM message WHERE created_date IN( SELECT MAX(created_date) FROM message WHERE from_id=#{userId} OR to_id=#{userId} GROUP BY conversation_id ) ORDER BY created_date DESC limit #{offset},#{limit}  "})
    List<Message> getConversationList(@Param("userId") int userId,
                                      @Param("offset") int offset, @Param("limit") int limit);
    
    @Update({"update", TABLE_NAME, "set has_read=1 where to_id=#{userId} and conversation_id=#{conversationId}"})
    int updateConvesationUnreadCount(@Param("userId") int userId, @Param("conversationId") String conversationId);
}
