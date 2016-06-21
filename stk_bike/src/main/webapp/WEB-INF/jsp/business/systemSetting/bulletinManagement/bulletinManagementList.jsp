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
			.margin-right-30{margin-right: 30px;}
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
								<th class="text-center" width="15%">公告标题</th>
								<th class="text-center" width="40%">公告内容</th>
								<th class="text-center" width="15%">发布人</th>
								<th class="text-center" width="15%">发布时间</th>
								<th class="text-center" width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
								<td>标题1</td>
								<td>内容家搜到发的发阿斯顿阿斯蒂芬啊sdfa</td>
								<td>系统管理员</td>
								<td>2016/5/25 上午10:59:06</td>
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
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
		</script>
	</body>
</html>