<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../css/bootstrap-table.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.pagination{
	float: right;
}
.th-inner{
	text-align: center;
}
#tradeList{
	text-align: center;	
	margin: 0px;
}
.bootstrap-table{
	margin: 0px;
}
.fixed-table-container{
	clear: none;
	border: 0px;
}

</style>
<script type="text/javascript">
$(function () {
	 
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    /* var oButtonInit = new ButtonInit();
    oButtonInit.Init(); */

});

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: '${pageContext.request.contextPath }/showAllUser.do',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            strictSearch: true,
            clickToSelect: true,                //是否启用点击选中行
            height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                field: 'username',
                title: 'username'
            }, {
                field: 'email',
                title: 'email'
            }, {
                field: 'sex',
                title: 'sex'
            },{
                field: 'role',
                title: 'role'
            },
            {
                field: 'time',
                title: 'time'
            },
            {
                field: 'action',
                title: 'action'
            },]
        });
    };

    //得到查询的参数
  oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            sdate: $("#stratTime").val(),
            edate: $("#endTime").val(),
            sellerid: $("#sellerid").val(),
            orderid: $("#orderid").val(),
            CardNumber: $("#CardNumber").val(),
            maxrows: params.limit,
            pageindex:params.pageNumber,
            portid: $("#portid").val(),
            CardNumber: $("#CardNumber").val(),
            tradetype:$('input:radio[name="tradetype"]:checked').val(),
            success:$('input:radio[name="success"]:checked').val(),
        };
        return temp;
    };
    return oTableInit;
};

function delUser(uid) {
	$.get("${pageContext.request.contextPath }/delUser.do",
		{uid:uid},
		function(data,status){
			if(data=="success"){				
			$("#tradeList").bootstrapTable("refresh");
		}else {
			alert("删除失败！");
		}
		}
	);
} 
</script>
</head>
	<body>		
	<div style="width:60%;margin: 30px 80px;">
	<div class="panel panel-default" style="margin: 0px;">
  <div class="panel-heading" align="center">用户列表</div> 
   <table class="table" id="tradeList"></table>
  </div>
</div>	
</body>
</html>