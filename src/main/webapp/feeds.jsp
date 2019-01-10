<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

	<%@include file="jsp/head.jsp" %>

<link rel="stylesheet" href="<%=path %>/styles/index.css">
<link rel="stylesheet" href="<%=path %>/styles/detail.css">
    <div class="zg-wrap zu-main clearfix " role="main">
        <div class="zu-main-content">
            <div class="zu-main-content-inner">
                <div class="zg-section" id="zh-home-list-title">
                    <i class="zg-icon zg-icon-feedlist"></i>新鲜事
                    <input type="hidden" id="is-topstory">
                </div>
                <div class="zu-main-feed-con navigable" data-feedtype="topstory" id="zh-question-list" data-widget="navigable" data-navigable-options="{&quot;items&quot;:&quot;&gt; .zh-general-list .feed-content&quot;,&quot;offsetTop&quot;:-82}">
                    <a href="javascript:;" class="zu-main-feed-fresh-button" id="zh-main-feed-fresh-button" style="display:none"></a>
                    <div id="js-home-feed-list" class="zh-general-list topstory clearfix" data-init="{&quot;params&quot;: {}, &quot;nodename&quot;: &quot;TopStory2FeedList&quot;}" data-delayed="true" data-za-module="TopStoryFeedList">

                        <c:forEach items="${feeds }" var="vo">
									<div class="feed-item folding feed-item-hook feed-item-2
									                        " feed-item-a="" data-type="a" id="feed-2" data-za-module="FeedItem" data-za-index="">
									    <meta itemprop="ZReactor" data-id="389034" data-meta="{&quot;source_type&quot;: &quot;promotion_answer&quot;, &quot;voteups&quot;: 4168, &quot;comments&quot;: 69, &quot;source&quot;: []}">
									    <div class="feed-item-inner">
									        <div class="avatar">
									            <a title="${vo.get('userName')}" data-tip="p$t$amuro1230" class="zm-item-link-avatar" target="_blank" href="/user/${vo.userId}">
									                <img src="${vo.get('userHead')}" class="zm-item-img-avatar"></a>
									        </div>
									        <div class="feed-main">
									            <div class="feed-content" data-za-module="AnswerItem">
									                <meta itemprop="answer-id" content="389034">
									                <meta itemprop="answer-url-token" content="13174385">
									                <div class="expandable entry-body">
									                    <div class="zm-item-answer-author-info">
									                        <a class="author-link" data-tip="p$b$amuro1230" target="_blank" href="<%=path %>/user/${vo.userId}">${vo.get('userName')}</a>
									            <c:choose>
									            <c:when test="${vo.type==1 }">            
									                        评论
						                        </c:when>
									            <c:when test="${vo.type==4 }">            
							            		关注	
						                        </c:when>
									            <c:when test="${vo.type==6 }">            
									                        发表
						                        </c:when>						                        						                        
						                        </c:choose>
									                        
									                        了该问题 ，<fmt:formatDate value="${vo.createdDate }" pattern="yyyy年MM月dd日 HH:mm"/></div>
									                    <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="123114" data-action="/answer/content" data-author-name="李淼" data-entry-url="/question/19857995/answer/13174385">
									                        <a href="<%=path %>/question/${vo.get('questionId')}"><div class="zh-summary summary clearfix">${vo.get('questionTitle')}</div></a>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
									</div>                        			
                        </c:forEach>
                        
                    </div>
                    <a href="javascript:;" id="zh-load-more" data-method="next" class="zg-btn-white zg-r3px zu-button-more" style="">更多</a></div>
            </div>
        </div>
    </div>
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 