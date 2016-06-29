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
							
							<a href="#" data-action="collapse" title="展开">
								<i class="ace-icon fa fa-plus"></i>
							</a>
							
							<a href="#" data-action="collapse" title="展开">
								<i class="ace-icon fa fa-chevron-up"></i>
							</a>
							
							<!-- <a href="#" data-action="close">
								<i class="ace-icon fa fa-times"></i>
							</a> -->
						</div>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="电子牌照" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="备案号牌" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆类型" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车身颜色" />
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆型号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆品牌" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆电机号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车架号" />
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主姓名" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主身份证号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主电话" />
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