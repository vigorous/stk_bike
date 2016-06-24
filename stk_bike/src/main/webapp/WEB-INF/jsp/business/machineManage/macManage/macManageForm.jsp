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
				<h2>采集设备信息：</h2>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>采集设备Mac：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>采集设备名称：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>采集设备地址：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>IP地址：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>采集设备经度：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>采集设备纬度：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>所属派出所：</span>
					</div>
					<div class="col-xs-4">
						<select class="form-control chosen-select" data-placeholder="请选择机具">
							<option value=""></option>
							<option value="333">333</option>
						</select>
					</div>
				</div>
				<h2>场所基础信息：</h2>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所编号：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所名称：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所地址：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所类型：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所经营类型：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>场所经营法人姓名：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>法人有效证件类型：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>法人有效证件号码：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>手机/座机号码：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>营业结束时间：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>营业开始时间：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>组织机构代码：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<h2>安全厂商信息：</h2>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>厂商名称：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>组织机构代码：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>厂商地址：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>厂商联系人：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
				<div style="margin-top:10px;" class="row margin-bottom-10">
					<div class="col-xs-3 text-right padding-top-1">
						<span>电话号码：</span>
					</div>
					<div class="col-xs-3">
						<input type="text"  value="" />
					</div>
					<div class="col-xs-3 text-right padding-top-1">
						<span>电子邮件地址：</span>
					</div>
					<div class="col-xs-3">
						<input type="text" value="" />
					</div>
				</div>
			</form>
			</div>
		</div>
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