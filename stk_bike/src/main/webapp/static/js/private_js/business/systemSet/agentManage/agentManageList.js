//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建经办人";
	dialog.URL = "agentManageForm";
	dialog.Height = 250;
	dialog.show();
});

