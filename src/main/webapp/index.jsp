<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

	<%@include file="jsp/head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/styles/index.css">
	<link rel="stylesheet" href="<%=path %>/styles/detail.css">
    <div class="zu-global-notify" id="zh-global-message" style="display:none">
        <div class="zg-wrap">
            <div class="zu-global-nitify-inner">
            <a class="zu-global-notify-close" href="javascript:;" title="关闭" name="close">x</a>
            <span class="zu-global-notify-icon"></span>
            <span class="zu-global-notify-msg"></span>
            </div>
        </div>
    </div>
    <div class="zg-wrap zu-main clearfix " role="main">
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <div class="zg-section" id="zh-home-list-title">
                    <i class="zg-icon zg-icon-feedlist"></i>最新动态

                </div>
                <div class="zu-main-feed-con navigable" data-feedtype="topstory" id="zh-question-list">
                    <div id="js-home-feed-list" class="zh-general-list topstory clearfix">
                        <c:forEach items="${vos }" var="vo">
                        <div class="feed-item folding feed-item-hook feed-item-2
                        " feed-item-a="" data-type="a" id="feed-2" data-za-module="FeedItem" data-za-index="">
                            <meta itemprop="ZReactor" data-id="389034" data-meta="">
                            <div class="feed-item-inner">
                                <div class="avatar">
                                    <a title="${vo.get('user').name}" data-tip="p$t$amuro1230" class="zm-item-link-avatar" target="_blank" href="<%=path %>/user/${vo.get('user').id}">
                                        <img src="${vo.get('user').headUrl }" class="zm-item-img-avatar"></a>
                                </div>
                                <div class="feed-main">
                                    <div class="feed-content" data-za-module="AnswerItem">
                                        <meta itemprop="answer-id" content="389034">
                                        <meta itemprop="answer-url-token" content="13174385">
                                        <h2 class="feed-title">
                                            <a class="question_link" target="_blank" href="<%=path %>/question/${vo.get('question').id}">${vo.get("question").title }</a></h2>
                                        <div class="feed-question-detail-item">
                                            <div class="question-description-plain zm-editable-content"></div>
                                        </div>
                                        <div class="entry-body post-body js-collapse-body">
                                            <div class="zm-item-vote">
                                                <a class="zm-item-vote-count js-expand js-vote-count" href="javascript:;" data-bind-votecount="">${vo.get('followerCount')}</a></div>
                                            <div class="zm-item-answer-author-info">
                                                <a class="author-link" data-tip="p$b$amuro1230" target="_blank" href="<%=path %>/user/${vo.get('user').id}">${vo.get('user').name}</a>
                                                ，<fmt:formatDate value="${vo.get('question').createdDate }" pattern="yyyy年MM月dd日 HH:mm"/></div>

      
                                            <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="123114" data-action="<%=path %>/answer/content" data-author-name="李淼" data-entry-url="<%=path %>/question/19857995/answer/13174385">
                                                <div class="zh-summary summary clearfix">${vo.get('question').content}</div>
                                            </div>
                                        </div>
                                        <div class="feed-meta">
                                            <div class="zm-item-meta answer-actions clearfix js-contentActions">
                                                <div class="zm-meta-panel">
                                                    <a href="<%=path %>/question/${vo.get('question').id}" name="addcomment" class="meta-item toggle-comment js-toggleCommentBox">
                                                        <i class="z-icon-comment"></i>${vo.get('question').commentCount} 条评论</a>


                                                    <button class="meta-item item-collapse js-collapse">
                                                        <i class="z-icon-fold"></i>收起</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <a href="javascript:;" id="zh-load-more" class="zg-btn-white zg-r3px zu-button-more">更多</a>
            </div>
        </div>
    </div>
 
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 
