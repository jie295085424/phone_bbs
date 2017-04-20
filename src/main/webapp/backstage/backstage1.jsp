<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://keleyi.com/keleyi/pmedia/jquery/ui/1.10.3/css/smoothness/jquery-ui.min.css" />
<link rel="stylesheet" href="../common/css/sccl.css">
<link rel="stylesheet" type="text/css"
	href="../common/skin/qingxin/skin.css" id="layout-skin" />
<title>首页</title>
<style type="text/css">
.layout-header{
	background-color: #3D4751;
}
</style>
</head>
<body>
	<div class="layout-admin">
		<header class="layout-header" > <span class="header-logo">系统框架</span>
		<a class="header-menu-btn" href="javascript:;"><i
			class="icon-font">&#xe600;</i></a>
		<ul class="header-bar">
			<li class="header-bar-role"><b>管理员</b></li>
			<li class="header-bar-nav"><a href="javascript:;">admin<i
					class="icon-font" style="margin-left: 5px;">&#xe60c;</i></a>
				<ul class="header-dropdown-menu">
					<li><a href="${pageContext.request.contextPath }/indexAction.do">退出</a></li>
				</ul></li>
			<li class="header-bar-nav"><a href="javascript:;" title="换肤"><i
					class="icon-font">&#xe608;</i></a>
				<ul class="header-dropdown-menu right dropdown-skin">
					<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
					<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
					<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>

				</ul></li>
		</ul>
		</header>
		<aside class="layout-side">
		<ul class="side-menu">

		</ul>
		</aside>

		<div class="layout-side-arrow">
			<div class="layout-side-arrow-icon">
				<i class="icon-font">&#xe60d;</i>
			</div>
		</div>

		<section class="layout-main">
		<div class="layout-main-tab">
			<button class="tab-btn btn-left">
				<i class="icon-font">&#xe60e;</i>
			</button>
			<nav class="tab-nav">
			<div class="tab-nav-content">
				<a href="javascript:;" class="content-tab active"
					data-id="home.html">首页</a>
			</div>
			</nav>
			<button class="tab-btn btn-right">
				<i class="icon-font">&#xe60f;</i>
			</button>
		</div>
		<div class="layout-main-body">
			<iframe class="body-iframe" name="iframe0" id="iframe0" width="100%" height="99%"
				src="home.html" frameborder="0" data-id="home.html" seamless></iframe>
		</div>
		</section>
		<div class="layout-footer">@2016 0.1 www.mycodes.net</div>
	</div>
	<script type="text/javascript" src="../common/lib/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="../common/js/sccl.js"></script>
	<script type="text/javascript" src="../common/js/sccl-util.js"></script>
</body>
</html>