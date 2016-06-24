<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path1 + "/";
%>
<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info"
				onclick="window.open('<%=basePath1%>/static/Ace_admin_1.3.4/index.html')">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<!-- #section:basics/sidebar.layout.shortcuts -->
			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>

			<!-- /section:basics/sidebar.layout.shortcuts -->
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<c:forEach items="${list}" var="menu" varStatus="varStatus">
				<c:choose>
					<c:when test="${menu.MENU_NAME == '首页'}">
						<li class="active">
							<a href="javascript:;" onclick="addTab('${menu.MENU_ID}','${menu.MENU_ID}','${menu.MENU_NAME}','${menu.MENU_URL}')">
								<i class="menu-icon fa ${menu.MENU_ICON}"></i>
								<span class="menu-text">${menu.MENU_NAME} </span>
							</a>
							<b class="arrow"></b>
						</li>
					</c:when>
					<c:otherwise>
						<li class="">
							<a href="#" class="dropdown-toggle">
								<i class="menu-icon fa ${menu.MENU_ICON}"></i>
								<span class="menu-text">${menu.MENU_NAME}</span>
								<b class="arrow fa fa-angle-down"></b>
							</a>
							<b class="arrow"></b>
							<ul class="submenu">
								<c:forEach items="${menu.subMenus}" var="menuItem">
										<li class="">
											<a href="javascript:;" onclick="addTab('${menuItem.MENU_ID}','${menuItem.MENU_ID}','${menuItem.MENU_NAME}','${menuItem.MENU_URL}')">
												<i class="menu-icon fa fa-caret-right"></i>
												${menuItem.MENU_NAME}
											</a>
											<b class="arrow"></b>
										</li>
								</c:forEach>
							</ul>
						</li>
					</c:otherwise>
				</c:choose>
		</c:forEach>
	</ul>
	
<!-- 	<ul class="nav nav-list">
		<li class="active"><a href="javascript:;" onclick="addTab('0001','','首页','survey/surveyList')"> <i
				class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
					首页 </span>
		</a> <b class="arrow"></b></li>

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-list"></i> <span class="menu-text">
					实时报警 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="javascript:;" onclick="addTab('0101','','实时报警','realAlarm/realAlarmList')"> <i
						class="menu-icon fa fa-caret-right"></i> 实时报警
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0102','','被盗车辆报警','stolenAlarm/stolenAlarmList')"> <i
						class="menu-icon fa fa-caret-right"></i> 被盗车辆报警
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0103','','布防车辆报警','bikeAlarm/bikeAlarmList')"> <i
						class="menu-icon fa fa-caret-right"></i> 布防车辆报警
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0104','','布防MAC报警','macAlarm/macAlarmList')"> <i
						class="menu-icon fa fa-caret-right"></i> 布防MAC报警
				</a> <b class="arrow"></b></li>
			</ul></li>

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text">
					车辆功能管理 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="javascript:;"
					onclick="addTab('3001','','车辆管理','bike/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 车辆管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;"
				onclick="addTab('3002','','品牌管理','brand/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 品牌管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;"
					onclick="addTab('3003','','被盗管理','stolen/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 被盗车辆管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;"
					onclick="addTab('3004','','电子车牌发卡管理','plate/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 电子车牌发卡管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;"
					onclick="addTab('3005','','低电量车辆管理','lowpower/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 低电量车辆管理
				</a> <b class="arrow"></b></li>

			</ul></li>

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
					车辆数据分析</span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="javascript:;"
					onclick="addTab('4001','','隐匿车辆查询','hidden/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 隐匿车辆查询
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4002','','异地车辆查询','remote/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 异地车辆查询
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4003','','同行车辆查询','peer/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 同行车辆查询
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4004','','车辆轨迹查询','guiji/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 车辆轨迹查询
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4005','','报警记录查询','police/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 报警记录查询
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4006','','布防设置','entry/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 布防设置
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="javascript:;"
					onclick="addTab('4007','','车流量统计','flow/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 车流量统计
				</a> <b class="arrow"></b></li>
				<li class=""><a href="javascript:;"
					onclick="addTab('4008','','嫌疑车辆分析','suspicion/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 嫌疑车辆分析
				</a> <b class="arrow"></b></li>
				<li class=""><a href="javascript:;"
					onclick="addTab('4009','','嫌疑车辆框选分析','frameSelection/select')"> <i
						class="menu-icon fa fa-caret-right"></i> 嫌疑车辆框选分析
				</a> <b class="arrow"></b></li>
			</ul></li>

		<li class="" id="tmlData">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-calendar"></i>

				<span class="menu-text">
					智能终端数据分析
				</span>
				
				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>
			
			<ul class="submenu">
				<li class="" id="5001">
					<a href="javascript:;" onclick="addTab('5001','tmlData','周边热点查询','system/tmlData/nearHotQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						周边热点查询
					</a>

					<b class="arrow"></b>
				</li>

				<li class="" id="5002">
					<a href="javascript:;" onclick="addTab('5002','tmlData','终端采集查询','system/tmlData/tmlSelectQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						终端采集查询
					</a>

					<b class="arrow"></b>
				</li>

				<li class="" id="5003">
					<a href="javascript:;" onclick="addTab('5003','tmlData','人流量统计','system/tmlData/humanTraffic')">
						<i class="menu-icon fa fa-caret-right"></i>
						人流量统计
					</a>

					<b class="arrow"></b>
				</li>

				<li class="" id="5004">
					<a href="javascript:;" onclick="addTab('5004','tmlData','虚拟身份查询','system/tmlData/virtualIdQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						虚拟身份查询
					</a>

					<b class="arrow"></b>
				</li>

				<li class="" id="5005">
					<a href="javascript:;" onclick="addTab('5005','tmlData','智能终端轨迹查询','system/tmlData/tmlTranceQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						智能终端轨迹查询
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5006">
					<a href="javascript:;" onclick="addTab('5006','tmlData','同行终端MAC查询','system/tmlData/togetherMacQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						同行终端MAC查询
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5007">
					<a href="javascript:;" onclick="addTab('5007','tmlData','MAC布防设置','system/tmlData/macProtect')">
						<i class="menu-icon fa fa-caret-right"></i>
						MAC布防设置
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5008">
					<a href="javascript:;" onclick="addTab('5008','tmlData','关系人分析查询','system/tmlData/relationsQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						关系人分析查询
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5009">
					<a href="javascript:;" onclick="addTab('5009','tmlData','终端关系数据查询','system/tmlData/tmlRelationQuery')">
						<i class="menu-icon fa fa-caret-right"></i>
						终端关系数据查询
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5010">
					<a href="javascript:;" onclick="addTab('5010','tmlData','RFID找同行终端MAC','system/tmlData/togetherByEplate')">
						<i class="menu-icon fa fa-caret-right"></i>
						RFID找同行终端MAC
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5011">
					<a href="javascript:;" onclick="addTab('5011','tmlData','终端MAC找同行RFID','system/tmlData/togetherByMac')">
						<i class="menu-icon fa fa-caret-right"></i>
						终端MAC找同行RFID
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5012">
					<a href="javascript:;" onclick="addTab('5012','tmlData','MAC落脚点分析','system/tmlData/macFootHold')">
						<i class="menu-icon fa fa-caret-right"></i>
						MAC落脚点分析
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5013">
					<a href="javascript:;" onclick="addTab('5013','tmlData','RFIDC落脚点分析','system/tmlData/rfidFootHold')">
						<i class="menu-icon fa fa-caret-right"></i>
						RFID落脚点分析
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="" id="5014">
					<a href="javascript:;" onclick="addTab('5014','tmlData','虚拟身份关联分析','system/tmlData/virtualIdAnalysis')">
						<i class="menu-icon fa fa-caret-right"></i>
						虚拟身份关联分析
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="">
					<a href="dropzone.html">
						<i class="menu-icon fa fa-caret-right"></i>
						嫌疑MAC分析
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="">
					<a href="javascript:;" onclick="addTab('5015','tmlData','电子车牌找同行终端MAC','macByEplate')">
						<i class="menu-icon fa fa-caret-right"></i>
						嫌疑MAC框选分析
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-picture-o"></i> <span class="menu-text">
					系统设置 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="javascript:;" onclick="addTab('0501','','区域管理','areaManage/areaManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 区域管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0502','','单位管理','unitManage/unitManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 单位管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0503','','角色管理','roleManage/roleManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 角色管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0504','','用户管理','userManage/userManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 用户管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0505','','经办人管理','agentManage/agentManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 经办人管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0506','','系统日志','systemLog/systemLogList')"> <i
						class="menu-icon fa fa-caret-right"></i> 系统日志
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;" onclick="addTab('0507','','公告管理','noticeManage/noticeManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 公告管理
				</a> <b class="arrow"></b></li>
			</ul></li>
		
		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-tag"></i> <span class="menu-text">
					设备管理 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
		
			<ul class="submenu">
				<li class=""><a href="javascript:;" onclick="addTab('0601','','RFID设备管理','rfidManage/rfidManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> RFID设备管理
				</a> <b class="arrow"></b></li>
				<li class=""><a href="javascript:;" onclick="addTab('0602','','MAC设备管理','macManage/macManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> MAC设备管理
				</a> <b class="arrow"></b></li>
				<li class=""><a href="javascript:;" onclick="addTab('0603','','场所管理','placeManage/placeManageList')"> <i
						class="menu-icon fa fa-caret-right"></i> 场所管理
				</a> <b class="arrow"></b></li>
			</ul></li>

		<li class=""><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-file-o"></i> <span class="menu-text">
					其他页面 #section:basics/sidebar.layout.badge <span
					class="badge badge-transparent tooltip-error"
					title="2 Important Events"> <i
						class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
				</span> /section:basics/sidebar.layout.badge
			</span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="javascript:;"
					onclick="addTab('1001','other','测试','test')"> <i
						class="menu-icon fa fa-caret-right"></i> 测试
				</a> <b class="arrow"></b></li>

				<li class=""><a href="javascript:;"
					onclick="addTab('1002','other','模块选择','change')"> <i
						class="menu-icon fa fa-caret-right"></i> 模块选择
				</a> <b class="arrow"></b></li>
			</ul></li>
	</ul> -->
	<!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
	<script src="static/js/private_js/admin/head.js"></script>
</div>

