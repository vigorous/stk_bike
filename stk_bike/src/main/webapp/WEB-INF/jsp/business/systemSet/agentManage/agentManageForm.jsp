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
<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
<link rel="stylesheet"
	href="static/assets/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="static/assets/css/chosen.css" />

<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content ">
		<form action="">
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人编号</span>
				</div>
				<div class="col-xs-7">
					<input type="text" value="" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人姓名</span>
				</div>
				<div class="col-xs-7">
					<input type="text" value="" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人所属单位</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="所属单位">
						<option value=""></option>
						<option value="330411000000">秀洲公安局</option>
					</select>
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人联系电话</span>
				</div>
				<div class="col-xs-7">
					<input type="text" value="" />
				</div>
			</div>
			<div class="row row-margin-top">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input  class="btn btn-sm btn-success" id="save" type="button" value="保存" />
						</div>
						<div class="col-xs-3">
							<input class="btn btn-sm btn-success" id="cancle" type="button" value="退出" />
						</div>
					</div>
				</div>
		</form>
		<input type="hidden" value="${oper}" id="oper" />
	</div>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen({
			width : "160px"
		});
	</script>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript"
		src="static/js/private_js/business/systemSet/agentManage/agentManagerForm.js"></script>
</body>
</html>