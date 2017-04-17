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
<title>导航栏</title>
<style type="text/css">

.top{
	background-color: #3D4751;
	height: 35px;
	font-size: 16px;
	line-height: 35px;
	
}
.top div{
	float: right;
	margin-right: 16%;
	height: 35px;
}
.top a{
	padding-left:1%;
	padding-right:1%;
	color: #FFFFFF;
	text-decoration:none ; 
}
.top a:hover
{
	background-color: #5A7474;
}
.vavbar{
	margin-bottom: 1%;
}
.navbar navbar-default{
	float: right;
}
.container-fluid{

	padding-top: 2%;
	margin-left:0px;
	margin-right: 10%;
}
.navbar-brand{
	font-size: 20px;	
}

nav div{
	float:right;
	font-size: 18px;
}
nav div input{
	margin-top: 1%;
}
.navbar-header{
	
	height: 80px;	
}
.dropdown-menu{
	font-size: 16px;
}

.form-control{
	width: 15%;
	display: inline;	
}

</style>
<script type="text/javascript">
function checkSearch() {
	var content = $("#searchContent").val();
	if(null!=content&&""!=content){
		location.href="${pageContext.request.contextPath }/searchTopic.do?content="+content;
	}else{
		alert("请输入搜索内容!");
	}
}
</script>
</head>
<body>

<div class="top">
	<a style="float: left;margin-left: 14%" href="${pageContext.request.contextPath }/indexAction.do">手机论坛首页</a>
	<c:choose>
	<c:when test="${user.username==null }">
		<a style="float: right;margin-right: 14%" href="${pageContext.request.contextPath }/regist.jsp">注册</a>
		<a style="float: right;margin-right: 1%" href="${pageContext.request.contextPath }/login.jsp">登陆</a>
	</c:when>
	<c:otherwise>
		<a style="float: right;margin-right: 14%" href="${pageContext.request.contextPath }/logout.do">注销</a>
		<a style="float: right;margin-right: 1%" href="${pageContext.request.contextPath }/user/userDetail.jsp">个人中心</a>
	<b style="color: white;float: right;margin-right: 1%">${user.username },欢迎您！</b>
	</c:otherwise>
	</c:choose>
</div>

<nav class="navbar navbar-default" role="navigation">
	
 	<div style="float: left;margin-left: 14%;margin-top: 15px;height: 70px;margin-right: 1%;">
 	
 		<img  style="width: 50px;height: 70px;" src="${pageContext.request.contextPath }/img/logo.ico" >
 		<div style="margin-left: 5px;">
 			<b style="font-size: 25px;">手机导购论坛</b><br>
 			<b>phone_bbs</b>
 		</div>
 	</div>
 	
	<div class="container-fluid">

	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/indexAction.do">首页</a>
	</div>
	<div>
		<ul class="nav navbar-nav">
					<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					帖子
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath }/jingPinTopic.do">精品帖子</a></li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/hotTopic.do">热门帖子</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath }/sectionBrands.do">板块</a></li>
			<li><a href="${pageContext.request.contextPath }/guide.do">导购</a></li>
		</ul>

       <input type="text" name="content" class="form-control" placeholder="请输入字段名" id="searchContent" style="width: 30%"/ >  
         <button class="btn btn-info btn-search" onclick="checkSearch();">search</button>  

	</div>
	</div>
</nav>

</body>
</html>