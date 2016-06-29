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
	<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
	<title>车辆详细信息弹窗</title>
</head>
<body class="no-skin">
<input type="hidden" value="<%=basePath%>" id="ctxPath" >
	<div class="page-content">
	<div class="row">
	<form action="">
		<div class="dialog-header">
			<h1>车辆信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 电子牌照： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_EID" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">备案牌照： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_NO" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆类型： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
					<input type="text" id="brandName" name="BIKE_TYPE" class="width-160" value="" />
				</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆来源： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><td>
					<select class="form-control chosen-select" name="BIKE_SOURCE" data-placeholder="车辆来源">
						<option value="0">新车</option>
						<option value="1">旧车</option>
					</select>
				</td></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车身主色： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_COLOR" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆型号： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_MODEL" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆品牌： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
				<select class="form-control chosen-select" id="brandNo" name="BIKE_BRAND_NO" data-placeholder="车辆品牌">
						
					</select>
					</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆电机号： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BRAND_NAME" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车架号： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_SKELETON_NO" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="dialog-header row-margin-top">
			<h1>车主信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主姓名： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_NAME" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 性别： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
				<select class="form-control chosen-select" name="OWNER_SEX" data-placeholder="性别">
						<option value="00">男</option>
						<option value="01">女</option>
					</select>
				</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt"  for=""> 身份证： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_SFID" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 居住地属性： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
				<select class="form-control chosen-select" name="OWNER_ADDR_STATUS" data-placeholder="居住地属性">
						<option value="00">常住</option>
						<option value="01">短住</option>
				</select>
				</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系地址： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_ADDRESS" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主工作单位： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_COMPANY" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系电话： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_PHONE" class="width-160" value="" /></span>
			</div>
			
		</div>
		
		<div class="dialog-header row-margin-top">
			<h1>注册信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆登记时间： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
					<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-120" name="REGISTER_TIME" type="text" data-date-format="yyyy-mm-dd" placeholder="登记日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主身份证号： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="OWNER_SFID" class="width-160" value="" /></span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 电子牌照： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BIKE_ID" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人工号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">
					<select class="form-control chosen-select" name="POLICE_ID" data-placeholder="经办人工号">
						<option value="0">常住</option>
						<option value="1">短住</option>
					</select>
				</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人姓名： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="BRAND_NAME" class="width-160" value="" /></span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 发卡单位： </label>
				<span class="col-xs-6 no-padding-right dialog-text"><input type="text" id="brandName" name="POLICE_OFFICE_ID" class="width-160" value="" /></span>
			</div>
		</div>
		<div class="clearfix form-actions">
						<div class="col-xs-offset-4 col-xs-3"><input onclick="save()" class="btn btn-info" id="add" type="button" value="保存" /></div>
						<div class="col-xs-3"><input class="btn" id="quit" type="button" value="取消" /></div>
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
		<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/addBike.js"></script>
</body>
</html>