<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript"  src="../js/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>

<c:forEach var="user" items="${users }">
<div>
<a>${user.username }</a>
<a href="<%=request.getContextPath() %>/delUser.do?uid=${user.uid}">删除</a>
</div>
</c:forEach>
</body>
</html>