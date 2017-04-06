<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>phone_bbs_top</title>
<style type="text/css">

.top{
	width:90%;
	height:20px;
	text-align: right;

	}
.nav {
	width: 80%;
	height: 40px;
	background: #6699CC;
}

.nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	list-style-type: none;
	font-family:微软雅黑;
}

.nav ul li {
	position: relative;
	width: 110px;
	float: left;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	font-weight: bold
}

.nav ul li a { /* border-right: 1px solid #e9e9e9; */
	color: white;
	height: 40px;
	line-height: 40px;
	text-decoration: none;
	display: block;
	text-align: center;
	overflow: hidden;
	text-decoration: none;
}

.nav ul li a:hover {
	font-weight: bold;
	background: #71AAE3;
}

.nav ul li ul {
	display: none;

}

.nav ul li:hover ul {
	display: block;
	position: absolute;
	min-width: 190px;
	left: 0;
}

.nav ul li:hover ul li a {
	display: block;
	background: #6699CC;
	color: white;
	width: 110px;
	text-align: center;
	border-right: none;

}

.nav ul li:hover ul li a:hover {
	background: #71AAE3;
	color: white;
	font-size: 16px;
}
</style>
</head>

<body>

	<div class="top">
	<c:choose>
	<c:when test="${username==null }">
		<a href="<%=request.getContextPath() %>/login.jsp">登陆</a>
		<a href="<%=request.getContextPath() %>/regist.jsp">注册</a>
	</c:when>
	<c:otherwise>
	<b>${username },欢迎您！</b>
		<a href="<%=request.getContextPath() %>/user/userDetail.jsp">个人中心</a>
		<a href="<%=request.getContextPath() %>/logout.do">注销</a>
	</c:otherwise>
	</c:choose>
	</div>
	<div align="center">
		<img width="80%" height="165px" src="img/topLogo.jpg">
	</div>
	<center>
		<div class="nav">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="">帖子</a>
					<ul>
						<li><a href="" target="_top">热门帖子</a></li>
						<li><a href="" target="_top">精品帖子</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath() %>/sectionBrand.do">版块</a></li>
				<li><a href="<%=request.getContextPath() %>/guide.do" >导购</a></li>
			</ul>
<div class="search" align="right" style="padding-top: 10px;padding-right: 10px">
	<form action="topic_Search.action" method="post"
		onsubmit="return checkContent();">
		<input type="text" name="content" id="searchContent"
			style="width:180px;height:22px;font-size:12px;background-color: white;border: 0;padding-left: 6px;" />
		<input type="submit" value="Search"
			style="background-color: white;font-size:12px;height:22px;border: 0;color: #6699CC;font-weight: bolder;" />
	</form>
		</div>
	</center>
</body>
</html>