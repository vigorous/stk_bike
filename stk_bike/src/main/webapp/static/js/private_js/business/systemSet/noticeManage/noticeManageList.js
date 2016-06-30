var tableId = 'noticeManageListTable';
bindEvent();

function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建公告";
		dialog.URL = "addNoticePage";
		dialog.Height = 205;
		dialog.show();
	});

	
}