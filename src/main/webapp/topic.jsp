<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
p {
	float: left;
	padding-top: 10px;
}

.tTitle {
	float: left;
	width: 40px;
	font-size: 16px;
	background: #71AAE3;
}
.titleDiv{
	width: 70%;
	 margin: 0 auto; 
	 padding-top: 20px; 
	 text-align: center;
}

.titleDiv2{
}
.a1:HOVER {
	color: red;
}
</style>

<script type="text/javascript">
function checkNewTopic() {
//	var msg = '${user.username}';
//	if (!msg) {
//		var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
//		if (returnVal) {
//			location.href = 'login.jsp';
//		}
//	} else {
		window.location.href = 'newTopic.jsp?pid=${phone.pid}';
//	}
}
</script>
</head>
<body>
	<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>

	<div style="width: 80%; margin: 0 auto; padding-top: 20px;">
		<img src="${phone.img }" style="width: 55%;height:300px;">
		 <a style="padding-left: 30px">${phone.model }</a>
</div>
	<input type="button" value="发帖" id="fatie" onclick="checkNewTopic()">
	<div class="titleDiv" style="width: 80%">

		<p class="tTitle" style=" text-align:left;width: 40%;padding-left: 20px">标题</p>
		<p class="tTitle" style=" width: 15%">作者</p>
		<p class="tTitle" style=" width: 10%">评论量</p>
		<p class="tTitle" style=" width: 15%">发布时间</p>

	</div>
	<c:forEach var="topic" items="${list }">

		<a class="a1" href="${pageContext.request.contextPath }/topicDetail.do?tid=${topic.id}">
			<div style="width:80%;margin: 0 auto; text-align: center;">
				<p style="width: 40%; text-align: left;padding-left: 20px">${topic.title }</p>
				<p style="width: 15%">${topic.user.username }</p>
				<p style="width: 10%">${topic.comments.size() }</p>
				<p style="width: 15%">${topic.time }</p>

			</div>
		</a>
		<hr style="width: 60%; margin: 0 auto;margin-left: 170px;">


	</c:forEach>

</body>
</html>