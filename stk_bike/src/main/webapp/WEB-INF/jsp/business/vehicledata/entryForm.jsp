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
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
		<div class="row">
			<form action="">
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>布防名称：</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" style="width: 385px;" value="" />
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>添加布防机具：</span>
					</div>
					<div class="col-xs-4">
						<select class="form-control chosen-select" data-placeholder="查看所有单位">
							<option value=""></option>
							<option value="2222">2222</option>
						</select>
						
					</div>
					<div class="col-xs-4">
						<select class="form-control chosen-select" data-placeholder="请选择机具">
							<option value=""></option>
							<option value="333">333</option>
						</select>
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>布防机具：</span>
					</div>
					<div class="col-xs-7">
						<textarea style="width: 385px;" class="width-160"></textarea>
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-6">
						<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
					</div>
					<div class="col-xs-6">
						<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
					</div>
				</div>
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>电子车牌：</span>
					</div>
					<div class="col-xs-7">
						<input type="button" class="btn btn-sm btn-primary" id="addEid" value="添加">
					</div>
					<div class="col-xs-3" id="lisend" style="display: none;">
						
					</div>
				</div>
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>短信推送联系人：</span>
					</div>
					<div class="col-xs-7">
						<button class="btn btn-sm btn-primary">添加</button>
					</div>
				</div>
			</form>
			</div>
		</div>
		<script type="text/javascript" src="static/js/private_js/business/vehicledata/entryForm.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
		</script>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"160px"});
		</script>
	</body>
</html>