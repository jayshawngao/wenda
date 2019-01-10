<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="jsp/head.jsp" %>
<link rel="stylesheet" media="all" href="<%=path %>/styles/letter.css">
    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <ul class="letter-list">
                <c:forEach items="${conversations }" var="conversation" >
                <li id="conversation-item-10005_622873">
                    <a class="letter-link" href="<%=path %>/msg/detail?conversationId=${conversation.get('message').conversationId }"></a>
                    <div class="letter-info">
                        <span class="l-time"><fmt:formatDate value="${conversation.get('message').createdDate }" pattern="yyyy年MM月dd日 HH:mm"/></span>
                        <div class="l-operate-bar">
                            <a href="<%=path %>/msg/detail?conversationId=${conversation.get('message').conversationId }">
                                共${conversation.get("conversationCount") }条会话
                            </a>
                        </div>
                    </div>
                    <div class="chat-headbox">
                    	<c:if test="${conversation.get('unread')!=0 }">
                        <span class="msg-num">
                            ${conversation.get("unread") }
                        </span>
                        </c:if>
                        <a class="list-head" href="<%=path %>/user/${conversation.get('user').id}">
                            <img alt="头像" src="${conversation.get('user').headUrl}">
                        </a>
                    </div>
                    <div class="letter-detail">
                        <a title="通知" class="letter-name level-color-1" href="<%=path %>/user/${conversation.get('user').id}">
                            ${conversation.get("user").name }
                        </a>
                        <p class="letter-brief">
                            ${conversation.get("message").content }
                        </p>
                    </div>
                </li>
                </c:forEach>
                </ul>

        </div>
    </div>
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 