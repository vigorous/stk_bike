<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head lang="en">
		<base href="<%=basePath%>">
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px!important;}
			.width-120{width: 120px!important;}
			.margin-right-30{margin-right: 30px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
			.btn-mini{padding: 4px 12px!important;line-height: 20px!important;border: 1px solid #ddd!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5" id="noticeManageListTable">
						<thead>
							<tr>
								<th class="text-center" width="20%">公告标题</th>
								<th class="text-center" width="35%">公告内容</th>
								<th class="text-center" width="15%">发布人</th>
								<th class="text-center" width="15%">发布时间</th>
								<th class="text-center" width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5">暂无数据</td>
								</tr>
							</c:if>
							<c:forEach items="${list}" var="notice">
								<tr>
									<td>${notice.noticeVO.TITLE}</td>
									<td>${notice.noticeVO.CONTET}</td>
									<td>${notice.userVO.NAME}</td>
									<td><fmt:formatDate value="${notice.noticeVO.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-warning" name="detail" data-id="${area.DISTRICT_ID}">
												<i class="ace-icon fa fa-flag bigger-120"></i>
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
							</c:forEach>
						</tbody>
					</table>
					<div class="btn-group">
						<input type="button" class="btn btn-mini btn-success" value="新建" id="new" />
					</div>
					${page.pageStr}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/noticeManage/noticeManageList.js"></script>
	</body>
</html>