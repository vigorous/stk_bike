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
	
	<title>低电量车辆管理</title>
</head>
<body>
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<button id="addPlate" class="btn btn-sm btn-info">通知</button>
					</td>
					
					<td  class="col-padding-right">
						<button id="addPlate" class="btn btn-sm btn-info">已通知车主</button>
					</td>
					
					<td  class="col-padding-right">
						<button id="addPlate" class="btn btn-sm btn-info">未通知车主</button>
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
								<th class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</th>
								<th>电子车牌</th>
								<th class="hidden-480">车主姓名</th>
								<th>身份证号妈</th>
								<th>联系电话</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>				
								</td>
								<td>$45</td>
								<td><a href="#">ace.com</a></td>
								<td>$45</td>
								<td class="hidden-480">3,330</td>
								<td>Feb 12</td>
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
</body>
</html>