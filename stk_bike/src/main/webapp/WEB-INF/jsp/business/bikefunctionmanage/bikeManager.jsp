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
	
	<title>车辆管理</title>
</head>
<body>
<input type="hidden" value="<%=basePath%>" id="ctxPath" />
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<button id="addbike" class="btn btn-sm btn-info">添加车辆</button>
					</td>
					<form action="import/impBike" method="post" enctype="multipart/form-data">
					<td  class="col-padding-right">
						<button  type="submit" class="btn btn-sm btn-info">导入</button>
					</td>
					
					<td  class="col-xs-5 no-padding-left col-padding-right">
						<input  type="file" name="file" />
					</td>
					</form>
					<td  class="col-padding-right">
						<button id="toDcExcel" class="btn btn-sm btn-info">导出</button>
					</td>
					
					<td  class="col-padding-right">
						<button id="download" class="btn btn-sm btn-info">下载ZIP包</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td class="col-padding-right">
						<input type="text" value="${bikeEid }" id="bikeEid" placeholder="电子牌照" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeNo }" id="bikeNo" placeholder="备案牌照" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeType }" id="bikeType" placeholder="车辆类型" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeName }" id="bikeName" placeholder="车主姓名" />
					</td>
					
					<td class="col-padding-right">
						<button id="selectBike" class="btn btn-sm btn-info">查询</button>
					</td>
					
					<td class="col-padding-right">
						<button class="btn btn-sm btn-info" id="bikeSelect">筛选</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 主体表格部分 -->
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
				<div class="col-xs-12">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>电子牌照</th>
								<th>备案牌照</th>
								<th class="hidden-480">车辆类型</th>
								<th class="hidden-480">车主姓名</th>
								<th class="hidden-480">车主电话</th>
								<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>登记时间</th>
								<th>操作</th>
							</tr>
						</thead>
			
						<tbody>
						<c:if test="${empty list}" >
							<tr>
								<td colspan="7">暂无数据</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="list">
							<tr ondblclick="bikeClick('${list.bikeVO.BIKE_ID}')">
								<td>${list.bikeVO.BIKE_EID }</td>
								<td>${list.bikeVO.BIKE_NO }</td>
								<td>${list.bikeVO.BIKE_TYPE }</td>
								<td class="hidden-480">${list.ownerVO.OWNER_NAME }</td>
								<td>${list.ownerVO.OWNER_PHONE }</td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">${list.registerVO.REGISTER_TIME }</span></td>
			
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<button class="btn btn-xs btn-success">
											<i class="ace-icon fa fa-check bigger-120"></i>
										</button>
			
										<button onclick="edit('${list.bikeVO.BIKE_ID}')" class="btn btn-xs btn-info">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
			
										<button onclick="deletes('${list.bikeVO.BIKE_ID}','${list.ownerVO.OWNER_ID }','${list.registerVO.REGISTER_ID }')" class="btn btn-xs btn-danger">
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
<script src="static/js/private_js/admin/head.js"></script>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script>
		$('.input-file').ace_file_input({
			no_file:'上传文件',
			btn_choose:'Choose',
			btn_change:'Change',
			droppable:false,
			/* onchange:null, */
			/* thumbnail:false  */
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
		});
	</script>
	<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/bikeManager.js"></script>
</body>
</html>