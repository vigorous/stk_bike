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
	
	<title>车辆管理</title>
</head>
<body>
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<button id="addbike" class="btn btn-sm btn-info">添加车辆</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">导入</button>
					</td>
					
					<td  class="col-xs-5 no-padding-left col-padding-right">
						<input  type="file" id="id-input-file-2" />
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">导出</button>
					</td>
					
					<td  class="col-padding-right">
						<button id="download" class="btn btn-sm btn-info">下载ZIP包</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td class="col-padding-right">
						<input type="text" value="" placeholder="电子牌照" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="" placeholder="备案牌照" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="" placeholder="车辆类型" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="" placeholder="车主姓名" />
					</td>
					
					<td class="col-padding-right">
						<button class="btn btn-sm btn-info">查询</button>
					</td>
					
					<td class="col-padding-right">
						<button class="btn btn-sm btn-info" id="bikeSelect">筛选</button>
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
								<th>备案牌照</th>
								<th class="hidden-480">车辆类型</th>
								<th class="hidden-480">车主姓名</th>
								<th class="hidden-480">车主电话</th>
								<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>登记时间</th>
								<th>操作</th>
							</tr>
						</thead>
			
						<tbody>
							<tr>
								<td><a href="#">ace.com</a></td>
								<td>$45</td>
								<td>$45</td>
								<td class="hidden-480">3,330</td>
								<td>Feb 12</td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">Expiring</span></td>
			
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-success">
											<i class="ace-icon fa fa-check bigger-120"></i>
										</button>
			
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
			
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
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
	<script>
		$('#id-input-file-1 , #id-input-file-2').ace_file_input({
			no_file:'上传文件',
			btn_choose:'Choose',
			btn_change:'Change',
			droppable:false,
			onchange:null,
			thumbnail:false //| true | large
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
		});
	</script>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/bikeManager.js"></script>
</body>
</html>