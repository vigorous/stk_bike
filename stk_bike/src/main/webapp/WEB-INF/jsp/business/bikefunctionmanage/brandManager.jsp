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
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
<title>品牌管理</title>
</head>
<body class="no-skin">
<div class="page-content padding-bottom-0">
	<div class="row">
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;">
					<button id="addBrand" class="btn btn-sm btn-primary">添加品牌</button>
				</td>
				<td style="padding: 0 5px;"><span class="input-icon"> <input
						autocomplete="off" id="nav-search-input" type="text"
						name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
						<i id="nav-search-icon"
						class="ace-icon fa fa-search nav-search-icon"></i>
				</span></td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>品牌序号</th>
					<th class="hidden-480">品牌名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty li}">
								<tr>
									<td colspan="3">暂无数据</td>
								</tr>
				</c:if>
				<c:forEach items="${li}" var="brand">
				<tr>
					<td>${brand.BRAND_NO }</td>

					<td class="hidden-480"><span>${brand.BRAND_NAME }</span></td>
				
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
				</c:forEach>
			</tbody>
		</table>
			${page.pageStr}
		</div>
	</div>
</div>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/brandManager.js"></script>
</body>
</html>