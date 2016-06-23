$("#addentry").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "创建新的布防";
	dialog.URL = "entryForm";
	dialog.Height = 600;
	dialog.Width = 700;
	dialog.ShowButtonRow = true;
	dialog.OKEvent = function(){
		save();
	}
	dialog.show();
});