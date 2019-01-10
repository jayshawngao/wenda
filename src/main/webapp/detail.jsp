<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="jsp/head.jsp" %>
<link rel="stylesheet" href="<%=path %>/styles/detail.css">
<div class="zg-wrap zu-main clearfix with-indention-votebar" itemscope="" itemtype="http://schema.org/Question"
     id="zh-single-question-page" data-urltoken="36301524" role="main">
    <div class="zu-main-content">
        <div class="zu-main-content-inner">
            <meta itemprop="isTopQuestion" content="false">
            <meta itemprop="visitsCount" content="402">
            <!--
            <div class="zm-tag-editor zg-section">
                <div class="zm-tag-editor-labels zg-clear">
                    <a data-tip="t$b$19550730" class="zm-item-tag" href="">新浪微博</a>
                    <a data-tip="t$b$19554412" class="zm-item-tag" href="">网络营销</a>
                    <a data-tip="t$b$19559739" class="zm-item-tag" href="">微博粉丝</a>
                    <a data-tip="t$b$19560290" class="zm-item-tag" href="">僵尸粉</a>
                    <a data-tip="t$b$19565757" class="zm-item-tag" href="">网络水军</a>
                    <a href="javascript:;" class="zu-edit-button" name="edit">
                        <i class="zu-edit-button-icon"></i>修改</a>
                </div>
            </div>
            -->
            <div id="zh-question-title" data-editable="true" class="zm-editable-status-normal">
                <h2 class="zm-item-title">

                    <span class="zm-editable-content">${question.title}</span>

                </h2>
            </div>
            <div id="zh-question-detail" class="zm-item-rich-text zm-editable-status-normal">
                <div class="zm-editable-content">${question.content}</div>
            </div>
            <div class="zm-side-section">
                <div class="zm-side-section-inner" id="zh-question-side-header-wrap">
                    <c:choose>
                    <c:when test="${followed==true }">
                    <button class="follow-button zg-follow zg-btn-white js-follow-question" data-id="${question.id}"
                            data-status="1">
                        取消关注
                    </button>
                    </c:when>
                    <c:otherwise>
                    <button class="follow-button zg-follow zg-btn-green js-follow-question" data-id="${question.id}">
                        关注问题
                    </button>
                    </c:otherwise>
                    </c:choose>
                    <div class="zh-question-followers-sidebar">
                        <div class="zg-gray-normal">
                            <a href="javascript:void(0);"><strong class="js-user-count">${followUsers.size()}</strong></a>人关注该问题
                        </div>
                        <div class="list zu-small-avatar-list zg-clear js-user-list">
                            <c:forEach items="${followUsers }" var="vo">
                            <a class="zm-item-link-avatar js-user-${vo.get('id')}" href="<%=path %>/user/${vo.get('id')}"
                               data-original_title="${vo.get('name')}">
                                <img src="${vo.get('headUrl')}"
                                     class="zm-item-img-avatar"></a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div id="zh-question-answer-wrap" data-pagesize="10" class="zh-question-answer-wrapper navigable"
                 data-widget="navigable" data-navigable-options="{&quot;items&quot;: &quot;&gt;.zm-item-answer&quot;}"
                 data-init="{&quot;params&quot;: {&quot;url_token&quot;: 36301524, &quot;pagesize&quot;: 10, &quot;offset&quot;: 0}, &quot;nodename&quot;: &quot;QuestionAnswerListV2&quot;}">

                <c:forEach items="${comments}" var="comment">
                <div class="zm-item-answer  zm-item-expanded js-comment">
                    <link itemprop="url" href="">
                    <meta itemprop="answer-id" content="22162611">
                    <meta itemprop="answer-url-token" content="66862039">
                    <a class="zg-anchor-hidden" name="answer-22162611"></a>

                    <div class="zm-votebar goog-scrollfloater js-vote" data-id="${comment.get('comment').id}">
                        <c:choose>
                        <c:when test="${comment.get('liked')>0 }">
                        <button class="up js-like pressed" title="赞同">
                        </c:when>
                        <c:otherwise>
                        <button class="up js-like" title="赞同">
                        </c:otherwise>
                        </c:choose>
                            <i class="icon vote-arrow"></i>
                            <span class="count js-voteCount">${comment.get("likeCount")}</span>
                            <span class="label sr-only">赞同</span>
                        </button>

                        <c:choose>
                        <c:when test="${comment.get('liked')<0 }">
                        <button class="down js-dislike pressed" title="反对，不会显示你的姓名">
                        </c:when>
                        <c:otherwise>
                        <button class="down js-dislike" title="反对，不会显示你的姓名">
                        </c:otherwise>
                        </c:choose>
                            <i class="icon vote-arrow"></i>
                            <span class="label sr-only">反对，不会显示你的姓名</span>
                        </button>
                    </div>
                    <div class="answer-head">
                        <div class="zm-item-answer-author-info">
                            <a class="zm-item-link-avatar avatar-link" href="<%=path %>/user/${comment.get('user').id}" target="_blank" data-tip="p$t$yingxiaodao">
                                <img src="${comment.get('user').headUrl}" class="zm-list-avatar avatar"></a>
                            <a class="author-link" data-tip="p$t$yingxiaodao" target="_blank" href="<%=path %>/user/${comment.get('user').id}">${comment.get("user").name}</a>
                        </div>
                        <div class="zm-item-vote-info">
                                <span class="voters text">
                                    <a href="" class="more text"><span class="js-voteCount">${comment.get("likeCount") }</span>&nbsp;人赞同</a>
                                </span>
                        </div>
                    </div>
                    <div class="zm-item-rich-text expandable js-collapse-body" data-resourceid="6727688" data-action="/answer/content" data-author-name="营销岛" data-entry-url="/question/36301524/answer/66862039">

                        <div class="zm-editable-content clearfix">
                            ${comment.get("comment").content }
                        </div>
                    </div>
                    <a class="zg-anchor-hidden ac" name="22162611-comment"></a>
                    <div class="zm-item-meta answer-actions clearfix js-contentActions">
                        <div class="zm-meta-panel">
                            <a itemprop="url" class="answer-date-link meta-item" target="_blank" href="">发布于 <fmt:formatDate value="${comment.get('comment').createdDate }" pattern="yyyy年MM月dd日 HH:mm:ss"/></a>

                            <button class="item-collapse js-collapse" style="transition: none;">
                                <i class="z-icon-fold"></i>收起</button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <a name="draft"></a>

            <form action="<%=path %>/addComment" method="post">
                <input type="hidden" name="questionId" value="${question.id}"/>
            <div id="zh-question-answer-form-wrap" class="zh-question-answer-form-wrap">
                <div class="zm-editable-editor-wrap" style="">
                    <div class="zm-editable-editor-outer">
                        <div class="zm-editable-editor-field-wrap">
                            <textarea name="content" id="content" class="zm-editable-editor-field-element editable" style="width:100%;"></textarea>
                        </div>
                    </div>

                    <div class="zm-command clearfix">
                            <span class=" zg-right">
                                <button type="submit" class="submit-button zg-btn-blue">发布回答</button></span>
                    </div>
                </div>
            </div>
            </form>

        </div>
    </div>
</div>
<%@include file="jsp/js.jsp" %>
<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
<%@include file="jsp/tail.jsp" %>