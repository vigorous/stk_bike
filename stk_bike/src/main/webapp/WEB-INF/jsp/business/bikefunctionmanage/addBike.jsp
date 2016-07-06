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
<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />

<%@ include file="../../system/admin/top.jsp"%>
<title>车辆详细信息弹窗</title>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="ctxPath">
	<div class="dialog-content">
	<form action="" id="form">
		<div class="dialog-header">
			<h1>车辆信息</h1>
		</div>
		<div class="row row-margin-top">
			<input type="hidden" value="${list.bikeVO.BIKE_ID }" name="BIKE_ID">
			<input type="hidden" value="${list.ownerVO.OWNER_ID }" name="OWNER_ID">
			<input type="hidden" value="${list.registerVO.REGISTER_ID }" name="REGISTER_ID">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					电子牌照<span style="color: red">*</span>： </label> <input type="text" id="BIKE_EID" name="BIKE_EID" value="${list.bikeVO.BIKE_EID }" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					案件号： </label> <input type="text" name="BIKE_NO" value="${list.bikeVO.BIKE_NO }" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆类型： </label>
					<div class="col-xs-6 no-padding-left">
					<select class="form-control" value="${list.bikeVO.BIKE_TYPE }" name="BIKE_TYPE">
						<option value="01">自行车</option>
						<option value="00">电动车</option>
						<option value="03">小轿车</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆来源： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" value="${list.bikeVO.BIKE_SOURCE }" name="BIKE_SOURCE">
						<option value="01">旧车</option>
						<option value="00">新车</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车身主色： </label> <input type="text"   value="${list.bikeVO.BIKE_COLOR }" name="BIKE_COLOR" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆型号： </label> <input type="text" value="${list.bikeVO.BIKE_MODEL }" name="BIKE_MODEL" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆品牌： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" value="${list.bikeVO.BIKE_BRAND_NO }" name="BIKE_BRAND_NO" id="brandNo">

					</select>
				</div>
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆电机号： </label> <input type="text" id="BIKE_MACHINE_NO" value="${list.bikeVO.BIKE_MACHINE_NO }" name="BIKE_MACHINE_NO" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车架号： </label> <input type="text" id="BIKE_SKELETON_NO" value="${list.bikeVO.BIKE_SKELETON_NO }" name="BIKE_SKELETON_NO" />
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
					车主姓名<span style="color: red">*</span>： </label> <input type="text" id="OWNER_NAME" name="OWNER_NAME" value="${list.ownerVO.OWNER_NAME }" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					性别： </label>
				<div class="col-xs-6 no-padding-left">
					<select ${list.ownerVO.OWNER_SEX } class="form-control" name="OWNER_SEX">
						<option value="00">男</option>
						<option value="01">女</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					身份证<span style="color: red">*</span>： </label> <input id="OWNER_SFID" type="text" value="${list.ownerVO.OWNER_SFID }"  name="OWNER_SFID" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					居住地属性： </label>
				<div class="col-xs-6 no-padding-left">
					<select class="form-control" value="${list.ownerVO.OWNER_ADDR_STATUS }" name="OWNER_ADDR_STATUS">
						<option value="01">常住</option>
						<option value="00">暂住</option>
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主联系地址<span style="color: red">*</span>： </label> <input id="OWNER_ADDRESS"  type="text" name="OWNER_ADDRESS" value="${list.ownerVO.OWNER_ADDRESS }" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主工作单位： </label> <input type="text" value="${list.ownerVO.OWNER_COMPANY }" name="OWNER_COMPANY" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主联系电话<span style="color: red">*</span>： </label> <input id="OWNER_PHONE" value="${list.ownerVO.OWNER_PHONE }" type="text"  name="OWNER_PHONE" />
			</div>

		</div>

		<div class="dialog-header row-margin-top">
			<h1>注册信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车辆登记时间<span style="color: red">*</span>： </label> <input type="text" id="REGISTER_TIME" class="datetime-picker"  name="REGISTER_TIME" value="${list.registerVO.REGISTER_TIME }" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					车主身份证号： </label> <input type="text" value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					电子牌照： </label> <input type="text" value="" />
			</div>

			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
					经办人姓名<span style="color: red">*</span>： </label>
				<div class="col-xs-6 no-padding-left">
					<select  class="form-control"  value="${list.registerVO.POLICE_ID }" name="POLICE_ID" id="POLICE_ID">
					</select>
				</div>
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
				<input type="hidden">
					发卡单位： </label> <input type="text" id="POLICE_OFFICE_ID"  value="" />
			</div>
		</div>

		<div class="row row-margin-top">
			<div class="col-xs-offset-4 col-xs-3">
				<input onclick="save('${list.bikeVO.BIKE_ID }')"  class="btn btn-sm btn-success" type="button" value="保存" />
			</div>
			<div class="col-xs-3">
				<input class="btn btn-sm btn-success" id="quit" type="button"
					value="退出" />
			</div>
		</div>
		</form>
	</div>
<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<%@ include file="../../system/admin/bottom.jsp"%>
	 <script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/addBike.js"></script>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen();
		
		$('.datetime-picker').datetimepicker({
	        language:  'zh-CN',
	        format: "yyyy-mm-dd hh:ii:ss",
	        startDate:'2000-01-01',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: 0,
	        minuteStep: 2
	    });
	</script>
</body>
</html>