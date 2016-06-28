$("#download").click(function(){
	window.location = "/expimp.zip";
})

$("#bikeSelect").click(function(){
	var diag = new Dialog();
	  
	diag.Width = 750;

	diag.Height = 650;

	diag.Title = "车辆详细信息";

	diag.URL = "bikeMsg";

	diag.show();
})