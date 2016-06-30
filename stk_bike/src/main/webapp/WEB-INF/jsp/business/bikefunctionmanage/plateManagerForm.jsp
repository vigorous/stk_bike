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
</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="addCtxPath" />
	<div class="page-content">
		<form action="" id="form">
			<input type="hidden" name="APPLY_ORG_ID" value="">
			<input type="hidden" name="AUTH_ORG_ID" value="">
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>申请卡片单位：</span>
				</div>
				<div class="col-xs-6">
					<div class="col-xs-6 no-padding-left">
						<select class="form-control" name="APPLY_ORG_NAME" id="APPLY_ORG_NAME">
							<option value="">申请卡片单位</option>
							<c:forEach items="${policeList}" var="police">
								<option value="${police.APPLY_ORG_NAME}" data-id="${police.APPLY_ORG_ID}">${police.APPLY_ORG_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>发卡单位：</span>
				</div>
				<div class="col-xs-7">
					<input type="text" id="AUTH_ORG_NAME" name="AUTH_ORG_NAME"
						class="width-160" value="" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>申请时间：</span>
				</div>
				<div class="col-xs-7">
					<input class="form-control date-picker" type="text" id="APPLY_TIME" name="APPLY_TIME"
						class="width-160" value="" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>开始号码：</span>
				</div>
				<div class="col-xs-7">
					<input type="text" id="CARD_BEGIN_NO" name="CARD_BEGIN_NO"
						class="width-160" value="" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>结束号码：</span>
				</div>
				<div class="col-xs-7">
					<input type="text" id="CARD_END_NO" name="CARD_END_NO"
						class="width-160" value="" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>卡片数量：</span>
				</div>
				<div class="col-xs-7">
					<input type="text" id="APPLY_NUM" name="APPLY_NUM"
						class="width-160" value="" />
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>经办人ID：</span>
				</div>
				<div class="col-xs-6">
					<div class="col-xs-6 no-padding-left">
						<select class="form-control" name="manageID" id="manageID">
							<c:if test="${empty policeList}">
								<option>站务数据</option>
							</c:if>
							<c:forEach items="${policeList}" var="police">
								<option value="${police.POLICE_ID}" data-id="${police.AUTH_ORG_ID}">${police.POLICE_ID}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>经办人姓名：</span>
				</div>
				<div class="col-xs-7">
					<input type="text" id="POLICE_NAME" name="POLICE_NAME"
						class="width-160" value="" />
				</div>
			</div>
			<div class="clearfix form-actions" style="margin-top: 40px;">
				<div class="col-xs-offset-4 col-xs-3">
					<input onclick="save()" class="btn btn-info" id="add" type="button"
						value="保存" />
				</div>
				<div class="col-xs-3">
					<input class="btn" id="quit" type="button" value="退出" />
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/plateManager.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen({
			width : "100px"
		});
		
		$('.form-control.date-picker').datepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd'
		});
	</script>
</body>
</html>