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
<style type="text/css">

.panel-body a:HOVER{
	color: red;
}

</style>
</head>
<script type="text/javascript">
function showTopicDetail(tid) {
	parent.location.href ="${pageContext.request.contextPath }/topicDetail.do?tid="+tid;
}

</script>
<body>
 <div class="panel panel-default" style="margin: 0 auto;">
  <!-- Default panel contents -->  
  <div class="panel-heading" style="overflow: hidden;text-align:center;">
  		<p style="width: 30%;float: left;text-align: center;">标题</p> 
		<p style="width: 35%;float: left;text-align: center;">发布时间</p>
		<p style="width: 10%;float: left;text-align: center;">评论量</p>
		<p style="width: 25%;float: left;text-align: center;">操作</p>
  </div>
  
  <div class="panel-body">
     <c:forEach var="topic" items="${topics }">
 			<a class="a1" href="${pageContext.request.contextPath }/topicDetail.do?tid=${topic.id}">
			<div>
			<p style="width: 30%;float: left;text-align: center;">${topic.title }</p>
			<p style="width: 35%;float: left;text-align: center;">${topic.time }</p>
			<p style="width: 10%;float: left;text-align: center;">${topic.countNum }</p>
			<p style="width: 25%;float: left;text-align: center;"><a href="${pageContext.request.contextPath }/delMyTopic.do?tid=${topic.id}">删除</a></p>
			</div>
		</a>
	</c:forEach>  
  </div>
</div>

</body>
</html>