var tableId = "#agentManageListTable";
bindEvent();

function bindEvent() {
	//全选
	$("#selectAll").off().click(function(){
		var isChecked = $(this).is(":checked");
		if(isChecked){
			$(tableId).find("input[name='select']").prop("checked", true);
		}else{
			$(tableId).find("input[name='select']").prop("checked", false);
		}
	});
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
	
	//批量删除
	$("#batchDelete").off().click(function(){
		var police_ids = [];
		$.each($("input[name='select']:checked"),function(index, element){
			police_ids.push({
				POLICE_ID : $(element).attr("data-id")
			});
		});
		if(police_ids.length < 1){
			showDialog("请至少选中一条数据");
		}else{
			$.ajax({
				type : 'POST',
				url : 'agentManage/batchDeleteAgent',
				data : JSON.stringify(police_ids),
				dataType : 'json',
				contentType:"application/json",
				success : function(data){
					if(data){
						showDialog("删除成功", refresh);
					}else{
						showDialog("删除失败");
					}
				},
				error : function(){
					showDialog("删除失败");
				}
			});
		}
	});
	
	
	//表格双击行弹出详情页面
	$(tableId+" tbody tr").off().dblclick(function(){
		var police_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "经办人详情";
		dialog.URL = "agentDetailPage?POLICE_ID=" + police_id;
		dialog.Height = 175;
		dialog.show();
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


