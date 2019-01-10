<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="jsp/head.jsp" %>
<link rel="stylesheet" media="all" href="<%=path %>/styles/letter.css">
<div id="main">
    <div class="zg-wrap zu-main clearfix ">
        <ul class="letter-chatlist">
             <c:forEach items="${messages}" var="message" >
            <li id="msg-item-4009580">
                <a class="list-head" href="<%=path %>/user/${message.get('userId')}">
                    <img alt="头像" src="${message.get('headUrl')}">
                </a>
                <div class="tooltip fade right in">
                    <div class="tooltip-arrow"></div>
                    <div class="tooltip-inner letter-chat clearfix">
                        <div class="letter-info">
                            <p class="letter-time"><fmt:formatDate value="${message.get('message').createdDate }" pattern="yyyy年MM月dd日 HH:mm"/></p>
                        </div>
                        <p class="chat-content">
                            ${message.get("message").content }
                        </p>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>

    </div>
</div>
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 