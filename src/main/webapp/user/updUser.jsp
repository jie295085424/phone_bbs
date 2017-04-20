<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
body{
	float: left;	
}
.input-group {
	margin: 10px;
}

.input-group span {
	width: 100px;
}
</style>
</head>
<body>
	<div>
		<ul class="nav nav-tabs" style="border-bottom: 0px">
			<li class="active"><a
				style="background-color: #f8f8f8; font-size: 18px;">用户信息</a></li>
		</ul>
	</div>
	<div class="panel panel-default" style="height: 400px;width: 600px">
		<div class="panel-body" style="overflow: hidden;">
			<div style="position: absolute;left: 40px">
			<img src="${user.img }" width="120px" height="120px" />
				</div>  
			<div style="position:absolute;left: 200px;top: 120px;">
				<div class="input-group">	
					<input type="text" class="form-control" id="f_file"
						placeholder="选择图片..."> <span class="input-group-btn">
						<button class="btn btn-default" type="button" onClick="fu.click()">选择</button>
					</span>
				</div>

				<form
					action="${pageContext.request.contextPath }/updUser.do?uid=${user.uid}"
					method="post" enctype="multipart/form-data">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">用户名:</span> 
							<input
								type="text" class="form-control"
								aria-describedby="sizing-addon2" name="username"
								value="${user.username }">
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">email:</span>
							<input type="text" class="form-control"
								aria-describedby="sizing-addon2" name="email"
								value="${user.email }">
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">性别:</span>
							<c:choose>
								<c:when test="${user.sex=='boy'}">
 	&nbsp;&nbsp;&nbsp;男：<input type="radio" name="sex" value="boy"
										checked="checked">
 	&nbsp;&nbsp;&nbsp;女：<input type="radio" name="sex" value="girl">
								</c:when>
								<c:otherwise>
 	&nbsp;&nbsp;&nbsp;	男：<input type="radio" name="sex" value="boy">
 	&nbsp;&nbsp;&nbsp;女：<input type="radio" name="sex" value="girl"
										checked="checked">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">注册时间:</span> 
							<input
								type="text" class="form-control"
								aria-describedby="sizing-addon2" name="regTime"
								value="${user.regTime }">
								
						</div>
						<input type="file" name="img" id="fu"
							onchange="f_file.value=this.value" style="display: none;" value="${user.img }">
						<input type="submit"  value="提交" style="float: right;margin-right: 20px;">
				</form>
				</div>
			</div>
		</div>
</body>
</html>