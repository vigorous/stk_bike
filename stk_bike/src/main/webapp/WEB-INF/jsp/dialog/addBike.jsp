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
	
	<link rel="stylesheet" href="static/assets/css/chosen.css" />
	<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
	
	<%@ include file="../system/admin/top.jsp"%>
	<title>车辆详细信息弹窗</title>
</head>
<body class="no-skin">
	<div class="dialog-content">
		<div class="dialog-header">
			<h1>车辆信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 电子牌照： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 案件号： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆类型： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆来源： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control">
						<option value="old">旧车</option>
						<option value="new">新车</option>
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="FL">Florida</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车身主色： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆型号： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆品牌： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control">
						<option value="xd">小刀</option>
						<option value="bwm">宝马</option>
						<option value="cnm">草泥马</option>
					</select>
				</div>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆电机号： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车架号： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆图片： </label>
				<span class="col-xs-6 no-padding-right dialog-text">18岁以下禁止观看</span>
			</div>
		</div>
		
		<div class="dialog-header row-margin-top">
			<h1>车主信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主姓名： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 性别： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control">
						<option value="male">男</option>
						<option value="female">女</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 身份证： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 居住地属性： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control">
						<option value="zz">暂住</option>
						<option value="cz">常住</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系地址： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主工作单位： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系电话： </label>
				<input type="text" value="" />
			</div>
			
		</div>
		
		<div class="dialog-header row-margin-top">
			<h1>注册信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 注册信息： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主身份证号： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 电子牌照： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人工号： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人姓名： </label>
				<input type="text" value="" />
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 发卡单位： </label>
				<input type="text" value="" />
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-offset-4 col-xs-3"><input class="btn btn-sm btn-success" id="save" type="button" value="保存" /></div>
			<div class="col-xs-3"><input class="btn btn-sm btn-success" id="quit" type="button" value="退出" /></div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen();
	</script>
</body>
</html>