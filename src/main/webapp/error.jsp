<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>

	<%@include file="jsp/head.jsp" %>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

	<div class="w3layouts-bg">
		<h1 class="header-w3ls">Error Page</h1>
		<div class="agileits-content">
			<h2><span>4</span><span>0</span><span>4</span></h2>
			
		</div>
		<div class="w3layouts-right">
			<div class="w3ls-text">
				<h3>we're sorry!</h3>
				<h4 class="w3-agileits2">您所访问的页面不存在！</h4>
				<p><a href="<%=path%>">回到首页</a></p>
	
			</div>
				
		</div>
		<div class="clearfix"></div>
	</div>
	
 	<%@include file="jsp/js.jsp" %>
 	<script type="text/javascript" src="<%=path %>/scripts/main/site/detail.js"></script>
	<%@include file="jsp/tail.jsp" %> 