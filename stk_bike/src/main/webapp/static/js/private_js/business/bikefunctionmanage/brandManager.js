$("#addBrand").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "添加品牌";
	dialog.URL = "brandManagerForm";
	dialog.Height = 300;
//	dialog.ShowButtonRow = true;
//	dialog.OKEvent = function(){
//		save();
//	}
	dialog.show();
});