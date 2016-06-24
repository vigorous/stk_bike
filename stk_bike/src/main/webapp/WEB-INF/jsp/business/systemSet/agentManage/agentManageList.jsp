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
			.margin-left-30{margin-left: 30px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
					<form>
						<table>
							<tr>
								<td>
									<select class="form-control chosen-select" data-placeholder="经办人">
										<option value=""></option>
										<option value="">全部经办人</option>
										<option value="330411000010">330411000010</option>
									</select>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="col-xs-5 text-right">
					
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
						<thead>
							<tr>
								<th class="text-center" width="20%">经办人编号</th>
								<th class="text-center" width="20%">经办人姓名</th>
								<th class="text-center" width="20%">所属单位</th>
								<th class="text-center" width="20%">联系电话</th>
								<th class="text-center" width="20%">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
								<td>330411000010</td>
								<td>孙秀芬</td>
								<td>秀洲公安局</td>
								<td>13808191075</td>
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
					<div class="btn-group">
						<input type="button" class="btn btn-mini btn-success" value="新建" id="new" />
					</div>
					${page.getPageStr()}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/agentManage/agentManageList.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen();
		</script>
	</body>
</html>