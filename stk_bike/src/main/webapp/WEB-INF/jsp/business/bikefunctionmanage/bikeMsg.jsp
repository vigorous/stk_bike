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
		<%@ include file="../../system/admin/top.jsp"%>
	<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
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
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_EID }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 案件号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_NO }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆类型： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_TYPE }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆来源： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_SOURCE }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车身主色： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_COLOR }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆型号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_MODEL }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆品牌： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_BRAND_NO }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车辆电机号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_MACHINE_NO }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车架号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.bikeVO.BIKE_SKELETON_NO }</span>
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
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_NAME }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 性别： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_SEX }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 身份证： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_SFID }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 居住地属性： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_ADDR_STATUS }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系地址： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_ADDRESS }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主工作单位： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_COMPANY }</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主联系电话： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.ownerVO.OWNER_PHONE }</span>
			</div>
			
		</div>
		
		<div class="dialog-header row-margin-top">
			<h1>注册信息</h1>
		</div>
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 注册信息： </label>
				<span class="col-xs-6 no-padding-right dialog-text">${list.registerVO.REGISTER_TIME }</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 车主身份证号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">362425199302111103</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 电子牌照： </label>
				<span class="col-xs-6 no-padding-right dialog-text">362425199</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人工号： </label>
				<span class="col-xs-6 no-padding-right dialog-text">3838438</span>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 经办人姓名： </label>
				<span class="col-xs-6 no-padding-right dialog-text">王尼玛</span>
			</div>
			
			<div class="col-xs-6">
				<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 发卡单位： </label>
				<span class="col-xs-6 no-padding-right dialog-text">丁兰派出所</span>
			</div>
		</div>
	</div>
</body>
</html>