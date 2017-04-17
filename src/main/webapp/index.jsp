<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
<style type="text/css">

.panel-default{
	width: 70%;
 	margin: 0 auto;
 	height: 50px;	
	padding: 0px;
}
.panel-default ul{
	height: 50px;
}
.nav-pills li {
	height: 50px;
}
#navbrand li a{	
	height: 48px;
	color:#666;	
	padding-top: 14px;
}

</style>
</head>
<body>
	<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div class="panel panel-default">
	<ul class="nav nav-pills" id="navbrand">
  <li><a style="background-color: #3D4751;width: 160px;font-size: 18px;color: white;">热门品牌</a></li>

 
  <c:forEach var="brand" items="${brands }">
  	 <li><a href="${pageContext.request.contextPath }/sectionBrand.do?bid=${brand.bid}">${brand.bname }</a></li>
  </c:forEach>
</ul>
</div>
<div>

<div style="width: 49%;margin-left: 15%;float: left;">
<ul class="nav nav-tabs" >
  <li class="active"><a style="background-color: #f8f8f8;font-size: 18px;">热门型号</a></li>
</ul>
</div>
</div>
<div class="row" style="margin-left: 14%">
<div class="col-sm-7">
<div class="row" style="padding: 0px;padding-top: 30px;">
<c:forEach var="phone" items="${phones }">
  <a href="${pageContext.request.contextPath }/phoneTopic.do?pid=${phone.pid}">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="${pageContext.request.contextPath }/${phone.img }">
      <div class="caption" align="center">
        <h4>${phone.brand.bname }</h4>
        <p>型号：${phone.model }</p>
      </div>
    </div>
  </div>
  </a>
  </c:forEach>
</div>
</div>



<div class="col-sm-4">
<div class="row">
    <div class="panel panel-default" style="margin:0px;overflow: hidden;height: auto;margin-left: 1%">
  <div class="panel-body">
  <div>
    <img  src="img/fatie.ico" style="width: 48%;float: left;">
     <img  src="img/qiandao.ico" style="width: 48%;float: right;">
    <br><br><br> 
	<c:choose>
	<c:when test="${user.username==null }">
	<div class="row">
	<div class="col-sm-4">
		<img width="60px" height="60px" src="${pageContext.request.contextPath }/img/portrait/youke.ico">
	</div>
	<div class="col-sm-8">
		<p><br>游客，您好！<br>登录再玩耍，妥妥哒。</p>
	</div>
	</div>		
	</c:when>
	<c:otherwise>
	<div class="row">
	<div class="col-sm-4">
		<img  src="${user.img }"  width="60px" height="60px">
			</div>
				<div class="col-sm-8">
	<p><br>${user.username },欢迎您！</p>
	</div>
	</div>
	</c:otherwise>
	</c:choose>
  </div>
</div>
    </div>
  </div>

   
  <div class="row">
  <div class="panel panel-default" style="margin:0px;overflow: hidden;height: auto;margin-left: 1%;margin-top: 10px;">
  <div class="panel-heading">
    <h3 class="panel-title">热门话题</h3>
  </div>
  <div class="panel-body">
    <c:forEach var="topic" items="${topics }">
    	<a href="${pageContext.request.contextPath }/topicDetail.do?tid=${topic.id}">${topic.title }</a><hr>
    </c:forEach>
  </div>
</div>
</div> 
  </div>
</div>
</div>

<div>
	<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>


</html>