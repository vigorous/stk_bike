$("#addPlate").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "添加电子车牌";
	dialog.URL = "plateManagerForm";
	dialog.Height = 500;
	dialog.show();
});