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
<script type="text/javascript">
function showTopicDetail(tid) {
	parent.location.href ="${pageContext.request.contextPath }/topicDetail.do?tid="+tid;
}
$(window.parent.document).find("#iframeId").load(function () {
    var main = $(window.parent.document).find("#iframeId");
    var thisheight = $(document).height() + 20;
    main.height(thisheight);
});
</script>
<body>

 <c:forEach var="topic" items="${topics }">
 
 	<div>
 		<a href="javascript:void(0)" onclick="showTopicDetail(${topic.id});">
 		<p>${topic.title }</p>
 		<p>${topic.time }</p></a>
 		<a href="${pageContext.request.contextPath }/delMyTopic.do?tid=${topic.id}">删除</a>
 	</div>
 	
 </c:forEach>

</body>
</html>