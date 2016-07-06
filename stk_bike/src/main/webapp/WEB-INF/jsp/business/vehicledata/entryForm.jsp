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
		<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
		
		<%@ include file="../../system/admin/top.jsp"%>
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.min.css" />
		<title>创建新的布防弹窗</title>
	</head>
	<body class="no-skin">
		<input type="hidden" value="<%=basePath%>" id="ctxPath">
		<div class="dialog-content">
			<form action="" id="form">
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 布防名称： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="brandNo" name="BRAND_NO" value="${vo.BRAND_NO }" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 添加布防机具： </label>
						<div class="col-xs-6 no-padding-left">
							<div class="col-xs-6 no-padding-left">
								<select class="form-control" data-placeholder="查看所有单位" id="POLICE_OFFICE_NAME">
								</select>
							</div>
							
							<div class="col-xs-6 no-padding-left">
								<select class="form-control" data-placeholder="请选择机具" id="MACHINE_NAME">
								</select>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 布防机具： </label>
						<div class="col-xs-6 no-padding-left">
							<div class="col-xs-12 no-padding-left">
								<textarea class="col-xs-12 no-padding-left"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 开始时间： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="REGISTER_TIME" class="datetime-picker"  name="REGISTER_TIME" value="${list.registerVO.REGISTER_TIME }" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 结束时间： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="REGISTER_TIME" class="datetime-picker"  name="REGISTER_TIME" value="${list.registerVO.REGISTER_TIME }" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 添加电子车牌： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="button" class="btn btn-sm btn-info" id="addEid" value="添加">
							<input type="button" class="btn btn-sm btn-info" id="" value="全部删除">
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> </label>
						<div class="col-xs-6 no-padding-left" id="lisend" style="display: none;">
						
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> 添加短信推送联系人： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="button" class="btn btn-sm btn-info" id="addMessage" value="添加">
							<input type="button" class="btn btn-sm btn-info" id="" value="全部删除">
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-4 no-padding-right dialog-text text-rt" for=""> </label>
						<div class="col-xs-6 no-padding-left" id="lisMessage" style="display: none;">
						
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input onclick="save('${vo.BRAND_ID }')" class="btn btn-sm btn-success" id="add" type="button" value="保存" />
						</div>
						<div class="col-xs-3">
							<input class="btn btn-sm btn-success" id="quit" type="button" value="退出" />
						</div>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="static/js/private_js/business/vehicledata/entryForm.js"></script>
		<%@ include file="../../system/admin/bottom.jsp"%>
		<script type="text/javascript">
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