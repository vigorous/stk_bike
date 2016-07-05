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
	
	<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.min.css" />
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="addCtxPath" />
	<div class="dialog-content">
		<form action="" id="form">
			<input type="hidden" name="APPLY_ORG_ID" value=""> <input
				type="hidden" name="AUTH_ORG_ID" value="">
			<div class="row">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">申请卡片单位：</label>
					<div class="col-xs-6 no-padding-left">
						<div class="col-xs-8 no-padding-left">
							<select class="form-control" name="APPLY_ORG_NAME"
								id="APPLY_ORG_NAME">
								<option value="">申请卡片单位</option>
								<c:forEach items="${policeList}" var="police">
									<option value="${police.APPLY_ORG_NAME}"
										data-id="${police.APPLY_ORG_ID}">${police.APPLY_ORG_NAME}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						发卡单位： </label>
					<div class="col-xs-6 no-padding-left">
						<input type="text" id="AUTH_ORG_NAME" name="AUTH_ORG_NAME"
							value="" />
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						申请时间： </label>
					<div class="col-xs-6 no-padding-left">
						<div class="col-xs-8 no-padding-left">
							<input class="form-control datetime-picker" type="text"
								id="APPLY_TIME" name="APPLY_TIME" value="" />
						</div>
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						开始号码： </label>
					<div class="col-xs-6 no-padding-left">
						<input type="text" id="CARD_BEGIN_NO" name="CARD_BEGIN_NO"
							value="" />
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						结束号码： </label>
					<div class="col-xs-6 no-padding-left">
						<input type="text" id="CARD_END_NO" name="CARD_END_NO" value="" />
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						卡片数量： </label>
					<div class="col-xs-6 no-padding-left">
						<input type="text" id="APPLY_NUM" name="APPLY_NUM" value="" />
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						经办人ID： </label>
					<div class="col-xs-6 no-padding-left">
						<div class="col-xs-8 no-padding-left">
							<select class="form-control col-xs-8" name="POLICE_ID"
								id="POLICE_ID">
								<c:if test="${empty policeList}">
									<option>站务数据</option>
								</c:if>
								<c:forEach items="${policeList}" var="police">
									<option value="${police.POLICE_ID}"
										data-id="${police.AUTH_ORG_ID}">${police.POLICE_ID}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">
						经办人姓名： </label>
					<div class="col-xs-6 no-padding-left">
						<input type="text" id="POLICE_NAME" name="POLICE_NAME" value="" />
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-12">
					<div class="col-xs-offset-4 col-xs-3">
						<input onclick="save()" class="btn btn-sm btn-success" id="add"
							type="button" value="保存" />
					</div>
					<div class="col-xs-3">
						<input class="btn btn-sm btn-success" id="close" type="button"
							value="退出" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script type="text/javascript"
		src="static/js/private_js/business/bikefunctionmanage/plateManager.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$('.chosen-select').chosen({
			width : "100px"
		});

		$('.datetime-picker').datetimepicker({
			language : 'zh-CN',
			format : "yyyy-mm-dd hh:ii:00",
			startDate : '2000-01-01',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 0,
			minuteStep : 2
		});
	</script>
</body>
</html>