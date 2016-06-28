//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建区域";
	dialog.URL = "areaManageForm";
	dialog.Height = 130;
	dialog.show();
});