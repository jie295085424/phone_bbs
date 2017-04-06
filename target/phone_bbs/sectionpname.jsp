<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
</head>
<style type="text/css">
a:link,a:visited {
	background-color: white;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
a:hover {
	background-color: white;
	text-decoration: none;
} /* 鼠标指针移动到链接上 */
.typeStyle{
	color: #0066C2;
}
.typeStyle:hover {
	background-image: url("image/type_bg.png");
	color: red;
}
</style>
<body>
<div style="background-color: #FAFAFA;font-family: 微软雅黑;">
	<c:forEach var="phone" items="${list }">
		<a target="_top"
			href="<%=request.getContextPath() %>/phoneTopic.do?pid=${phone.pid}" />
			<div class="typeStyle"
				style="margin: 10px 10px 10px 17px;background-color: white;height: 100px;width: 160px;float: left;border: 1px solid #D8E6F0">
				<div style="width: 160px;height: 100px;float: left;">
				<img  style="width: 160px;height: 100px;"src="${phone.img }">
				</div>
				<div style="width: 130px;height: 35px;float: left;">
					<div
						style="width: 100%;height: 35px;line-height:35px;float: left;font-size: 14px;font-weight: bolder;text-align: center;">
						${phone.model }
					</div>

				</div>
			</div> </a>
	</c:forEach>
</div>
</body>
</html>