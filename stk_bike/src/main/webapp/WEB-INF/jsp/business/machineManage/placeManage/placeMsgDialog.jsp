<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="static/assets/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
	
	<%@ include file="../../../system/admin/top.jsp"%>
	<title>场所详细信息弹窗</title>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="ctxPath">
	<div class="dialog-content">
		<form action="" id="form">
			<div class="dialog-header">
				<h1>场所详细信息：</h1>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">上网服务场所编码<span class="word-danger">*</span>： </label>
					<input type="text" id="" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">上网服务场所名称<span class="word-danger">*</span>： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
	
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所详细地址<span class="word-danger">*</span>： </label>
					<input type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经度： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
	
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所纬度： </label>
					<input type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所服务类型<span class="word-danger">*</span>： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
	
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经营性质<span class="word-danger">*</span>： </label>
					<input type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经营法人： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
	
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">法人有效证件类型： </label>
					<input type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">法人有效证件号码： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
			
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">联系方式： </label>
					<input type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">营业开始时间： </label>
					<input class="time-picker" type="text" name="" value="" />
				</div>
			</div>
			
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">营业结束时间： </label>
					<input class="time-picker" type="text" name="" value="" />
				</div>
	
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">厂商组织机构代码<span class="word-danger">*</span>： </label>
					<input type="text" name="" value="" />
				</div>
			</div>
	
			<div class="dialog-header row-margin-top">
				<h1>场所设备列表：</h1>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12">
							<table id="simple-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>设备编码</th>
										<th>设备IP</th>
										<th>设备状态</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>A4-FB-8D-02-3F-99</td>
										<td>192.168.1.124</td>
										<td>在线</td>
									</tr>
									<tr>
										<td>A4-FB-8D-02-3F-99</td>
										<td>192.168.1.124</td>
										<td>在线</td>
									</tr>
									<tr>
										<td>A4-FB-8D-02-3F-99</td>
										<td>192.168.1.124</td>
										<td>在线</td>
									</tr>
									<tr>
										<td>A4-FB-8D-02-3F-99</td>
										<td>192.168.1.124</td>
										<td>在线</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row row-margin-top">
				<div class="col-xs-offset-4 col-xs-3">
					<input onclick="save('${list.bikeVO.BIKE_ID }')"  class="btn btn-sm btn-success" type="button" value="保存" />
				</div>
				<div class="col-xs-3">
					<input class="btn btn-sm btn-success" id="quit" type="button" value="退出" />
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<%@ include file="../../../system/admin/bottom.jsp"%>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	$('.time-picker').timepicker({
		minuteStep: 1,
		secondStep: 5,
		showSeconds: true,
		showMeridian: false,
		disableFocus: true
	})
	</script>
</body>
</html>