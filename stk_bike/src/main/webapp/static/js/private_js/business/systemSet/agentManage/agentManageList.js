var tableId = "#agentManageListTable";
bindEvent();

function bindEvent() {
   //新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建经办人";
		dialog.URL = "addAgentPage";
		dialog.Height = 250;
		dialog.show();
	});
	
	
	// 编辑
	$("button[name='edit']").off().click(function() {
		var police_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑区域";
		dialog.URL = "agentManageForm?POLICE_ID=" + police_id;
		dialog.Height = 250;
		dialog.show();
	});
	
	// 删除
	$("button[name='delete']").off().click(function() {
		var police_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？", function() {
			$.ajax({
				type : 'POST',
				url : 'agentManage/deleteAgent',
				data : {
					POLICE_ID : police_id
				},
				success : function(data) {
					if (data) {
						showDialog("删除成功", refresh);
					} else {
						showDialog("删除失败");
					}
				},
				error : function(error) {
					showDialog(error);
				}
			});
		});
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

//刷新页面
function refresh() {
	addTab('99f0190b04cf43d1b3140fd6c42597a7','cc7f755f347c4ae7b0f6c704652d5b4d','经办人管理','agentManage/agentManageList')
}


