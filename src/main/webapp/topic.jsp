<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
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

.a1{
 text-align: center;
}
.a1:HOVER {
	color: red;
}
div table tr td{

width: 160px;
}
.td1{
	text-align:right;	
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

<c:if test="${0!=phone.pid&&null!=phone.pid }">
  <div class="thumbnail" style=" height: 300px;width: 70%; margin: 0 auto;position:relative;">       
      <img style=" height: 200px;width: 100%;" src="${pageContext.request.contextPath }/${phone.img }">   
      <div class="thumbnail" style="padding: 40px 40px; position: absolute;left: 5%;top: 30%;height:160px;width: 140px;background-color: white">
          <img style=" height: 80px;width: 65px;" src="${pageContext.request.contextPath }/${phone.img }">   
      </div>
      <div style="margin-left: 22%;">  	 
      		<br><span style="font-size: 20px">${phone.model }论坛</span><br>  
      		<span>主题：<b style="color: orange">${phone.topics.size() }</b></span> 
      		<em>&nbsp;|&nbsp;</em>  
      		<span>回复：<b style="color: orange">${countNum }</b></span>    	
      </div>

       </div>   	 	
	
  <div style="width: 49%;margin-left: 15%;float: left;margin-top: 10px;">
<ul class="nav nav-tabs" >
  <li class="active"><a style="background-color: #f8f8f8;font-size: 18px;">基本配置</a></li>
</ul>
</div>


<div class="row">
    <div class="panel panel-default" style="width:20%;margin:0px;overflow: hidden;height: auto;margin-left: 66%;position: absolute;margin-top: 20px">
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

<div style="width: 49%;margin-left: 15%;margin-top:20px;">
  <table>
   <tr>
    <td class="td1">品牌：</td> <td>${phone.brand.bname }</td>
     <td class="td1">系统：</td> <td>${phone.psystem.sname }</td>
      <td class="td1">售价：</td> <td>${phone.price }</td>
    </tr>
  
          </tr>
        <td class="td1">cpu：</td> <td>${phone.cpu.cmodel }</td>
     <td class="td1">网络支持：</td> <td>${phone.netSupport.net }</td>
      <td class="td1">颜色：</td> 
      <td>
      <c:forEach var="color" items="${phone.colors }">
      	${color.coname }&nbsp;
      </c:forEach>
      </td>
    </tr>
        <tr>
    <td class="td1">RAM：</td> <td>${phone.ram }</td>
     <td class="td1">ROM：</td> <td>${phone.rom }</td>
      <td class="td1">三围：</td> <td>${phone.lwh }</td>
    </tr>
    <tr>
        <td class="td1">前置摄像头：</td> <td>${phone.pre_camera }</td>
     <td class="td1">后置摄像头：</td> <td>${phone.pos_camera }</td>
      <td class="td1">重量：</td> <td>${phone.weight }</td>
</tr>
   
  </table>
</div>
	</c:if>	
	
	
<div class="panel panel-default" style="width: 70%;margin: 0 auto;margin-top: 40px">
  <!-- Default panel contents -->
  <div class="panel-heading" style="overflow: hidden;padding: 1px;text-align:center;">
  <p style=" text-align:center;width: 40%;">标题</p>
		<p style=" width: 25%">作者</p>
		<p style=" width: 10%">评论量</p>
		<p style=" width: 25%">发布时间</p>
  </div>
 
  <div class="panel-body">
     <c:forEach var="topic" items="${list }">
 			<a class="a1" href="${pageContext.request.contextPath }/topicDetail.do?tid=${topic.id}">
			<div style="margin: 0 auto;text-align: center;">
				<p style="width: 40%;">${topic.title }</p>
				<p style="width: 25%">${topic.user.username }</p>
				<p style="width: 10%">${topic.countNum }</p>
				<p style="width: 25%">${topic.time }</p>
			</div>
		</a>
		<hr style="width: 90%; margin: 0 auto;">
	</c:forEach>  
  </div>
</div>
<div>
	<jsp:include page="bottom.jsp"></jsp:include>
</div>

</body>
</html>