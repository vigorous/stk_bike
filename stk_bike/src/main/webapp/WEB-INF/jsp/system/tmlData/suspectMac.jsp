<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/assets/css/jquery-ui.custom.css" />
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.css" />
		
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	<title>嫌疑MAC分析页面</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12 widget-container-col ui-sortable">
				<div class="widget-box collapsed ui-sortable-handle">
					<div class="widget-header">
						<h4 class="widget-title">MAC点位</h4>
						
						<div class="widget-toolbar">
							<button class="btn btn-minier btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button>
							
							<a href="javascript:;" data-action="collapse" title="添加">
								<i class="ace-icon fa fa-plus" data-icon-show="fa-plus" data-icon-hide="fa-minus"></i>
							</a>
							
							<a href="javascript:;" data-action="collapse" title="展开">
								<i class="ace-icon fa fa-chevron-down"></i>
							</a>
						</div>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<form>
								<div class="row">
									<div class="col-xs-6">
										<div class="col-xs-6 no-padding-left">
											<select class="form-control">
												<option value="old">旧车</option>
												<option value="new">新车</option>
												<option value="AL">Alabama</option>
												<option value="AK">Alaska</option>
												<option value="AZ">Arizona</option>
												<option value="AR">Arkansas</option>
												<option value="CA">California</option>
												<option value="CO">Colorado</option>
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
											</select>
										</div>
									
										<div class="col-xs-6 no-padding-right">
											<select class="form-control">
												<option value="old">旧车</option>
												<option value="new">新车</option>
												<option value="AL">Alabama</option>
												<option value="AK">Alaska</option>
												<option value="AZ">Arizona</option>
												<option value="AR">Arkansas</option>
												<option value="CA">California</option>
												<option value="CO">Colorado</option>
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
											</select>
										</div>
									</div>
									<div class="col-xs-3">
										<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="开始日期" />
									</div>
									<div class="col-xs-3">
										<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="结束日期" />
									</div>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div><!-- /.span -->
		</div>
	</div>
	
	<%@ include file="../../system/admin/bottom.jsp"%>
</body>
</html>