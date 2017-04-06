 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bbs.entity.Phone" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">

function checkNewComment() {
//	var msg = '${user.username}';
//	if (!msg) {
//		var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
//		if (returnVal) {
//			location.href = 'login.jsp';
//		}
//	} else {
		  window.location.hash = "#newComment"; 
//	}
}
</script>

<style type="text/css">
	.content img{
		width: 50%;
		height: 50%;
	}
</style>
</head>
<body>
		<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	
	<input type="button" value="回复" id="huifu" onclick="checkNewComment()">
	
	<div class="panel panel-default" style="width: 75%;margin: 0 auto;margin-top: 20px">
  <!-- Default panel contents -->
  <div class="panel-heading" style="background: #71AAE3"><p>标题：&nbsp;&nbsp;&nbsp;${topic.title }</p></div>
  <div class="panel-body" style="padding: 0 15px;margin: 0 -15px;">
	<div style="float: left;width: 20%;height:250px;background:#EFF4FB;">
	   <b>${topic.user.username }</b>
	</div>
	<div style="float: right;width: 80%;height:30px;background:#EFF4FB">
		<b style="float: left;">发表于：${topic.time }</b>
	</div>
	<div class="content" style="float: right;width: 80%;height:220px;ackground:#EFF4FB;">
		<b style="float: left;">${topic.content }</b>
	</div>
  </div>
</div>
	<c:forEach var="comment" items="${list }">
	<div class="panel panel-default" style="width: 75%;margin: 0 auto;margin-top: 3px">
  
  <div class="panel-body" style="padding: 0 15px;margin: 0 -15px;">

    	<div style="float: left;width: 20%;height:250px;background:#EFF4FB;">
	   <b>${comment.user.username }</b>
	</div>
	<div style="float: right;width: 80%;height:30px;background:#EFF4FB">
		<b style="float: left;">${comment.time }</b>
	</div>
	<div class="content" style="float: right;width: 80%;height:220px;ackground:#EFF4FB;">
		<b style="float: left;">${comment.content }</b>
	</div>
	</div>
  </div>

		</c:forEach>			
</div>
	<div Id="newComment">
	<jsp:include page="newComment.jsp"></jsp:include>
	</div>

</body>
</html>