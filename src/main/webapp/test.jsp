<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jquery ui弹出div层对话框--柯乐义</title>
<link rel="stylesheet" href="http://keleyi.com/keleyi/pmedia/jquery/ui/1.10.3/css/smoothness/jquery-ui.min.css" /> 
<script type="text/javascript" src="http://keleyi.com/keleyi/pmedia/jquery-1.9.1.min.js"></script>
<script src="http://keleyi.com/keleyi/pmedia/jquery/ui/1.10.3/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> 
<script type="text/javascript">
function keleyidialog() {
$("#dialog").dialog();
}
</script>
<style type="text/css">#dialog{display:none;}</style>
</head>
<body>

<div style="width:338px;height:100px;margin:10px auto;"><input type="button" onclick="keleyidialog()" value="点击我" />
<a href="http://keleyi.com/a/bjac/5939d3b2c920ff6d.htm" target="_blank">原文</a> <a href="http://keleyi.com/keleyi/phtml/jui/dialog/1.htm">无动画</a> <a href="http://keleyi.com/keleyi/phtml/jui/dialog/2.htm">动画</a>
<a href="http://keleyi.com/keleyi/phtml/jui/dialog/3.htm">redmond</a>
<a href="http://keleyi.com/keleyi/phtml/jui/dialog/4.htm">sunny</a>
<br />点击按钮弹出对话框
</div>
<div id="dialog" title="div层对话框">
<p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
<p>柯乐义：这是一个弹出div层对话框，可用于显示信息。可以拖动和关闭这个弹出层，还可以改变它的大小。 </p>
</div>
</body>
</html>