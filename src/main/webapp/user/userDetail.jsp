<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript" language="javascript"> 
function iFrameHeight() { 
var ifm= document.getElementById("iframepage"); 
var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument; 
if(ifm != null && subWeb != null) { 
ifm.height = subWeb.body.scrollHeight; 
} 
} 
</script> 
<body>
	<div>
		<jsp:include page="../top.jsp"></jsp:include>
	</div>
	<div class="row" style="width: 70%;margin: 0 auto;">
		<div class="col-lg-2" align="center">
		<ul class="list-group">
  <li class="list-group-item"><a href="${pageContext.request.contextPath }/showUser.do" target="iframepage">信息修改</a></li>
  <li class="list-group-item"><a href="${pageContext.request.contextPath }/showMyTopic.do" target="iframepage">我的帖子</a></li>
  <li class="list-group-item"><a href="${pageContext.request.contextPath }/showMyComment.do" target="iframepage">我的评论</a></li>
  <li class="list-group-item"><a href="${pageContext.request.contextPath }/user/updPassword.jsp" target="iframepage">密码修改</a></li>
  <li class="list-group-item"><a href="${pageContext.request.contextPath }/logout.do" target="iframepage">安全退出</a></li>
</ul> 

		</div>
		<div class="col-lg-8" style="margin-left: 5%;">		
		<iframe  id="iframepage" name="iframepage" frameBorder=0 scrolling=no width="100%" onLoad="iFrameHeight()" ></iframe>	
		</div>
</div>

<div> 
	<jsp:include page="../bottom.jsp"></jsp:include>
</div>

</body>
</html>