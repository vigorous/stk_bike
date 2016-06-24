<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<%@ include file="top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理和智能终端数据分析模块选择</title>
<style>
	body,html{
		background: #108696 !important;
		font: 12px/1.5 "Microsoft YaHei";
	}
	
	input,textarea{
		font-family: "Microsoft YaHei";
	}
	
	.cgtit{
		width: 200px;
		height: 40px;
		line-height: 40px;
		font-size: 2em;
		text-align: center;
		color: #ffffff;
		position: absolute;
		top: 25%;
		left: 50%;
		margin-left: -100px;
	}
	
	.cgmenu{
		position: absolute;
		top: 50%;
		left: 50%;
		width: 500px;
		height: 200px;
		margin-left: -250px;
		margin-top: -100px;
	}
	
	#bike, #tml{
		width: 200px;
		height: 200px;
		line-height: 200px;
		float: left;
		text-align: center;
		font-size: 1.25em;
		color: #ffffff;
		margin: 0 25px;
		background: #2196F3 !important;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	function Alert(){
		window.location.href="main/01";
	}
	
	function openDialog(){
		window.location.href="main/02";
	}
</script>
</head>
<body>
	<div class="cgBg">
		<div class="cgtit">模块选择</div>
		<div class="cgmenu">
			<div id="bike" onclick="Alert();">车辆管理</div>
			<div id="tml" onclick="openDialog();">智能终端数据分析</div>
		</div>
	</div>
	<script src="static/js/jquery-1.9.1.min.js"></script>
	<script src="plugins/zDialog/zDialog.js"></script>
	<script src="plugins/zDialog/zDrag.js"></script>
</body>
</html>