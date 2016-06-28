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
<title>被盗车辆管理</title>
</head>
<body>
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;"><span class="input-icon"> <input autocomplete="off" id="nav-search-input" type="text"
						name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
						<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
				</span></td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">导出</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">下载.xls</button>
				</td>
				<td class="col-xs-4" style="padding: 0 5px;"><input type="file"
					id="id-input-file-2" /></td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">导入</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">筛选</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>案件号</th>
					<th>案件所属派出所</th>
					<th class="hidden-480">电子牌照</th>
					<th class="hidden-480">车主姓名</th>
					<th class="hidden-480">车主电话</th>
					<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>丢失时间</th>
					<th class="hidden-480">丢失地点</th>
					<th class="hidden-480">经办人</th>
					<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>车辆最后出现时间</th>
					<th class="hidden-480">状态</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td><a href="#">ace.com</a></td>
					<td>$45</td>
					<td>$45</td>
					<td class="hidden-480">3,330</td>
					<td>Feb 12</td>
					<td class="hidden-480"><span class="label label-sm label-warning">Expiring</span></td>
					<td>$45</td>
					<td>$45</td>
					<td>$45</td>
					<td>$45</td>
					<td>
						<div class="hidden-sm hidden-xs btn-group">
							<button class="btn btn-xs btn-danger">
								<i class="ace-icon fa fa-trash-o bigger-120"></i>
							</button>

							<button class="btn btn-xs btn-warning">
								<i class="ace-icon fa fa-flag bigger-120"></i>
							</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 尾部页数 -->
	<div class="col-xs-12">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td><div class="pagination"
							style="float: right; padding-top: 0px; margin-top: 0px;">
							<li><a>共<font color="red">7</font>条
							</a></li>
							<li><a>首页</a></li>
							<li><a>上页</a></li>
							<li><a><font color="#808080">1</font></a></li>
							<li><a>下页</a></li>
							<li><a>尾页</a></li>
							<li><a>第1页</a></li>
							<li><a>共1页</a></li>
						</div></td>

				</tr>
			</tbody>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/jsp/system/admin/bottom.jsp"%>
	<script>
		$('#id-input-file-1 , #id-input-file-2').ace_file_input({
			no_file:'No File ...',
			btn_choose:'Choose',
			btn_change:'Change',
			droppable:false,
			onchange:null,
			thumbnail:false //| true | large
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
		});
	</script>
</body>
</html>