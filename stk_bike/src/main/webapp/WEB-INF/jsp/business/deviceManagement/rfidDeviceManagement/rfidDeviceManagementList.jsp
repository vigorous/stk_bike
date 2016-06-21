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
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-right-30{margin-right: 30px;}
			.padding-right-30{padding-right: 30px;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
					<form action="business/deviceManagement/rfidDeviceManagement/rfidDeviceManagementList">
						<table>
							<tr>
								<td><input type="text" class="width-120 margin-right-30" value="" placeholder="关键字" /></td>
								<td class="padding-right-30">
									<select class="form-control chosen-select" data-placeholder="所属单位">
										<option value=""></option>
										<option value="">全部单位</option>
										<option value="330411000000">秀洲公安局</option>
										<option value="330411010000">新城街道派出所</option>
									</select>
								</td>
								<td>
									<select class="form-control chosen-select" data-placeholder="在线状态">
										<option value=""></option>
										<option value="">全部状态</option>
										<option value="1">在线</option>
										<option value="2">离线</option>
									</select>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="col-xs-5 text-right">
					<div class="btn-group">
						<input type="button" class="btn btn-primary" value="设备日志" id="deviceLog" />
						<input type="button" class="btn btn-primary" value="点位分布" id="pointDistribution" />
						<input type="button" class="btn btn-primary" value="查询" />
						<input type="button" class="btn btn-primary" value="新建" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
						<thead>
							<tr>
								<th class="text-center" width="12.5%">机具ID</th>
								<th class="text-center" width="12.5%">安装位置</th>
								<th class="text-center" width="12.5%">设备IP</th>
								<th class="text-center" width="12.5%">所属区域</th>
								<th class="text-center" width="12.5%">所属单位</th>
								<th class="text-center" width="12.5%">实时监控</th>
								<th class="text-center" width="12.5%">在线状态</th>
								<th class="text-center" width="12.5%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
								<td>1</td>
								<td>吴越路（秀洲公安分局西门段） </td>
								<td>192.168.1.19</td>
								<td>秀洲区</td>
								<td>新城街道派出所</td>
								<td>开</td>
								<td>在线</td>
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
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
			$('.chosen-select').chosen();
			$("#deviceLog").off().click(function(){
				addTab('0604','设备日志','business/deviceManagement/rfidDeviceManagement/deviceLogList');
			});
			$("#pointDistribution").off().click(function(){
				addTab('0605','点位分布','business/deviceManagement/rfidDeviceManagement/pointDistributionDetail');
			});
		</script>
	</body>
</html>