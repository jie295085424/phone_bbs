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
</head>
<script type="text/javascript">
$(document).ready(function () {
		$(".brands").change(function () {
			var bid = $(".brands").val();
			$.post("${pageContext.request.contextPath }/getPhone.do",
				{bid:bid},
				function (data,status) {
					$("#phone_list").html("");
						$("#phone_list").append("<tr><td>手机型号</td><td>操作 </td></tr>");
					var objs = JSON.parse(data);
					$.each(objs,function(i,phone){
						$("#phone_list").append(
						"<tr><td><a href='${pageContext.request.contextPath }/updPhone.do?pid="+phone.pid+"'>"
					+phone.pmodel+"</a></td><td><a href='javascript:void(0)' onclick='delPhone("+phone.pid+")''>删除</a></td></tr>"	
						);
					});
				
				});
		});
	});
	function delPhone(pid) {
		if(window.confirm("确认删除？")==true){
			
			$.get("${pageContext.request.contextPath }/delPhone.do",
					{pid:pid},
					function (data,status) {
						location.reload();
					}
					);
		}
	}
	
	
	function addBrand() {
		var bname = $("#newBrand").val();
		if(bname!=""&&bname!=null){
			$.post("${pageContext.request.contextPath }/addBrand.do", {
				bname : bname
			}, function(data, status) {
				if (data == "success") {
					location.reload();
				}
			});
		}else{
			alert("请输入品牌名！");
		}
	}

	function addPhone() {
		var bid = $(".brands").val();	
		if(bid!=0){			
		window.location.href="${pageContext.request.contextPath }/backstage/addPhone.jsp?bid="+bid;
		}else{
			alert("请选择手机品牌！");
		}
	}
</script>
<body>

	<div class="panel panel-default" style="width: 60%; margin: 30px 80px">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<div class="input-group">
				<span>品牌：</span> <select class="brands"
					style="height: 28px; width: 200px;">
					<option value="0">请选择</option>
					<c:forEach items="${brands }" var="brand">
						<option value="${brand.bid }">${brand.bname }</option>
					</c:forEach>
				</select>
				<button style="margin-left: 320px" type="button"
					class="btn btn-default" onclick="addPhone()">型号添加</button>
			</div>
		</div>
		<table  class="table table-hover" id="phone_list"
			style="text-align: center;height: 200px">
			<tr>
				<td>手机型号</td>
				<td>操作</td>
			</tr>
		</table>

		<div class="panel-footer">
			<span>添加手机品牌：</span> <input type="text" id="newBrand">
			<button style="margin-left: 20px" type="button"
				class="btn btn-default" onclick="addBrand()">添加</button>
		</div>
	</div>
</body>
</html>