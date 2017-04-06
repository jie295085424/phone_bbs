<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp"></jsp:include>
	</div>
	<div style="width: 80%">
		<div style="float: left; width: 30%">
			<ul>
				<li><a href="<%=request.getContextPath() %>/showUser.do" target="show">信息修改</a></li>
				<li><a href="<%=request.getContextPath() %>/showMyTopic.do" target="show">我的帖子</a></li>
				<li><a href="<%=request.getContextPath() %>/showMyComment.do" target="show">我的评论</a></li>
			</ul>
		</div>
		<iframe name="show" style="float: right; width: 70%">
			<div>
				
		</iframe>
	</div>


</body>
</html>