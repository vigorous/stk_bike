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
<link rel="stylesheet"
	href="static/assets/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="static/assets/css/chosen.css" />
<style type="text/css">
.margin-bottom-10 {
	margin-bottom: 10px;
}

.padding-top-1 {
	padding-top: 1%;
}

.width-160 {
	width: 160px;
}

.padding-bottom-0 {
	padding-bottom: 0px !important;
}
.color-red{color: red;}
</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content padding-bottom-0">
		<form action="">
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>用户名称</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160" value="" name="USERNAME" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>密码</span>
				</div>
				<div class="col-xs-7">
					<input type="password" class="width-160" value="" name="PASSWORD" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>真实姓名</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160" value="" name="NAME" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>角色名称</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="用户角色" name="ROLE_NAME">
						<option value=""></option>
						<option value="2">管理员</option>
					</select>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>状态</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="角色状态" name="STATUS">
						<option value="2">正常</option>
						<option value="2">冻结</option>
					</select>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>电话号码</span>
				</div>
				<div class="col-xs-7">
					<input type="tel" class="width-160" value="" name="PHONE" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>身份证号</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160" value="" name="SFID" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>备注</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160" value="" name="NOTE" />
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen({
			width : "160px"
		});
	</script>
</body>
</html>