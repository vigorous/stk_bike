var formId = '#areaForm';
bindEvent();

function bindEvent(){
	//区县级别选择二级时，显示上级区县下拉
	$(formId).find("select[name='DISTRICT_LEVEL']").change(function(){
		var districtLevel = $(this).val();
		if(districtLevel == 1){
			$("#parentDistrict").addClass("hide");
		}else if(districtLevel == 2){
			$("#parentDistrict").removeClass("hide");
		}
	});
	
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'areaManage/addArea';
		if(oper == 'edit'){
			url = 'areaManage/editArea';
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

//刷新页面
function refresh(){
	addTab('bea8ebd27048422f9ae9efe2a60eee0d','cc7f755f347c4ae7b0f6c704652d5b4d','区域管理','areaManage/areaManageList')
}

//按钮不可用
function btnEnable(){
	$("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$("input[type='button']").attr("disabled","disabled");
}