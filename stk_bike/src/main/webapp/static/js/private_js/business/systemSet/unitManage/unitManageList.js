var tableId = "#unitManageListTable";
bindEvent();

//绑定事件
function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建单位";
		dialog.URL = "addUnitPage";
		dialog.Height = 310;
		dialog.show();
	});
}