<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head lang="en">
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<style type="text/css">
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 160px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<form action="">
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>机具ID</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>安装位置</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>机具坐标</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>所属区域</span>
					</div>
					<div class="col-xs-7">
						<select class="form-control chosen-select" data-placeholder="所属区域">
							<option value=""></option>
							<option value="330503000001">南浔区</option>
						</select>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>所属单位</span>
					</div>
					<div class="col-xs-7">
						<select class="form-control chosen-select" data-placeholder="所属单位">
							<option value=""></option>
							<option value="330411000000">秀洲公安局</option>
						</select>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>实时监控</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>设备IP</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"160px"});
		</script>
	</body>
</html>