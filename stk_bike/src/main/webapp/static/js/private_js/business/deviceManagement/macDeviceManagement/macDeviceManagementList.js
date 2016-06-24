$("#macend").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "编辑MAC设备管理";
	dialog.URL = "macDeviceManagementForm";
	dialog.Height = 650;
	dialog.Width = 800;
	dialog.ShowButtonRow = true;
	dialog.OKEvent = function(){
		save();
	}
	dialog.show();
});