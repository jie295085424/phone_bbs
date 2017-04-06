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
		<form
			action="<%=request.getContextPath() %>/addPhone.do?bid=<%=request.getParameter("bid") %>"
			method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>手机型号：</td>
					<td><input type="text" name="model" value="${phone.model }"/></td>
					<td>系统：  </td>  
					<td><select class="sid" name="sid">
							<option>请选择</option>
							<option value="1">android</option>
							<option value="2">IOS</option>
							<option value="3">云os</option>
							<option value="4">ubantu</option>

					</select></td>

				</tr>
				<tr>
					<td>价格：</td>
					<td><input type="text" name="price" value="${phone.price }"/></td>
					<td>三围：</td>
					<td><input type="text" name="lwh" value="${phone.lwh }"/></td>
				</tr>
				<tr>
					<td>重量：</td>
					<td><input type="text" name="weight" value="${phone.weight }"/></td>
					<td>RAM:</td>
					<td><input type="text" name="ram" value="${phone.ram }"/></td>
				</tr>
				<tr>
					<td>ROM:</td>
					<td><input type="text" name="rom" value="${phone.rom }"/></td>
					<td>电池容量：</td>
					<td><input type="text" name="battery" value="${phone.battery }"/></td>
				</tr>
				<tr>
					<td>前置摄像头：</td>
					<td><input type="text" name="pre_camera" /></td>
					<td>后置摄像头：</td>
					<td><input type="text" name="pos_camera" /></td>
				</tr>
				<tr>

					<td>cpu：</td>
					<td><input type="text" name="cmodel" /></td>
					
					<td>性能：</td>
					<td><input type="text" name="cperformance" /></td>

				</tr>
				<tr>
				<td>网络支持：</td>
					<td><select class="nid" name="nid">
							<option>请选择</option>
							<option value="1">双网通</option>
							<option value="2">全网通</option>
					</select></td>
					<td>图片：</td>
					<td><input type="text" id="f_file" class="imgPath"
						onclick="fu.click()"></td>
					<td><input type="file" name="image" id="fu"
						onchange="f_file.value=this.value" style="display: none">
					</td>


				</tr>
				<tr>
					<td>颜色：</td>
					<td colspan="3" style="text-align: left;"><input
						type="checkbox" name="color" value="1">银色 <input
						type="checkbox" name="color" value="2">白色 <input
						type="checkbox" name="color" value="3">黑色 <input
						type="checkbox" name="color" value="4">土豪金 <input
						type="checkbox" name="color" value="5">玫瑰金</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="save"></td>
					<td><input type="reset" value="reset"></td>
					<td></td>
				</tr>

			</table>
		</form>
	</div>

</body>
</html>