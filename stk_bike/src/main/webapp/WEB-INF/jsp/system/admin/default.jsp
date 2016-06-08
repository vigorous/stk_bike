<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>
</head>
<body class="no-skin">
	<h5>${pd.name}</h5>
	<h5>${user.name}</h5>
	<h5>${user.password}</h5>
	
	<!-- /section:basics/sidebar -->
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">Other Pages</a>
							</li>
							<li class="active">Error 500</li>
						</ul><!-- /.breadcrumb -->

						<!-- #section:basics/content.searchbox -->
						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- #section:pages/error -->
								<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-random"></i>
												500
											</span>
											Something Went Wrong
										</h1>

										<hr />
										<h3 class="lighter smaller">
											But we are working
											<i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
											on it!
										</h3>

										<div class="space"></div>

										<div>
											<h4 class="lighter smaller">Meanwhile, try one of the following:</h4>

											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Read the faq
												</li>

												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Give us more info on how this specific error occurred!
												</li>
											</ul>
										</div>

										<hr />
										<div class="space"></div>

										<div class="center">
											<a href="javascript:history.back()" class="btn btn-grey">
												<i class="ace-icon fa fa-arrow-left"></i>
												Go Back
											</a>

											<a href="#" class="btn btn-primary">
												<i class="ace-icon fa fa-tachometer"></i>
												Dashboard
											</a>
										</div>
									</div>
								</div>

								<!-- /section:pages/error -->

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
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
</body>
</html>
