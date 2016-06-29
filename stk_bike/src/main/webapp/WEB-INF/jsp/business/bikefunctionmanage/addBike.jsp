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

<link rel="stylesheet" href="static/assets/css/chosen.css" />
<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />

<%@ include file="../../system/admin/top.jsp"%>
<title>车辆详细信息弹窗</title>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="ctxPath">
	<div class="dialog-content">
		<div class="dialog-header">
			<h1>车辆信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					电子牌照： </label> <input type="text" name="BIKE_EID" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					案件号： </label> <input type="text" name="BIKE_NO" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆类型： </label> <input type="text" name="BIKE_TYPE" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆来源： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" name="BIKE_SOURCE">
						<option value="01">旧车</option>
						<option value="00">新车</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车身主色： </label> <input type="text" value="" name="BIKE_COLOR" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆型号： </label> <input type="text" value="" name="BIKE_MODEL" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆品牌： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" name="BIKE_BRAND_NO" id="brandNo">

					</select>
				</div>
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆电机号： </label> <input type="text" value="" name="BRAND_NAME" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车架号： </label> <input type="text" value="" name="BIKE_SKELETON_NO" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆图片： </label> <span class="col-xs-6 no-padding-right dialog-text">18岁以下禁止观看</span>
			</div>
		</div>

		<div class="dialog-header row-margin-top">
			<h1>车主信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主姓名： </label> <input type="text" name="OWNER_NAME" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					性别： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" name="OWNER_SEX">
						<option value="00">男</option>
						<option value="01">女</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					身份证： </label> <input type="text" value="" name="OWNER_SFID" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					居住地属性： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" name="OWNER_ADDR_STATUS">
						<option value="01">常住</option>
						<option value="00">暂住</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主联系地址： </label> <input type="text" name="OWNER_ADDRESS" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主工作单位： </label> <input type="text" name="OWNER_COMPANY" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主联系电话： </label> <input type="text" value="" name="OWNER_PHONE" />
			</div>

		</div>

		<div class="dialog-header row-margin-top">
			<h1>注册信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆登记时间： </label> <input type="text" name="REGISTER_TIME" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主身份证号： </label> <input type="text" name="OWNER_SFID" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					电子牌照： </label> <input type="text" name="BIKE_ID" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					经办人姓名： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" name="POLICE_ID" id="adds">
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					发卡单位： </label> <input type="text" name="POLICE_OFFICE_ID" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-offset-4 col-xs-3">
				<input class="btn btn-sm btn-success" id="save" type="button"
					value="保存" />
			</div>
			<div class="col-xs-3">
				<input class="btn btn-sm btn-success" id="quit" type="button"
					value="退出" />
			</div>
		</div>

	</div>
	<script type="text/javascript"
		src="static/js/private_js/business/bikefunctionmanage/addBike.js"></script>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen();
	</script>
</body>
</html>