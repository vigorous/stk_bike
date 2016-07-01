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
<style type="text/css">
.margin-bottom-10 {
	margin-bottom: 10px;
}

.padding-top-1 {
	padding-top: 1%;
}

.color-red {
	color: red;
}

.width-160 {
	width: 160px;
}

.padding-bottom-0 {
	padding-bottom: 0px !important;
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
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.USERNAME}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>密码</span>
				</div>
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.PASSWORD}</span>
				</div>


			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>真实姓名</span>
				</div>
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.NAME}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>角色名称</span>
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<c:forEach items="${roleVoList}" var="roleVo">
							<c:if test="${roleVo.ROLE_ID==userInfoVO.roleVo.ROLE_ID}">
							${roleVo.ROLE_NAME}
							</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>所属公安局</span>
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<c:forEach items="${policeList}" var="police">
						<c:if test="${police.POLICE_OFFICE_ID==userInfoVO.policeOfficeVO.POLICE_OFFICE_ID}">
							${police.POLICE_OFFICE_NAME}
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span class="color-red">*</span><span>状态</span>
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<c:choose>
						<c:when test="${userInfoVO.userVO.STATUS == 0}">
								冻结
							</c:when>
						<c:when test="${userInfoVO.userVO.STATUS == 1}">
								正常
							</c:when>
					</c:choose>
				</div>
			</div>

			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>电话号码</span>
				</div>
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.PHONE}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>身份证号</span>
				</div>
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.SFID}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>备注</span>
				</div>
				<div class="col-xs-7  padding-top-1">
					<span>${userInfoVO.userVO.NOTE}</span>
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
	<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript"
		src="static/js/private_js/business/systemSet/userManage/userManagerForm.js"></script>

</body>
</html>