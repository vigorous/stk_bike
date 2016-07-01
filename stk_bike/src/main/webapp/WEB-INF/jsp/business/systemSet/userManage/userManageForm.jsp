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

.color-red {
	color: red;
}

.btn-mini {
	padding: 4px 12px !important;
	line-height: 20px !important;
	border: 1px solid #ddd !important;
}
</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content padding-bottom-0">
		<form action="userManage/userManageForm" id="userForm">
			<input type="hidden" name="USER_ID"
				value="${userInfoVO.userVO.USER_ID}" />
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>用户名称</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160"
						value="${userInfoVO.userVO.USERNAME}" name="USERNAME" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>密码</span>
				</div>
				<div class="col-xs-7">
					<input type="password" class="width-160"
						value="${userInfoVO.userVO.PASSWORD}" name="PASSWORD" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>真实姓名</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160"
						value="${userInfoVO.userVO.NAME}" name="NAME" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
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
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
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

			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
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

			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>电话号码</span>
				</div>
				<div class="col-xs-7">
					<input type="tel" class="width-160"
						value="${userInfoVO.userVO.PHONE}" name="PHONE" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>身份证号</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160"
						value="${userInfoVO.userVO.SFID}" name="SFID" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>备注</span>
				</div>
				<div class="col-xs-7">
					<input type="text" class="width-160"
						value="${userInfoVO.userVO.NOTE}" name="NOTE" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-5 text-right"></div>
				<div class="col-xs-7 text-left">
					<div class="btn-group">
						<input type="button" class="btn btn-mini btn-success" value="保存"
							id="save" /> <input type="button"
							class="btn btn-mini btn-success" value="取消" id="cancel" />
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