<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

select{
	width: 100%;
}

</style>
</head>
<script type="text/javascript">
$(document).ready(function () {
		$(".brands").change(function () {
			var bid = $(".brands").val();
			$.post("<%=request.getContextPath()%>/getPhone.do",
				{bid:bid},
				function (data,status) {
					$("#phone_list").html("");
					var objs = JSON.parse(data);
					$.each(objs,function(i,phone){
						$("#phone_list").append(
						"<div class='row'>"
						+"<a href='<%=request.getContextPath() %>/updPhone.do?pid="+phone.pid+"'>"
								+phone.pmodel+"</a>"+
						"<a href='javascript:void(0)' onclick='delPhone("+phone.pid+")''>删除</a>"
						+"</div>"		
						);
					});
				
				});
		});
	});
	function delPhone(pid) {
		if(window.confirm("确认删除？")==true){
			
			$.get("<%=request.getContextPath()%>/delPhone.do",
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
			$.post("<%=request.getContextPath()%>/addBrand.do", {
				bname : bname
			}, function(data, status) {
				if (data == "success") {
					location.reload();
				}
			});
		}
	}

	function addPhone() {
		var bid = $(".brands").val();		
		window.location.href="<%=request.getContextPath()%>/backstage/addPhone.jsp?bid="+bid;
	}
</script>
<body>

	<div class="row" style="margin-left: 20px">
		<div class="col-md-4">
			<div style="width: 150px">
			<select class="brands">
					<option value="0">请选择</option>
					<c:forEach items="${brands }" var="brand">
						<option value="${brand.bid }">${brand.bname }</option>
					</c:forEach>				
				</select>
			</div>

			
			<div>
			<input type="text" id="newBrand">
				<input type="button" value="添加" onclick="addBrand()">
			</div>
			</div>
			
			
		<div class="col-md-8">
		<div style="float: right; padding-right: 30px">      
	      <input type="submit" value ="添加" onclick="addPhone();">
		</div>           
			<div id="phone_list" style="margin-right: 20px;padding-top: 40px;"></div>						
			</div>
					
</div>	

</body>
</html>