<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
function delTopic(id) {

	$.get("${pageContext.request.contextPath }/delTopic.do",
		{tid:id},
		function(data,status){
			window.reload();
		}
	);
} 
function showTopicDetail(tid) {
	parent.window.location.href="${pageContext.request.contextPath }/topicDetail.do?tid="+tid;
}
function updTopic(tid) {

	$.post("${pageContext.request.contextPath }/updTopic.do",
		{tid:tid},function (data,status){
			location.replace("${pageContext.request.contextPath }/showTopics.do");
		}
		
	);	
}

function topicDetail(tid) {
	parent.location.replace("${pageContext.request.contextPath }/topicDetail.do?tid="+tid);
}
</script>

<body>

		<c:forEach var="topic" items="${topics }">
			<div>
			<a>${topic.title }</a>
		
			<c:choose>
			<c:when test="${topic.boutique==false }">
				<a href="javascript:void(0)" onclick="updTopic(${topic.id})">加精</a>				
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0)" onclick="updTopic(${topic.id})">取消加精</a>						
			</c:otherwise>
			</c:choose> 
			
			<a href="javascript:void(0)" onclick="topicDetail(${topic.id})">详情</a>
			<a href="javascript:void(0)" onclick="delTopic(${topic.id})">删除</a>
			</div>
		</c:forEach>
</body>
</html>