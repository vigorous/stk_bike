var formId = '#userForm';
bindEvent();

function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'userManage/addUser';
		
		if(oper == 'edit'){
			url = 'userManage/editUser';   
		}
		if(!validateForm()){
			return false;
		}
		btnDisenable();
		$.ajax({
			url : url,
			data : $(formId).serialize(),
			success : function(data){
				if(data){
					showDialog("保存成功", function(){
						refresh();
						closeDialog();
					});
				}
			},
			error : function(error){
				showDialog(error);
			},
			compelete : function(){
				btnEnable();
			}
		});
	});
	
	//取消
	$("#cancel").off().click(function(){
		closeDialog();
	});
}

//验证表单
function validateForm(){
	var flag = true;
	var userInfoVO_userName_input = $(formId).find("input[name='USERNAME']");
	var userInfoVO_userName_length = $.trim(userInfoVO_userName_input.val()).length;
	
	var userInfoVO_passWord_input=$(formId).find("input[name='PASSWORD']");
	var userInfoVO_passWord_length=$.trim(userInfoVO_passWord_input.val()).length;
	
	var userInfoVO_name_input=$(formId).find("input[name='NAME']");
	var userInfoVO_name_length=$.trim(userInfoVO_name_input.val()).length;
	
	var userInfoVO_roleName_input=$(formId).find("select[name='ROLE_ID']");
	var userInfoVO_roleName_length=$.trim(userInfoVO_roleName_input.val()).length;
	
	var userInfo_policeOfficeName_input=$(formId).find("select[name='POLICE_OFFICE_ID']");
	var userInfo_policeOfficeName_legth=$.trim(userInfo_policeOfficeName_input.val()).length;
	
	
	if(userInfoVO_userName_length < 1 || userInfoVO_userName_length > 30){
		showTip(userInfoVO_userName_input, "30位字符以内");
		flag = false;
	}
	if(userInfoVO_passWord_length < 1 || userInfoVO_passWord_length > 15){
		showTip(userInfoVO_passWord_input, "15位字符以内");
		flag = false;
	}
	if(userInfoVO_name_length < 1 || userInfoVO_name_length > 15){
		showTip(userInfoVO_name_input, "30位字符以内");
		flag = false;
	}	
	
	if(userInfoVO_roleName_length < 1){
		showTip(userInfoVO_roleName_input.next(), "选择用户权限");
		flag = false;
	}
	if(userInfo_policeOfficeName_legth < 1){
		showTip(userInfo_policeOfficeName_input.next(), "选择所属公安局");
		flag = false;
	}
	return flag;
}

//关闭弹出框
function closeDialog(){
	Dialog.close();
}

//弹框
function showDialog(tip, success){
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function(){
		if(success){
			success();
		}
	});
}

//给jquery元素设置提示
function showTip(element, msg){
	element.tips({
		msg : msg,
		side : 2,
		bg : '#FF0000',
		time : 3,
		x : 12
	});
}

//刷新页面
function refresh(){
	addTab('b7cc9061c19645c9925af0c84ac24633','cc7f755f347c4ae7b0f6c704652d5b4d','用户管理','userManage/userManageList')
}

//按钮不可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}