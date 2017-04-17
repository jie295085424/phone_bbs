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

</head>
<body>
<div class="panel panel-default">
  <div class="panel-heading" style="overflow: hidden;">   
    <h3 class="panel-title" style="margin-left: 12%;">${topic.title }</h3>
    <input type="button" value="回复" id="huifu" onclick="checkNewComment()" style="float: right;margin-right: 5%;">
  </div> 
  <div class="panel-body" style="overflow: hidden;">
    <div class="row">
    	<div class="col-md-4" align="center">  	
    	<a href="#">  
    	<div class="thumbnail" style="margin:0px;overflow: hidden;width:100px; height:100px"> 
    	<img  src="${topic.user.img }" style="width:90px; height:90px;">
    	</div>   	 
    	</a>
    	<b>${topic.user.username }</b>
    	</div>
    	  	
    	<div class="col-md-8">
    	${topic.content }
    	</div>
    </div>
  </div>
</div>

</body>
</html>