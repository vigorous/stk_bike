var tableId = "#roleManageListTable";
bindEvent();

//绑定事件
function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建角色";
		dialog.URL = "addRolePage";
		dialog.Height = 285;
		dialog.show();
	});
	
}