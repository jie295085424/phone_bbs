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
	<div class="row" style="width: 70%;margin: 0 auto;">
		<div class="col-lg-4">
			<ul>
				<li><a href="${pageContext.request.contextPath }/showUser.do" target="show">信息修改</a></li>
				<li><a href="${pageContext.request.contextPath }/showMyTopic.do" target="show">我的帖子</a></li>
				<li><a href="${pageContext.request.contextPath }/showMyComment.do" target="show">我的评论</a></li>
			</ul>
		</div>
		<div class="col-lg-8">
		<iframe name="show" id="iframeId" scrolling="no"  frameborder="0" width="100%">
		</iframe>	
		</div>
</div>

<div> 
	<jsp:include page="../bottom.jsp"></jsp:include>
</div>

</body>
</html>