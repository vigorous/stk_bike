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
			.padding-right-30{padding-right: 30px;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
					<form action="business/deviceManagement/placeManagement/placeManagementList">
						<table>
							<tr>
								<td class="padding-right-30"><input type="text" class="width-120" value="" placeholder="场所编码" /></td>
								<td><input type="text" class="width-120" value="" placeholder="场所名称" /></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="col-xs-5 text-right">
					<div class="btn-group">
						<input type="button" class="btn btn-primary" value="删除" />
						<input type="button" class="btn btn-primary" value="导出" />
						<input type="button" class="btn btn-primary" value="查询" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
						<thead>
							<tr>
								<th class="text-center" width="8.28%">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</th>
								<th class="text-center" width="14.28%">场所编码</th>
								<th class="text-center" width="17.28%">场所名称</th>
								<th class="text-center" width="17.28%">场所详细地址</th>
								<th class="text-center" width="14.28%">场所服务类型</th>
								<th class="text-center" width="14.28%">场所经营性质</th>
								<th class="text-center" width="14.28%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td>33041139000002</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>杭州逐旭智能科技有限公司</td>
								<td>公共服务场所</td>
								<td>非经营</td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
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