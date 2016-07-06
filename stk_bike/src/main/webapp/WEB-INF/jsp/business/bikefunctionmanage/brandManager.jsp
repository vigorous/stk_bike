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
	
	<title>品牌管理</title>
</head>
<body>
<input type="hidden" value="<%=basePath%>" id="ctxPath"/>
<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info" id="addBrand">添加品牌</button>
					</td>
					
					<td  class="col-padding-right">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info" id="selectBrand">查询</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
				<div class="col-xs-12">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
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
										<button onclick="modifyBrand('${brand.BRAND_ID}')" class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button onclick="deleteBrand('${brand.BRAND_ID}')" class="btn btn-xs btn-danger">
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
	</div>
</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/brandManager.js"></script>
</body>
</html>