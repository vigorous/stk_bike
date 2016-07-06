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
	<style type="text/css">
		.color-red{color: red;}
	</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content ">
		<form action="userManage/userManageForm" id="userForm">
			<input type="hidden" name="USER_ID"
				value="${userInfoVO.userVO.USER_ID}" />
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>用户名称</span>
				</div>
				<div class="col-xs-7">
					<input type="text" 
					    value="${userInfoVO.userVO.USERNAME}" name="USERNAME" <c:if test="${oper == 'edit'}">readonly="readonly"</c:if> />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>密码</span>
				</div>
				<div class="col-xs-7">
					<input type="password" 
						value="${userInfoVO.userVO.PASSWORD}" name="PASSWORD" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>真实姓名</span>
				</div>
				<div class="col-xs-7">
					<input type="text" 
						value="${userInfoVO.userVO.NAME}" name="NAME" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>角色名称</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="角色名称"
						name="ROLE_ID">
						<option value=""></option>
						<c:forEach items="${roleVoList}" var="roleVo">
							<option value="${roleVo.ROLE_ID}"
								<c:if test="${roleVo.ROLE_ID==userInfoVO.roleVo.ROLE_ID}">selected="selected"</c:if>>${roleVo.ROLE_NAME}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>所属公安局</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="公安局名称"
						name="POLICE_OFFICE_ID">
						<option value=""></option>
						<c:forEach items="${policeList}" var="police">
							<option value="${police.POLICE_OFFICE_ID}"
								<c:if test="${police.POLICE_OFFICE_ID==userInfoVO.policeOfficeVO.POLICE_OFFICE_ID}">selected="selected"</c:if>>${police.POLICE_OFFICE_NAME}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span class="color-red">*</span><span>状态</span>
				</div>
				<div class="col-xs-7">
					<select class="form-control chosen-select" data-placeholder="角色状态"
						name="STATUS">
						<option value="1"
							<c:if test="${userInfoVO.userVO.STATUS==1}">selected="selected"</c:if>>正常</option>
						<option value="0"
							<c:if test="${userInfoVO.userVO.STATUS==0}">selected="selected"</c:if>>冻结</option>

					</select>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>电话号码</span>
				</div>
				<div class="col-xs-7">
					<input type="tel" 
						value="${userInfoVO.userVO.PHONE}" name="PHONE" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>身份证号</span>
				</div>
				<div class="col-xs-7">
					<input type="text" 
						value="${userInfoVO.userVO.SFID}" name="SFID" />
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>备注</span>
				</div>
				<div class="col-xs-7">
					<input type="text" 
						value="${userInfoVO.userVO.NOTE}" name="NOTE" />
				</div>
			</div>
			<div class="row row-margin-top">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input  class="btn btn-sm btn-success" id="save" type="button" value="保存" />
						</div>
						<div class="col-xs-3">
							<input class="btn btn-sm btn-success" id="cancel" type="button" value="退出" />
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
		src="static/js/private_js/business/systemSet/userManage/userManagerForm.js"></script>
</body>
</html>