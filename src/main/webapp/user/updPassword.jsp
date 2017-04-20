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
<style type="text/css">
.input-group{
	margin: 20px;
}

</style>
</head>
<script type="text/javascript">
	function checkPassword() {
		var oldpw = $("#oldpw").val();
		var newpw = $("#newpw").val();
		var againpw = $("#againpw").val();
		if(newpw!=againpw){
			alert("密码不一致！");
		}else if(oldpw!=${user.password }){
			alert("密码错误！");
		}else{
			$.get("${pageContext.request.contextPath}/updPassword.do?",
					{newpw:newpw},
					function (data,status) {
						if("success"==data){
							alert("修改成功！");
						}else{
							alert("修改失败！！")
						}
					});
		}
	}
</script>

<body>
	<div class="input-group" >
			<input type="text" class="form-control" placeholder="old password" aria-describedby="sizing-addon2" id="oldpw" ></div>
		<div class="input-group">
			<input type="text" class="form-control" placeholder="new password" aria-describedby="sizing-addon2" id="newpw" ></div>
	<div class="input-group">
			<input type="text" class="form-control" placeholder="again password" aria-describedby="sizing-addon2" id="againpw" ></div>
	<input type="submit" value="提交" onclick="checkPassword();" style="margin-left: 180px;">
	
	</div>
</body>
</html>