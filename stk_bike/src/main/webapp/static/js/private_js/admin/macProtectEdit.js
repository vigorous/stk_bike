/**
 * 
 */
//新建
$("#macProtectNew").click(function(){
	
	var diag = new Dialog();

	diag.Width = 650;

	diag.Height = 550;

	diag.Title = "MAC布防信息编辑";

	diag.URL = "macProtectEdit";

	diag.show();
});
