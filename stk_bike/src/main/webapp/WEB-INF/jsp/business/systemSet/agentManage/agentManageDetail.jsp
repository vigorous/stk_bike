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

</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content ">
		<form action="agentManage/agentManageForm" id="agentForm">
			<input type="hidden" name="POLICE_ID" value="${policeVO.POLICE_ID}" />
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人编号</span>
				</div>
				<div class="col-xs-7">
					<span>${policeVO.POLICE_NO}</span>
				</div>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>经办人姓名</span>
				</div>
				<div class="col-xs-7">
					<span>${policeVO.POLICE_NAME}</span>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>所属单位</span>
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<c:forEach items="${officeList}" var="policeOffice">
						<c:if
							test="${policeOffice.POLICE_OFFICE_NO==policeVO.POLICE_OFFICE_NO}">
							${policeOffice.POLICE_OFFICE_NAME}
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-5 text-right ">
					<span>联系电话</span>
				</div>
				<div class="col-xs-7">
					<span>${policeVO.POLICE_PHONE}</span>
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
		src="static/js/private_js/business/systemSet/agentManage/agentManageForm.js"></script>
</body>
</html>