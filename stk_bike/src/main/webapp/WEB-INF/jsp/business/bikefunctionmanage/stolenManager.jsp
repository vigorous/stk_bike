<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<%@ include file="../../system/admin/top.jsp"%>

<title>被盗车辆管理</title>
</head>
<body>
	<input type="hidden" value="<%=basePath%>" id="ctxPath" />
	<div class="page-content">
		<!-- 主体查询条件部分 -->
		<div class="row">
			<div class="col-xs-12">
				<table style="border: 0">
					<tr>
						<td class="col-padding-right"><span class="input-icon">
								<input autocomplete="off" type="text" name="USERNAME"
								value="${pd.USERNAME }" id="LOST_BIKE_EID"
								placeholder="这里输入电子车牌" /> <i id="nav-search-icon"
								class="ace-icon fa fa-search nav-search-icon"></i>
						</span></td>
						<td class="col-padding-right">
							<button class="btn btn-sm btn-info" id="selectStolen">查询</button>
						</td>

						<td class="col-padding-right">
							<button class="btn btn-sm btn-info">导出</button>
						</td>

						<td class="col-padding-right">
							<button class="btn btn-sm btn-info">下载XLS文件</button>
						</td>

						<td class="col-xs-3 no-padding-left col-padding-right"><input
							type="file" id="id-input-file-2" /></td>

						<td class="col-padding-right">
							<button class="btn btn-sm btn-info">导入</button>
						</td>

						<td class="col-padding-right">
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
						<table id="simple-table"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>案件号</th>
									<th>案件所属派出所</th>
									<th class="hidden-480">电子牌照</th>
									<th class="hidden-480">车主姓名</th>
									<th class="hidden-480">车主电话</th>
									<th><i
										class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>丢失时间</th>
									<th class="hidden-480">丢失地点</th>
									<th class="hidden-480">经办人</th>
									<th><i
										class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>车辆最后出现时间</th>
									<th class="hidden-480">状态</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${empty stolenList}">
									<tr>
										<td colspan="11">暂无数据</td>
									</tr>
								</c:if>
								<c:forEach items="${stolenList}" var="stolen">
									<tr>
										<td>${stolen.lostBikeVO.LOST_BIKE_NO}</td>
										<td>${stolen.policeOfficeVO.POLICE_OFFICE_NAME}</td>
										<td>${stolen.lostBikeVO.LOST_BIKE_EID}</td>
										<td class="hidden-480">${stolen.ownerVO.OWNER_NAME}</td>
										<td>${stolen.ownerVO.OWNER_PHONE}</td>
										<td class="hidden-480"><span
											class="label label-sm label-warning"> <fmt:formatDate
													value="${stolen.lostBikeVO.LOST_BEGIN_TIME}"
													pattern="yyyy-MM-dd hh:mm:ss" />
										</span></td>
										<td>${stolen.lostBikeVO.LOST_ADDRESS}</td>
										<td>${stolen.policeVO.POLICE_NAME}</td>
										<td><fmt:formatDate
												value="${stolen.lostBikeVO.LOST_END_TIME}"
												pattern="yyyy-MM-dd hh:mm:ss" /></td>
										<c:if test="${stolen.lostBikeVO.STATUS=='00'}">
											<td>未寻回</td>
										</c:if>
										<c:if test="${stolen.lostBikeVO.STATUS=='01'}">
											<td>已寻回</td>
										</c:if>
										<td>
											<div class="hidden-sm hidden-xs btn-group">
												<button
													onclick="deleteStolen('${stolen.lostBikeVO.LOST_BIKE_ID}')"
													class="btn btn-xs btn-danger">
													<i class="ace-icon fa fa-trash-o bigger-120"></i>
												</button>
												<button class="btn btn-xs btn-warning">
													<i class="ace-icon fa fa-flag bigger-120"></i>
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

			<!-- 底部页码 -->
			<div class="col-xs-12"></div>
		</div>
	</div>
	<script src="static/js/private_js/admin/head.js"></script>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script type="text/javascript"
		src="static/js/private_js/business/bikefunctionmanage/stolenManger.js"></script>
	<script>
		$('#id-input-file-1 , #id-input-file-2').ace_file_input({
			no_file : '上传文件',
			btn_choose : 'Choose',
			btn_change : 'Change',
			droppable : false,
			onchange : null,
			thumbnail : false
		//| true | large
		//whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
		});
	</script>
</body>
</html>