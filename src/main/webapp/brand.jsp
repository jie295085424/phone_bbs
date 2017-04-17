<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<title>Insert title here</title>
<style type="text/css">

</style>
</head>

<body>
	<div>
	<div class="panel panel-info" style="margin:0 auto; width: 80%;height:40px;margin-top: 20px;background: #6699CC">
	<a style="font-size: 18px;color: white;">&nbsp;&nbsp;&nbsp;${brand.bname }</a>
	</div>	
	<div style="width: 80%;border: 1px solid #C2D5E3;margin: 0 auto;">
		<iframe	src="${pageContext.request.contextPath }/sectionPhone.do?bid=${brand.bid }"
						marginwidth="0" marginheight="0px" frameborder="0"
						scrolling="no" width="100%"></iframe>
						</div>
					</div>	
</body>
</html>