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
	<title>同行车辆查询</title>
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
					
					<td class="col-padding-right">
						<input type="text" value="" placeholder="同行点位时间" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="" placeholder="同行点位数量" />
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
								<th>经过机具数量</th>
								<th class="hidden-480">机具号</th>
								<th>时间</th>
								<th>详细信息</th>
							</tr>
						</thead>
			
						<tbody>
							<tr>
								<td><a href="#">南浔区公安局</a></td>
								<td><a href="#"> </a></td>
								<td>2016-06-15 13:19:32</td>
								<td>1</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-warning">
											<i class="ace-icon fa fa-flag bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- 底部页码 -->
		<div class="col-xs-12">
		
		</div>
	</div>
</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script type="text/javascript">
		$('.form-control.date-picker').datepicker({language: 'zh-CN'});
	</script>
</body>
</html>