<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
</head>
<style type="text/css">
.guide {
	width: 80%;
	margin: 0 auto;
	margin-top: 20px;
}

.phoneModel{
	text-align: center;
	margin:0 auto;
	float: left;
	width:: 200px;
	height: 300px;
	padding-left: 30px;
	padding-right: 30px;
	padding-top: 30px;
}

body{
	margin: 0;
	padding: 0;
}

select {
	width: 150px;
	margin-left: 20px
}

table tr {
	height: 30px;
	text-align: right;
}

table tr td {
	padding-left: 40px;
}
</style>
<script type="text/javascript">


$(document).ready(function () {
	
	$("select").change(function () {

		var bid = $(".brand").val();
		var price = $(".price").val();
		var sid = $(".psystem").val();
		var ram = $(".ram").val();
		var rom = $(".rom").val();
		var battery = $(".battery").val();
		var pre_camera = $(".pre_camera").val();
		var pos_camera = $(".pos_camera").val();
		var net = $(".netsupport").val();
		var coid = $(".color").val();
		
		
	$.post("${pageContext.request.contextPath }/search.do",
		{
			bid:bid,price:price,
			sid:sid,ram:ram,
			rom:rom,battery:battery,
			pre_camera:pre_camera,
			pos_camera:pos_camera,
			net:net,coid:coid
			
			},
			function (data,status) {
				$(".phone_list").html("");
				var objs = JSON.parse(data);
				$.each(objs,function(i,phone){
					
					$(".phone_list").append(
							"<div class='phoneModel'><img src='"+phone.img+"' width='200px',height='200px' /><br>品牌："+phone.brand+"<br>型号："+phone.model+"   "	
							+"<br>售价："+phone.price+"</div>"	);
									
				});
			}
		);});
	});



</script>
<body>

	<div>
		<jsp:include page="top.jsp"></jsp:include>
	</div>

	<div class="guide">
			<table>
				<tr>

					<td>品牌:<select class="brand">
							<option value="0"></option>
							<c:forEach var="brand" items="${brands }">

								<option value="${brand.bid }">${brand.bname }</option>
							</c:forEach>
					</select></td>

					<td>价格:<select class="price">
							<option value="0"></option>
							<option value="1">1000以下</option>
							<option value="2">1000~2000</option>
							<option value="3">2000~3000</option>
							<option value="4">3000~4000</option>
							<option value="5">4000元以上</option>
					</select></td>
					<td>系统:<select class="psystem">
							<option value="0"></option>
							<option value="1">android</option>
							<option value="2">IOS</option>
							<option value="3">云os</option>
							<option value="4">ubantu</option>

					</select></td>
				</tr>
				<tr>

					<td>RAM:<select class="ram">
							<option value="0"></option>
							<option value="1">1G起步</option>
							<option value="2">2G起步</option>
							<option value="4">4G起步</option>
							<option value="6">6G起步</option>
					</select></td>
					<td>ROM:<select class="rom">
							<option value="0"></option>
							<option value="16">16G起步</option>
							<option value="32">32G起步</option>
							<option value="64">64G起步</option>
							<option value="128">128G起步</option>
							<option value="256">256G起步</option>
					</select></td>
					<td>电池容量:<select class="battery">
							<option value="0"></option>
							<option value="1">2000~2500</option>
							<option value="2">2500~3000</option>
							<option value="3">3000~3500</option>
							<option value="4">3500以上</option>
					</select></td>
				</tr>
				<tr>

					<td>前置摄像头:<select class="pre_camera">
							<option value="0"></option>
							<option value="1">500w以下</option>
							<option value="2">500w~800w</option>
							<option value="3">800w~1200w</option>
							<option value="4">1200w以上</option>
					</select>
					</td>
					<td>后置摄像头:<select class="pos_camera">
							<option value="0"></option>
							<option value="1">500w以下</option>
							<option value="2">500w~800w</option>
							<option value="3">800w~1200w</option>
							<option value="4">1200w~1600w</option>
							<option value="5">1600w以上</option>
					</select></td>
					<td>网络支持:<select class="netsupport">
							<option value="0"></option>
							<option value="1">双网通</option>
							<option value="2">全网通</option>
					</select></td>
				</tr>
				<tr>

					<td>颜色:<select class="color">
							<option value="0"></option>

							<c:forEach var="color" items="${colors }">
								<option value="${color.coid }">${color.coname }</option>
							</c:forEach>
					</select>
					</td>

				</tr>
			</table>
			<div class="phone_list" ></div>
	</div>
</body>
</html>