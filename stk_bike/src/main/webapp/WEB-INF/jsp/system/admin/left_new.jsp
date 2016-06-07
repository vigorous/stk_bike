<%@ page pageEncoding="UTF-8"%>
<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts">

					<div id="sidebar-shortcuts-large">

						<button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>

						<button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_new');"><i class="icon-eye-open"></i></button>

						<button class="btn btn-small btn-warning" title="数据字典" id="adminzidian" onclick="zidian();"><i class="icon-book"></i></button>
						
						<button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button>
						
					</div>

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<li class="active" id="index">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-home"></i>
							<span>首页</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="" class="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>概况</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>实时报警</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>被盗车辆报警</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>布防车辆报警</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>布防MAC报警</a>
							</li>
				  	 	</ul>
					</li>
					
					<li class="" id="bike-gn">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-road"></i>
							<span>车辆功能管理</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>车辆管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>品牌管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>被盗车辆管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>电子车牌发卡管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>低电量车辆管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>车辆查询</a>
							</li>
				  	 	</ul>
					</li>
					
					<li class="" id="bike-data">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-align-left"></i>
							<span>车辆数据分析</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>车辆数据查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>隐匿车辆查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>异地车辆查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>同行车辆查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>车辆轨迹查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>报警记录查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>布防设置</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>嫌疑车辆分析</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>嫌疑车辆框选分析</a>
							</li>
				  	 	</ul>
					</li>
					
					<li class="" id="tml-data">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-camera"></i>
							<span>智能终端数据分析</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>周边热点查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>终端采集查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>人流量统计</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>虚拟身份查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>智能终端轨迹查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>MAC同行</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>MAC布防设置</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>关系人分析查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>终端关系数据查询</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>电子车牌找同行</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>MAC找同行</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>MAC落脚点分析</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>RFID落脚点分析</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>嫌疑MAC分析</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>嫌疑MAC框选分析</a>
							</li>
				  	 	</ul>
					</li>
					
					<li class="" id="setting">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-cog"></i>
							<span>系统设置</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>区域管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>单位管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>角色管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>用户管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>经办人管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>系统日志</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>公告管理</a>
							</li>
				  	 	</ul>
					</li>
					
					<li class="" id="equip-mana">
						<a style="cursor:pointer;" class="dropdown-toggle" >
							<i class="icon-desktop"></i>
							<span>设备管理</span>
							<b class="arrow icon-angle-down"></b>
						</a>
					  	<ul class="submenu">
							<li id="">
								<a style="cursor:pointer;" target="mainFrame"><i class="icon-double-angle-right"></i>RFID设备管理</a>
							</li>
							
							<li id="">
								<a style="cursor:pointer;" target="mainFrame" onclick="addTab('1001','test','test')"><i class="icon-double-angle-right"></i>MAC设备管理</a>
							</li>
				  	 	</ul>
					</li>					

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->
