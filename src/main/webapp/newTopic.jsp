<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="js/umeditor/themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<script type="text/javascript"
	src="js/umeditor/third-party/jquery.min.js"></script>
<script type="text/javascript"
	src="js/umeditor/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<form action="${pageContext.request.contextPath }/newTopic.do?pid=<%=request.getParameter("pid") %>
	&username=${username}" method="post">
		<div align="center">
			<div style="width: 70%; margin-top: 30px;">
				<b>标题：</b> <input type="text" name="title"
					style="width: 300px; height: 25px;">
			</div>
			<div style="padding-top: 10px;">
				<b>内容：</b>

				<script type="text/plain" id="editor" style="height: 300px;" name="content">
</script>
			</div>
			<input type="submit" value="发帖" name="sumit">
		</div>
		<script type="text/javascript">
			var ue = UM.getEditor('editor');
		</script>

	</form>
</body>
</html>