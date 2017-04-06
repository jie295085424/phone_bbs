<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

 <c:forEach var="topic" items="${topics }">
 
 	<div>
 		<a href="../topicDetail.do?tid=${topic.id}">
 		<p>${topic.title }</p>
 		<p>${topic.time }</p></a>
 		<a href="${pageContext.request.contextPath }/delMyTopic.do?tid=${topic.id}">删除</a>
 	</div>
 	
 </c:forEach>

</body>
</html>