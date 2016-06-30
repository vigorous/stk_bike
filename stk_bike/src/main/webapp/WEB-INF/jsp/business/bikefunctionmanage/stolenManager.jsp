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
	
	<title>被盗车辆管理</title>
</head>
<body>
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">查询</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">导出</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">下载XLS文件</button>
					</td>
					
					<td  class="col-xs-3 no-padding-left col-padding-right">
						<input  type="file" id="id-input-file-2" />
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">导入</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">车辆筛选</button>
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
								<th>案件号</th>
								<th>案件所属派出所</th>
								<th class="hidden-480">电子牌照</th>
								<th class="hidden-480">车主姓名</th>
								<th class="hidden-480">车主电话</th>
								<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>丢失时间</th>
								<th class="hidden-480">丢失地点</th>
								<th class="hidden-480">经办人</th>
								<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>车辆最后出现时间</th>
								<th class="hidden-480">状态</th>
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
								<td class="hidden-480"><span class="label label-sm label-warning">Expiring</span></td>
								<td>$45</td>
								<td>$45</td>
								<td>$45</td>
								<td>$45</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
			
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
</body>
</html>