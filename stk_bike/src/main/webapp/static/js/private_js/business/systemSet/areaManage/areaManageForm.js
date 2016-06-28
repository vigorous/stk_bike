var formId = '#areaForm';
bindEvent();

function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'areaManage/addArea';
		if(oper == 'edit'){
			url = 'areaManage/editArea';
		}
		$.ajax({
			url : url,
			data : $(formId).serialize(),
			success : function(data){
				success(data);
			},
			error : function(error){
				
			}
		});
	});
	
	//取消
	$("#cancel").off().click(function(){
		closeDialog();
	});
	
	//区县级别选择二级时，显示上级区县下拉
	$(formId).find("select[name='DISTRICT_LEVEL']").change(function(){
		var districtLevel = $(this).val();
		if(districtLevel == 1){
			$("#parentDistrict").addClass("hide");
		}else if(districtLevel == 2){
			$("#parentDistrict").removeClass("hide");
		}
	});
}

//请求成功调用的方法
function success(data){
	if(data){
		refresh();
		closeDialog();
	}
}

//关闭弹出框
function closeDialog(){
	Dialog.close();
}

//刷新页面
function refresh(){
	
}

//
function btnEnable(){
	
}

//
function btnDisenable(){
	
}