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
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.css" />
		
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	<title>终端轨迹查询页面</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<table style="border:0;">
					<tr>
						<td class="col-padding-right">
							<span class="input-icon">
								<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
								<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</td>
						
						<td class="col-padding-right">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="开始日期" />
						</td>
						
						<td class="col-padding-right">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="结束日期" />
						</td>
						
						<td class="col-padding-right"><button class="btn btn-sm btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button></td>
						
						<td class="col-padding-right"><button class="btn btn-sm btn-info" onclick="toMap();"  title="查看地图">查看地图</button></td>
						
					</tr>
				</table>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12">
						<table id="simple-table" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>采集设备MAC</th>
									<th>采集地址</th>
									<th>上线时间</th>
									<th>下线时间</th>
									<th>采集次数</th>
								</tr>
							</thead>
		
							<tbody>
								<tr>
		
									<td>
										<a href="#">ace.com</a>
									</td>
									<td>$45</td>
									<td class="hidden-480">3,330</td>
									<td>Feb 12</td>
									<td></td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">base.com</a>
									</td>
									<td>$35</td>
									<td class="hidden-480">2,595</td>
									<td>Feb 18</td>
									<td></td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">max.com</a>
									</td>
									<td>$60</td>
									<td class="hidden-480">4,400</td>
									<td>Mar 11</td>
									<td></td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">best.com</a>
									</td>
									<td>$75</td>
									<td class="hidden-480">6,500</td>
									<td>Apr 03</td>
									<td></td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">pro.com</a>
									</td>
									<td>$55</td>
									<td class="hidden-480">4,250</td>
									<td>Jan 21</td>
									<td></td>
		
								</tr>
							</tbody>
						</table>
					</div><!-- /.span -->
				</div>
			</div>
		</div>
	</div>
		
	<%@ include file="../admin/bottom.jsp"%>
		
	<script type="text/javascript">
		//datepicker plugin
		$('.date-picker').datepicker({
			language: 'zh-CN',
			format: "yyyy-mm-dd",
			autoclose: true,
			todayHighlight: true
		})
		//show datepicker when clicking on the icon
		.next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	</script>
</body>
</html>