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
<title>导航栏</title>
<style type="text/css">
#home {
	background-color: white;
	width: 778px;
	height: 360px;;
	font-size: 14px;
	font-family: 微软雅黑;
	font-size: 14px;
}

.inputText {
	width: 180px;
	height: 30px;
	font-size: 16px;
}

.butt {
	background-color: #6699CC;
	width: 100px;
	height: 30px;
	border: 0;
	color: white;
	font-size: 18px;
}

.butt:hover {
	background-color: #71AAE3;
	border: 0;
}

.file {
	border: 1px solid #C2D5E3;
	height: 24px
}
</style>
</head>
<body>
<div id="home">

	<div
		style="float: left;background-color: white;width: 50px;height: 100%"></div>
	<div style="float: left;width: 460px;height: 100%">
		<form action="#" method="post">
			<div align="left"
				style="float: left;background-color: white;width: 100%;height: 90%;line-height: 28px;">
				<table>
					<tr height="30px;">
						<td width="60px;">用户名</td>
						<td>${user.username }</td>
					</tr>
					<tr>
						<td>性&nbsp;&nbsp;&nbsp;别</td>
						<td><input name="userSex" type="radio" 
							value="男"> 男 <input name="userSex" type="radio"
							value="女"> 女</td>
					</tr>
					<tr>
						<td>邮&nbsp;&nbsp;&nbsp;箱</td>
						<td><input type="text" name="email" class="inputText"
							id="uEmail" value="${user.email }"
							onfocus="warnEmail()" onblur="return checkemail();" /><input
							id="defaultEmail"
							value="<s:property value="#session.tu.email" />"
							style="display: none;" />
						</td>
						<td id="emailts"
							style="height:20px;line-height:20px;text-align: left;font-size: 12px;"></td>
					</tr>

				</table>

			</div>
			<div align="center"
				style="float: left;background-color: white;width: 100%;height:10%;margin-top: 10px;">
				<input type="submit" value="保存资料" class="butt" />
			</div>
		</form>
	</div>
	<div align="center"
		style="float: left;background-color: white;width: 240px;height: 100%;border-left: 1px solid #C2D5E3;">
		<p>
			<img alt="我的头像" style="width: 160px;height: 220px;"  onerror="this.src='./image/ds-java.png'" 
				src="<s:property value="#session.tu.picture" />">
		<form action="uploadUserPic.action" enctype="multipart/form-data"method="POST">
			<div align="right">
				<input type="text" class="inputText" style="width: 160px;"
					id="f_file"> <input type="button" value="选择" class="butt" 
					style="width: 50px;" onClick="fu.click()"> <input
					name="fileUpload" type="file" id="fu"
					onchange="f_file.value=this.value" style="display:none">
			</div>
			<input type="text" name="user.username"
				value="<s:property value="#session.tu.username" />"
				style="display: none;" />
			<p>
				<input type="submit" value="上传" class="butt"
					style="height: 30px;width: 80px;font-size: 16px;" />
			<p align="left" style="margin-left: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;允许上传格式bmp,png,gif,jpg!</p>
		</form>
	</div>

</div>

</body>
</html>