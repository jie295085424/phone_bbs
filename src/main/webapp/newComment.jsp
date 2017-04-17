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
	<div  style="width: 70%;margin: 0 auto">
	<form action="${pageContext.request.contextPath }/newComment.do?tid=<%=request.getParameter("tid") %>
	&username=<%=session.getAttribute("username")%>" method="post">
		<div>

			<div style="margin: 0px;margin-top: 5px;">  
				<script type="text/plain" id="editor" style="width:100%;height: 300px;" name="content">
					</script>  
			</div style="margin: 0px;margin-top: 10px;"	>
			<div>
			<input type="submit" value="发帖" name="sumit"></div>
		</div>
		<script type="text/javascript">
			var ue = UM.getEditor('editor');
		</script>

	</form>
	</div>
</body>
</html