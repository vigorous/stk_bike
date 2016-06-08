<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<!-- 头部CSS样式和JS引用 -->
    <base href="<%=basePath%>">
    
    <%@ include file="top.jsp" %>
</head>
<body class="no-skin">
	<!-- 页面顶部¨ -->
	<%@ include file="head.jsp"%>
	<div id="websocket_button"></div>
	<div class="main-container" id="main-container">
		<a href="#" id="menu-toggler"><span></span></a>
		<!-- menu toggler -->

		<!-- 左侧菜单 -->
		<%@ include file="left.jsp"%>

		<div id="main-content" class="main-content">

			<!-- <div id="jzts" style="display:none; width:100%; position:fixed; z-index:99999999;"> -->
			<!-- <div class="commitopacity" id="bkbgjz"></div>
			<div style="padding-left: 70%;padding-top: 1px;">
				<div style="float: left;margin-top: 3px;"><img src="static/images/loadingi.gif" /> </div>
				<div style="margin-top: 5px;"><h4 class="lighter block red">&nbsp;加载中 ...</h4></div>
			</div> -->
			<!-- </div> -->

			<div>
				<iframe name="mainFrame" id="mainFrame" frameborder="0" src="tab.do" style="margin:0 auto;width:100%;height:100%;"></iframe>
			</div>

			<!-- 换肤 -->
			<%-- <div id="ace-settings-container">
				<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
					<i class="icon-cog"></i>
				</div>
				<div id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hidden">
								<option data-class="default" value="#438EB9"
									<c:if test="${user.SKIN =='default' }">selected</c:if>>#438EB9</option>
								<option data-class="skin-1" value="#222A2D"
									<c:if test="${user.SKIN =='skin-1' }">selected</c:if>>#222A2D</option>
								<option data-class="skin-2" value="#C6487E"
									<c:if test="${user.SKIN =='skin-2' }">selected</c:if>>#C6487E</option>
								<option data-class="skin-3" value="#D0D0D0"
									<c:if test="${user.SKIN =='skin-3' }">selected</c:if>>#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>
					<div>
						<label><input type='checkbox' name='menusf' id="menusf"
							onclick="menusf();" /><span class="lbl" style="padding-top: 5px;">菜单缩放</span></label>
					</div>
				</div>
			</div> --%>
			<!--/#ace-settings-container-->

		</div>
		<!-- #main-content -->
	</div>
 	
 	<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="static/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="static/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="static/assets/js/jquery-ui.custom.js"></script>
		<script src="static/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="static/assets/js/jquery.easypiechart.js"></script>
		<script src="static/assets/js/jquery.sparkline.js"></script>
		<script src="static/assets/js/flot/jquery.flot.js"></script>
		<script src="static/assets/js/flot/jquery.flot.pie.js"></script>
		<script src="static/assets/js/flot/jquery.flot.resize.js"></script>

		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.scroller.js"></script>
		<script src="static/assets/js/ace/elements.colorpicker.js"></script>
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/elements.typeahead.js"></script>
		<script src="static/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="static/assets/js/ace/elements.spinner.js"></script>
		<script src="static/assets/js/ace/elements.treeview.js"></script>
		<script src="static/assets/js/ace/elements.wizard.js"></script>
		<script src="static/assets/js/ace/elements.aside.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<script src="static/assets/js/ace/ace.ajax-content.js"></script>
		<script src="static/assets/js/ace/ace.touch-drag.js"></script>
		<script src="static/assets/js/ace/ace.sidebar.js"></script>
		<script src="static/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="static/assets/js/ace/ace.widget-box.js"></script>
		<script src="static/assets/js/ace/ace.settings.js"></script>
		<script src="static/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="static/assets/js/ace/ace.settings-skin.js"></script>
		<script src="static/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="static/assets/js/ace/ace.searchbox-autocomplete.js"></script>
		
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/main.js"></script>
</body>
</html>