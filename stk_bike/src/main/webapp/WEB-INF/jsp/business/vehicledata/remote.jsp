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
	<%@ include file="../../system/admin/top.jsp"%>
	<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
	
	<title>异地车辆查询</title>
</head>
<body>
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<div class="input-group margin-right-30">
							<input class="form-control date-picker text-center" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
							<span class="input-group-addon border-left-0">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</td>
					
					<td  class="col-padding-right">
						<div class="input-group">
							<input class="form-control date-picker text-center" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
						</div>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">查询</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 主体表格部分 -->
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<div class="row">
				<div class="col-xs-12">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>电子牌照</th>
								<th>区域</th>
								<th class="hidden-480">时间</th>
								<th>所属派出所</th>
								<th>机具ID</th>
								<th>安装位置</th>
							</tr>
						</thead>
			
						<tbody>
							<tr>
								<td><a href="#">南浔区公安局</a></td>
								<td><a href="#"> </a></td>
								<td>2016-06-15 13:19:32</td>
								<td>1</td>
								<td>1</td>
								<td>100</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script type="text/javascript">
		$('.form-control.date-picker').datepicker({language: 'zh-CN'});
	</script>
</body>
</html>