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

body{margin:0; padding:0;}


</style>
</head>
<script type="text/javascript">
	function getPhoneDetail(pid) {
		parent.location.href="${pageContext.request.contextPath }/phoneTopic.do?pid="+pid;
	}
	$(window.parent.document).find("#iframeId").load(function () {
	    var main = $(window.parent.document).find("#iframeId");
	    var thisheight = $(document).height() + 20;
	    main.height(thisheight);
	});
</script>
<body>
<div class="row">
	<c:forEach var="phone" items="${list }">
 <a href="javascript:void(0)" onclick="getPhoneDetail(${phone.pid})">
  <div class="col-lg-3 col-sm-3 col-md-3" style="height: auto">
    <div class="thumbnail">
      <img src="${phone.img }" width="200px" height="200px">
      <div class="caption" align="center">
        <p>型号：${phone.model }</p>
      </div>
    </div>
  </div>
  </a>
	</c:forEach>
</div>
</body>
</html>