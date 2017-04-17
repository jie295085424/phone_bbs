 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bbs.entity.Phone" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">

function checkNewComment() {
//	var msg = '${user.username}';
//	if (!msg) {
//		var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
//		if (returnVal) {
//			location.href = 'login.jsp';
//		}
//	} else {
		  window.location.hash = "#newComment"; 
//	}
}
</script>

<style type="text/css">
	.content img{
		width: 50%;
		height: 50%;
	}
</style>
</head>
<body>
		<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	
	<div class="panel panel-default" style="margin: 0 auto;width: 70%"> 
   <input type="button" value="回复" id="huifu" onclick="checkNewComment()" style="position:absolute;margin-left: 65%;margin-top: 10px;">
  <div class="panel-heading">   
    <p class="panel-title" style="margin-left: 12%;">${topic.title }</p>
  </div> 
  <div class="panel-body" style="overflow: hidden;position: relative;">
    <div class="row">
    	<div class="col-md-2">  	
    	<div class="thumbnail" style="margin:0px;overflow: hidden;width:100px; height:100px;margin:20px;"> 
    	<img  src="${topic.user.img }" style="width:90px; height:90px;">  	
    	</div>   	 
    	<b style="margin-left: 45px;">${topic.user.username }</b>
    	</div> 
    	  	
    	<div class="col-md-8">      
    	${topic.content }           
    	</div> 	
    	 <b style="position:absolute;display: inline-block;height: 22px;vertical-align: bottom;bottom: 5px;right:5px;">发表于：${topic.time }</b>   
    </div>
  </div>
 
</div>

 
	<c:forEach var="comment" items="${list }">
	
	<div class="panel panel-default" style="margin: 0 auto;width: 70%"> 
  <div class="panel-body" style="overflow: hidden;position: relative;">
  	
    	<div class="col-md-2">  	
    	<div class="thumbnail" style="margin:0px;overflow: hidden;width:100px; height:100px;margin:20px;"> 
    	<img  src="${comment.user.img }" style="width:90px; height:90px;">  	
    	</div>   	 
    	<b style="margin-left: 45px;">${comment.user.username }</b>
    	</div> 
    	  	
    	<div class="col-md-8">
    	${comment.content }         	
    	</div>
    	   <b style="position:absolute;display: inline-block;height: 22px;vertical-align: bottom;bottom: 5px;right:5px;">发表于：${comment.time }</b> 
    </div>
  </div>
 
</div>

		</c:forEach>


 <!-- 	
	<div>
	${comments }
	</div>	
 -->		
			
	<div Id="newComment" style="margin: 0 auto;">	
		<jsp:include page="newComment.jsp"></jsp:include>
	</div>
<div>  
	<jsp:include page="bottom.jsp"></jsp:include>
</div>

</body>

</html>