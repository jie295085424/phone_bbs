<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="http://keleyi.com/keleyi/pmedia/jquery/ui/1.10.3/css/smoothness/jquery-ui.min.css" /> 
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
li{
	list-style-type:none;
}
</style>

</head>

<body>
 	
	<div class="row" style="padding-top: 20px;">
		<div class="col-lg-2" style="marging-left: 50px;">
			<ul>
				<li><a href="${pageContext.request.contextPath }/showAllUser.do"
					target="backIframe">用户管理</a></li>
				<li><a href="${pageContext.request.contextPath }/getBrand.do"
					target="backIframe">手机管理</a></li>
				<li><a href="${pageContext.request.contextPath }/showTopics.do"
					target="backIframe">帖子管理</a></li>
			</ul>
		</div>
		<div class="col-lg-7">
			<iframe name="backIframe" style="width: 100%;height: 500px;" scrolling="auto" >
		</div>
	</div>

</body>
</html>