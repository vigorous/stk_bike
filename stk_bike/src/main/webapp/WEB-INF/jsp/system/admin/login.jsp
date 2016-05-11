<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<%-- <base href="<%=basePath%>"> --%>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/common_css/global.css"/>
    <link rel="stylesheet" href="static/css/private_css/loginIndex.css"/>
    <title>城市车辆智能防控系统登录</title>
    <script type="text/javascript">
    	function login(){
    		if(loginValidate()){
    			var name = $("#name").val();
				var password = $("#password").val();
				alert("name = "+name+",password = "+password);
				$.ajax({
					type: "POST",
					url: 'login',
			    	data: {name:name,password:password},
					dataType:'json',
					cache: false,
					success: function(data){
						alert(data.result);
						if("success" == data.result){
							//saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#name").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#name").focus();
						}else{
							$("#name").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#name").focus();
						}
					},
					error : function() {  
			           // view("异常！");  
			           alert("异常！");  
			      	}  
				});
    		}
    	}
    	
    	function loginValidate(){
    		
    		if($("#name").val() == ""){
    			$("#name").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
    			$("#name").focus();
    			//alert("用户名不得为空");
    			return false;
    		}else{
    			$("#name").val(jQuery.trim($('#name').val()));
    		}
    		if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				//alert("密码不得为空");
				$("#password").focus();
				return false;
			}
    		return true;
    	}
    	
    	/* function savePaw() {
			$.cookie('name', '', {
				expires : -1
			});
			$.cookie('password', '', {
				expires : -1
			});
			$("#name").val('');
			$("#password").val('');
		} */
    </script>
    <script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
</head>
<body>
    <div class="login-main">
        <!--LOGO部分-->
        <img src="static/imgs/bg.jpg" class="login-bg" alt=""/>
        <!--登录主体部分-->
        <div class="login-box-wrap">
            <div class="static-form">
                <div class="login-box">
                    <div class="login-title">
                        <div class="login-logo">
                            <img src="static/imgs/jh.png" alt=""/>
                        </div>
                        <div class="login-title1">车管家</div>
                        <div class="login-title2">城市车辆智能防控系统</div>
                    </div>
                </div>
                <form action="" method="post">
                    <div class="field username-field">
                        <label for="login-user">用户名：</label>
                        <input type="text" id="name" name="name" class="login-text"/>
                    </div>
                    <div class="field pwd-field">
                        <label for="login-pwd">密码：</label>
                        <input type="password" id="password" name="password" class="login-text"/>
                    </div>
                    <!--登录按钮部分-->
                    <div class="submit">
                        <!-- <button type="submit" onclick="login()">登录</button> -->
                        <a onclick="login()">登录</a>
                        <button type="submit">重置</button>
                    </div>
                </form>
            </div>
            <div class="login-control">
                	视频控件下载:
                <a href="">GEWebClient.exe</a>
            </div>
        </div>
        <div class="login-footer">
            <img src="static/imgs/logo.png" class="footer-logo" alt=""/>
            <span class="copyright">
                	杭州逐旭智能科技有限公司与秀洲区公安局联合开发
            </span>
            <span class="version">
                 -----版本号：2.2.2.2.2
            </span>
        </div>
    </div>
    <script src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</body>
</html>