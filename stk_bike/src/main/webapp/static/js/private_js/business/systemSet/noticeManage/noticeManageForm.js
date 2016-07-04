var formId = '#noticeForm';
bindEvent();

//绑定事件
function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'noticeManage/addNotice';
		var district_no = $(formId).find("input[name='DISTRICT_NO']").val();
		if(oper == 'edit'){
			url = 'noticeManage/editNotice';
		}
		if(!validateForm()){
			return false;
		}
		btnDisenable();
		save(url);
	});
	
	//取消
	$("#cancel").off().click(function(){
		closeDialog();
	});
}

//验证表单
function validateForm(){
	var flag = true;
	var title_input = $(formId).find("input[name='TITLE']");
	var title_length = $.trim(title_input.val()).length;
	var contet_textarea = $(formId).find("textarea[name='CONTET']");
	var contet_length = $.trim(contet_textarea.val()).length;
	if(title_length < 1 || title_length > 100){
		showTip(title_input, "100位字符以内");
		flag = false;
	}
	if(contet_length < 1 || contet_length > 4000){
		showTip(contet_textarea, "4000位字符以内");
		flag = false;
	}
	return flag;
}

//保存方法
function save(url){
	$.ajax({
		type : 'POST',
		url : url,
		data : $(formId).serializeArray(),
		success : function(data){
			if(data){
				showDialog("保存成功", function(){
					refresh();
					closeDialog();
				});
			}else{
				showDialog("保存失败", btnEnable);
			}
		},
		error : function(){
			showDialog("保存失败", btnEnable);
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

//弹框
function showDialog(tip, success){
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function(){
		if(success){
			success();
		}
	});
}

//关闭弹出框
function closeDialog(){
	Dialog.close();
}

//刷新页面
function refresh(){
	addTab('61b41081f89042bd9dc908d4176e7ac2','cc7f755f347c4ae7b0f6c704652d5b4d','公告管理','noticeManage/noticeManageList');
}

//按钮可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮不可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}