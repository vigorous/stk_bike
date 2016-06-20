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
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-left-30{margin-left: 30px;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
				</div>
				<div class="col-xs-5 text-right">
					<div class="btn-group">
						<input type="button" class="btn btn-primary" value="新建" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
						<thead>
							<tr>
								<th class="text-center" width="20%">用户名</th>
								<th class="text-center" width="20%">用户名称</th>
								<th class="text-center" width="20%">所在单位</th>
								<th class="text-center" width="20%">角色</th>
								<th class="text-center" width="20%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>wanglei</td>
								<td>王磊</td>
								<td>王店派出所</td>
								<td>1111</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
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
					${page.getPageStr()}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	</body>
</html>