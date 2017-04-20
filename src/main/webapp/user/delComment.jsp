<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<body>

<div class="panel panel-default" style="margin: 0 auto;">
  <!-- Default panel contents -->  
  <div class="panel-heading" style="overflow: hidden;text-align:center;">
  		<p style="width: 30%;float: left;text-align: center;">回复内容</p> 
		<p style="width: 35%;float: left;text-align: center;">回复时间</p>
		<p style="width: 10%;float: left;text-align: center;">回复主题</p>
		<p style="width: 25%;float: left;text-align: center;">操作</p>
  </div>
  
  <div class="panel-body">
     <c:forEach var="comment" items="${comments }">
			<div>
			<p style="width: 30%;float: left;text-align: center;">${comment.content }</p>
			<p style="width: 35%;float: left;text-align: center;">${comment.time }</p>
			<p style="width: 10%;float: left;text-align: center;">${comment.topic.title }</p>
			<p style="width: 25%;float: left;text-align: center;"><a href="${pageContext.request.contextPath }/delMyComment.do?cid=${comment.id}">删除</a></p>
			</div>
	</c:forEach>  
  </div>
</div>

</body>
</html>