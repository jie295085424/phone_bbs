<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
table tr td {
	width: 340px;
	text-align: center;
}

.input-group {
	width: 300px;
	margin: 0 auto;
	margin-top: 10px;
}

.input-group-addon {
	width: 110px;
}
</style>
</head>

<body>

<div>

	<div class="panel panel-default" style="width: 60%; margin: 30px 80px;">
		<div class="panel-heading" align="center">
			<h3 class="panel-title" >手机详情</h3>
		</div>

		<form
			action="${pageContext.request.contextPath }/addPhone.do?bid=<%=request.getParameter("bid") %>"
			method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td >
						<div class="input-group" style="margin-top: 30px">
							<span class="input-group-addon">手机型号：</span> <input type="text"
								class="form-control" name="model">
						</div>
					</td>
					<td>
						<div class="input-group" style="margin-top: 30px">
							<span class="input-group-addon">网络支持：</span> 
							<select class="sid" name="sid" style="width: 190px; height: 36px">
								<option>请选择</option>
								<option value="1">android</option>
								<option value="2">ios</option>
								<option value="3">云os</option>
								<option value="4">ubantu</option>
							</select>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">价格：</span> <input type="text"
								class="form-control" name="model">
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">三围：</span> <input type="text"
								class="form-control" name="lwh" >
						</div>
					</td>
				</tr>


				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">重量：</span> <input type="text"
								class="form-control" name="weight" >
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">RAM:</span> <input type="text"
								class="form-control" name="ram">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">ROM:</span> <input type="text"
								class="form-control" name="rom">
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">电池容量：</span> <input type="text"
								class="form-control" name="battery" >
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">前置摄像头：</span> <input type="text"
								class="form-control" name="pre_camera">
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">后置摄像头：</span> <input type="text"
								class="form-control" name="pre_camera">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">cpu：</span> <input type="text"
								class="form-control" name="cmodel">
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">性能：</span> <input type="text"
								class="form-control" name="cperformance">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">网络支持：</span> <select class="nid"
								name="nid" style="width: 190px; height: 36px">
								<option>请选择</option>
								<option value="1">双网通</option>
								<option value="2">全网通</option>
							</select>
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">图片：</span> <input type="text"
								class="form-control" id="f_file" class="imgPassth"
								onclick="fu.click()"> <input
								type="file" name="image" id="fu"
								onchange="f_file.value=this.value" style="display: none">
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<div class="input-group"
							style="width: 650px; float: left; margin-left: 20px;">
							<span class="input-group-addon"
								style="height: 34px; width: 110px;">颜色：</span>				
							<div class="panel panel-default"
								style="width: 530px; height: 36px; margin: 0px; line-height: 36px; border-bottom-left-radius: 0;">
								<input type="checkbox" name="color" value="1">银色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="color" value="2">白色&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp; <input type="checkbox" name="color" value="3">黑色&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp; <input type="checkbox" name="color" value="4">土豪金&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp; <input type="checkbox" name="color" value="5">玫瑰金
							</div>
						</div>
					</td>
				</tr>
			
				<tr>
					<td colspan="2">
					<input type="submit" style="margin:10px 40px;float:right;color: #333;border-radius: 4px; padding: 6px 12px;border: 1px solid transparent;border-color: #ccc;" value="save">
					<input type="reset" style="margin:10px 40px;margin-right:40px;float:right;color: #333;border-radius: 4px; padding: 6px 12px;border: 1px solid transparent;border-color: #ccc;" value="reset"></td>
				</tr>
			</table>
		</form>


	</div>

	</div>

</body>
</html>