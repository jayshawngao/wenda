<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

	<%@include file="jsp/head.jsp" %>
<link rel="stylesheet" href="<%=path %>/styles/result.css">
<link rel="stylesheet" href="<%=path %>/styles/detail.css">
    <div id="main">
        <div class="zg-wrap zu-main clearfix ">
            <div class="zm-profile-section-wrap zm-profile-followee-page">
                <div class="zm-profile-section-head">
                    <span class="zm-profile-section-name">
                        <a href="#">${curUser.name}</a> 关注了 ${followeeCount} 人
                    </span>
                </div>
                <div class="zm-profile-section-list">
                    <div id="zh-profile-follows-list">
                        <div class="zh-general-list clearfix">
                            <c:forEach items="${followees }" var="vo">
                            <div class="zm-profile-card zm-profile-section-item zg-clear no-hovercard">
                                <c:choose>
                                <c:when test="${vo.get('followed')==true }">
                                <div class="zg-right">
                                    <button class="zg-btn zg-btn-unfollow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-status="1" data-id="${vo.get('user').id}">取消关注</button>
                                </div>
                                </c:when>
                                <c:otherwise>
                                <div class="zg-right">
                                    <button class="zg-btn zg-btn-follow zm-rich-follow-btn small nth-0
                                    js-follow-user" data-id="${vo.get('user').id}">关注</button>
                                </div>
                                </c:otherwise>
                                </c:choose>
                                <a title="Barty" class="zm-item-link-avatar" href="<%=path %>/user/${vo.get('user').id}">
                                    <img src="${vo.get('user').headUrl}" class="zm-item-img-avatar">
                                </a>
                                <div class="zm-list-content-medium">
                                    <h2 class="zm-list-content-title"><a data-tip="p$t$buaabarty" href="<%=path %>/user/${vo.get('user').id}" class="zg-link" title="Barty">${vo.get('user').name}</a></h2>

                                    <div class="details zg-gray">
                                        <a target="_blank" href="<%=path %>/user/${vo.get('user').id}/followers" class="zg-link-gray-normal">${vo.get("followerCount")}粉丝</a>
                                        /
                                        <a target="_blank" href="<%=path %>/user/${vo.get('user').id}/followees" class="zg-link-gray-normal">${vo.get("followeeCount")}关注</a>
                                        /
                                        <a target="_blank" href="#" class="zg-link-gray-normal">${vo.get("commentCount")} 回答</a>
                                        /
                                        <a target="_blank" href="#" class="zg-link-gray-normal">548 赞同</a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <a aria-role="button" class="zg-btn-white zu-button-more">更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
 	<%@include file="jsp/js.jsp" %>
	<script type="text/javascript" src="<%=path %>/scripts/main/site/follow.js"></script>
	<%@include file="jsp/tail.jsp" %> 
