var formId = '#agentForm';
bindEvent();

function bindEvent() {
	// 保存
	$("#save").off().click(function() {
		var oper = $("#oper").val();
		var url = 'agentManage/addAgent';

		if (oper == 'edit') {
			url = 'agentManage/editAgent';
		}
		if (!validateForm()) {
			return false;
		}
		btnDisenable();
		$.ajax({
			type : 'POST',
			url : url,
			data : $(formId).serializeArray(),
			success : function(data) {
				if (data) {
					showDialog("保存成功", function() {
						refresh();
						closeDialog();
					});
				}
			},
			error : function(error) {
				showDialog(error);
			},
			compelete : function() {
				btnEnable();
			}
		});
	});

	// 取消
	$("#cancel").off().click(function() {
		closeDialog();
	});
}

// 验证表单
function validateForm() {
	var flag = true;
	var policeInfoVO_policeNo_input = $(formId).find("input[name='POLICE_NO']");
	var policeInfoVO_policeNo_length = $
			.trim(policeInfoVO_policeNo_input.val()).length;

	var policeInfoVO_policeName_input = $(formId).find(
			"input[name='POLICE_NAME']");
	var policeInfoVO_policeName_length = $.trim(policeInfoVO_policeName_input
			.val()).length;

	var policeInfoVO_phone_input = $(formId).find("input[name='POLICE_PHONE']");
	var policeInfoVO_phone_length = $.trim(policeInfoVO_phone_input.val()).length;

	var policeInfoVO_officeName_input = $(formId).find(
			"select[name='POLICE_OFFICE_NO']");
	var policeInfoVO_office_length = $
			.trim(policeInfoVO_officeName_input.val()).length;

	if (policeInfoVO_policeNo_length < 1 || policeInfoVO_policeNo_length > 30) {
		showTip(policeInfoVO_policeNo_input, "30位字符以内");
		flag = false;
	}
	if (policeInfoVO_policeName_length < 1
			|| policeInfoVO_policeName_length > 15) {
		showTip(policeInfoVO_policeName_input, "15位字符以内");
		flag = false;
	}
	if (policeInfoVO_phone_length < 1 || policeInfoVO_phone_length > 15) {
		showTip(policeInfoVO_phone_input, "30位字符以内");
		flag = false;
	}

	if (policeInfoVO_office_length < 1) {
		showTip(policeInfoVO_officeName_input.next(), "选择所属公安局");
		flag = false;
	}

	return flag;
}

// 关闭弹出框
function closeDialog() {
	Dialog.close();
}

// 弹框
function showDialog(tip, success) {
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function() {
		if (success) {
			success();
		}
	});
}

// 给jquery元素设置提示
function showTip(element, msg) {
	element.tips({
		msg : msg,
		side : 2,
		bg : '#FF0000',
		time : 3,
		x : 12
	});
}
// 刷新页面
function refresh() {
	addTab('99f0190b04cf43d1b3140fd6c42597a7','cc7f755f347c4ae7b0f6c704652d5b4d','经办人管理','agentManage/agentManageList')
}


//按钮不可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}
