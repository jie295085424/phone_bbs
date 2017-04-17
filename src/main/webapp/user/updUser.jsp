<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(window.parent.document).find("#iframeId").load(function () {
    var main = $(window.parent.document).find("#iframeId");
    var thisheight = $(document).height() + 20;
    main.height(thisheight);
});
</script>
<body>
<div>
<form action="${pageContext.request.contextPath }/updUser.do?uid=${user.uid}" method="post" enctype="multipart/form-data">
	
	<img  src="${user.img }" class="img">
	<input type="text" style="width: 160px;" id="f_file" class="imgPath"> 
	<input type="button" value="选择" class="butt" style="width: 50px;" onClick="fu.click()">
	 <input  type="file" name="img" id="fu" onchange="f_file.value=this.value" style="display:none">   
		<input type="text" name="username" value="${user.username }">
	    <input type="submit" value="提交">
		</form>
		</div>
</body>
</html>