//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建公告";
	dialog.URL = "bulletinManagementForm";
	dialog.Height = 165;
	dialog.ShowButtonRow = true;
	dialog.OKEvent = function(){
		save();
	}
	dialog.show();
});

//保存
function save(){
	alert("保存成功");
}