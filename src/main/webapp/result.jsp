<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<!-- saved from url=(0029)#signin -->
<html lang="zh-CN" dropeffect="none" class="js is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile" style="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" async="" src="<%=path %>/scripts/za-0.1.1.min.js"></script>
    <script async="" src="<%=path %>/scripts/ga.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-ZA-Response-Id" content="46acde5c53db46f2806ccad726de9826">
    <title>问答社区</title>
    <meta name="apple-itunes-app" content="app-id=432274380">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="mobile-agent" content="format=html5;url=<%=path %>/">
    <meta id="znonce" name="znonce" content="d3edc464cf014708819feffde7ddd01e">
    <link rel="search" type="application/opensearchdescription+xml" href="https://nowcoder.com/static/search.xml" title="问答社区">
    <link rel="stylesheet" href="<%=path %>/styles/index.css">
    <style>
    .zm-item-answer-author-info a.collapse {margin-top: 0}
    </style>

</head>
<body class="page-search ">
    <div role="navigation" class="zu-top">
        <div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
            <a href="<%=path %>/" class="zu-top-link-logo" id="zh-top-link-logo" data-za-c="view_home" data-za-a="visit_home" data-za-l="top_navigation_zhihu_logo">问答社区</a>
            <div class="top-nav-profile">
                
                <c:choose>
                <c:when test="${user==null }">
	           <ul class="topnav-noauth clearfix">
	               <li>
	                   <a href="<%=path %>/reglogin">注册/登录</a>
	               </li>
	           </ul>
                </c:when>
                <c:otherwise>
                <a href="https://nowcoder.com/people/hu-yuan-24-48" class="zu-top-nav-userinfo " id=":0" role="button" aria-haspopup="true" aria-activedescendant="">
                    <span class="name">${user.name }</span>
                    <img class="Avatar" src="${user.headUrl }" srcset="https://pic1.zhimg.com/da8e974dc_xs.jpg 2x" alt="${user.name }">
                    <span id="zh-top-nav-new-pm" class="zg-noti-number zu-top-nav-pm-count" style="visibility:hidden" data-count="0">
                    </span>
                </a>
                <ul class="top-nav-dropdown" id="top-nav-profile-dropdown" aria-labelledby=":0">
                    <li>
                    <a href="<%=path %>/user/${user.id}" tabindex="-1" id=":1">
                    <i class="zg-icon zg-icon-dd-home"></i>我的主页
                    </a>
                    </li>
                    <li>
                    <a href="<%=path %>/msg/list" tabindex="-1" id=":2">
                    <i class="zg-icon zg-icon-dd-pm"></i>私信
                    <span id="zh-top-nav-pm-count" class="zu-top-nav-pm-count zg-noti-number" style="visibility:hidden" data-count="0">
                    </span>
                    </a>
                    </li>
                    <li>
                    <a href="<%=path %>/logout" tabindex="-1" id=":4">
                    <i class="zg-icon zg-icon-dd-logout"></i>退出
                    </a>
                    </li>
                </ul>
                </c:otherwise>
                </c:choose>
            </div>
            
            <c:if test="${user!=null }">
            <button class="zu-top-add-question" id="zu-top-add-question">提问</button>
            </c:if>
        <div role="search" id="zh-top-search" class="zu-top-search">
            <form method="GET" action="<%=path %>/search" id="zh-top-search-form" class="zu-top-search-form">
                <label for="q" class="hide-text">搜索</label>
                <input type="text" class="zu-top-search-input" id="q" name="q"  value="${keyword}" placeholder="搜索你感兴趣的内容..." role="combobox" aria-autocomplete="list">
                <button type="submit" class="zu-top-search-button"><span class="hide-text">搜索</span><span class="sprite-global-icon-magnifier-dark"></span></button>
            </form>
        </div>
            <div id="zg-top-nav" class="zu-top-nav">
                <ul class="zu-top-nav-ul zg-clear">
                    <li class="zu-top-nav-li current" id="zh-top-nav-home">
                    <a class="zu-top-nav-link" href="<%=path %>/" id="zh-top-link-home" data-za-c="view_home" data-za-a="visit_home" data-za-l="top_navigation_home">首页</a>
                    </li>
                    <li class="zu-top-nav-li " id="zh-top-nav-explore">
                    <a class="zu-top-nav-link" href="<%=path %>/pushfeeds">新鲜事</a>
                    </li>                    
                    <c:if test="${user!=null }">
                    <li class="top-nav-noti zu-top-nav-li ">
                    <a class="zu-top-nav-link" href="javascript:;" id="zh-top-nav-count-wrap" role="button"><span class="mobi-arrow"></span>发私信<span id="zh-top-nav-count" class="zu-top-nav-count zg-noti-number" style="display: none;">0</span></a>
                    </li>
                    </c:if>
                </ul>
                <div class="zu-top-nav-live zu-noti7-popup zg-r5px no-hovercard" id="zh-top-nav-live-new" role="popup" tabindex="0">
                    <div class="zu-top-nav-live-inner zg-r5px">
                        <div class="zu-top-live-icon">&nbsp;</div>
                        <div class="zu-home-noti-inner" id="zh-top-nav-live-new-inner">
                            <div class="zm-noti7-popup-tab-container clearfix" tabindex="0" role="tablist">
                            <button class="zm-noti7-popup-tab-item message" role="tab">
                            <span class="icon">消息</span>
                            </button>
                            <button class="zm-noti7-popup-tab-item user" role="tab">
                            <span class="icon">用户</span>
                            </button>
                            <button class="zm-noti7-popup-tab-item thanks" role="tab">
                            <span class="icon">赞同和感谢</span>
                            </button>
                            </div>
                        </div>
                        <div class="zm-noti7-frame-border top"></div>
                        <div class="zm-noti7-frame">
                            <div class="zm-noti7-content message zh-scroller" style="position: relative; overflow: hidden;">
                                <div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;"><div class="zh-scroller-content" style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                                <div class="zm-noti7-content-inner">
                                <div class="zm-noti7-content-body">
                                <div class="zm-noti7-popup-loading">
                                <span class="noti-spinner-loading"></span>
                                </div>
                                </div>
                                </div>
                                </div></div>
                                <div class="zh-scroller-bar-container" style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);"><div style="-webkit-user-select: none;"></div></div><div class="zh-scroller-bar" style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
                            </div>
                            <div class="zm-noti7-content user zh-scroller" style="display: none; position: relative; overflow: hidden;"><div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;"><div class="zh-scroller-content" style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                            <div class="zm-noti7-content-inner">
                            <div class="zm-noti7-content-body">
                            <div class="zm-noti7-popup-loading">
                            <span class="noti-spinner-loading"></span>
                            </div>
                            </div>
                            </div>
                            </div></div><div class="zh-scroller-bar-container" style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);"><div style="-webkit-user-select: none;"></div></div><div class="zh-scroller-bar" style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div></div>
                            <div class="zm-noti7-content thanks zh-scroller" style="display: none; position: relative; overflow: hidden;"><div class="zh-scroller-inner" style="height: 100%; width: 150%; overflow: auto;"><div class="zh-scroller-content" style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
                            <div class="zm-noti7-content-inner">
                            <div class="zm-noti7-content-body">
                            <div class="zm-noti7-popup-loading">
                            <span class="noti-spinner-loading"></span>
                            </div>
                            </div>
                            </div>
                            </div></div><div class="zh-scroller-bar-container" style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);"><div style="-webkit-user-select: none;"></div></div><div class="zh-scroller-bar" style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div></div>
                        </div>
                        <div class="zm-noti7-frame-border bottom"></div>
                        <div class="zm-noti7-popup-footer">
                            <a href="https://nowcoder.com/notifications" class="zm-noti7-popup-footer-all zg-right">查看全部 »</a>
                            <a href="https://nowcoder.com/settings/notification" class="zm-noti7-popup-footer-set" title="通知设置"><i class="zg-icon zg-icon-settings"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<link rel="stylesheet" href="<%=path %>/styles/result.css">
<link rel="stylesheet" href="<%=path %>/styles/detail.css">
<div class="zg-wrap zu-main clearfix" role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">
            <ul class="list contents navigable">
                <br/>
                <c:forEach items="${vos }" var="vo">
                <li class="item clearfix">
                    <div class="title">
                        <a target="_blank" href="<%=path %>/question/${vo.get('question').id}" class="js-title-link">${vo.get("question").title}</a>
                    </div>
                    <div class="content">

                        <ul class="answers">
                            <li class="answer-item clearfix">
                                <div class="entry answer">
                                    <div class="entry-left hidden-phone">
                                        <a class="zm-item-vote-count hidden-expanded js-expand js-vote-count" data-bind-votecount="">${vo.get("followCount")}</a>
                                    </div>
                                    <div class="entry-body">
                                        <div class="entry-meta">
                                            <strong class="author-line"><a class="author" href="<%=path %>/user/${vo.get('user').id}">${vo.get("user").name}</a>，<fmt:formatDate value="${vo.get('question').createdDate }" pattern="yyyy年MM月dd日 HH:mm"/></strong>
                                        </div>
                                        <div class="entry-content js-collapse-body">
                                            <div class="summary hidden-expanded" style="">
                                            ${vo.get("question").content}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 