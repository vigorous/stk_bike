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
		<!-- <style type="text/css">
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 100px;}
		</style> -->
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.min.css" />
	</head>
	<body class="no-skin">
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
								<select class="form-control" data-placeholder="查看所有单位">
									<option value="2222">2222</option>
								</select>
							</div>
							
							<div class="col-xs-6 no-padding-left">
								<select class="form-control" data-placeholder="请选择机具">
									<option value="333">333</option>
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
		<!-- <div class="page-content">
		<div class="row">
			<form action="">
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>布防名称：</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" style="width: 385px;" value="" />
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>添加布防机具：</span>
					</div>
					<div class="col-xs-4">
						<select class="form-control chosen-select" data-placeholder="查看所有单位">
							<option value=""></option>
							<option value="2222">2222</option>
						</select>
						
					</div>
					<div class="col-xs-4">
						<select class="form-control chosen-select" data-placeholder="请选择机具">
							<option value=""></option>
							<option value="333">333</option>
						</select>
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>布防机具：</span>
					</div>
					<div class="col-xs-7">
						<textarea style="width: 385px;" class="width-160"></textarea>
					</div>
				</div>
				<div  style="margin-top:40px;" class="row margin-bottom-10">
					<div class="col-xs-6">
						<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-160" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
					</div>
					<div class="col-xs-6">
						<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-160" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
					</div>
				</div>
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>电子车牌：</span>
					</div>
					<div class="col-xs-2">
						<input type="button" class="btn btn-sm btn-primary" id="addEid" value="添加">
					</div>
					<div class="col-xs-6" id="lisend" style="display: none;">
						
					</div>
				</div>
				<div style="margin-top:20px;" class="row margin-bottom-10">
					<div class="col-xs-4 text-right padding-top-1">
						<span>短信推送联系人：</span>
					</div>
					<div class="col-xs-2">
						<input type="button" class="btn btn-sm btn-primary" id="addMessage" value="添加">
					</div>
					<div class="col-xs-6" id="lisMessage" style="display: none;">
						
					</div>
				</div>
			</form>
			</div>
		</div> -->
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