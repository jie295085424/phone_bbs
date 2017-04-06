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
 <c:forEach var="comment" items="${comments }">
 
 	<div>
 		<a>
 		<p>${comment.topic.title }</p>
 		<p>${comment.time }</p>
 		<a href="${pageContext.request.contextPath }/delMyComment.do?cid=${comment.id}">删除</a>
 	</a>
 	</div>
 	
 </c:forEach>
</body>
</html>