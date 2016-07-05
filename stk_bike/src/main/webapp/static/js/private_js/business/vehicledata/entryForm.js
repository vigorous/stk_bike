var times = 0;
var jishi = 0;
var ctxPath = $("#ctxPath").val();
$("#addEid")
		.click(
				function() {
					times++;
					$("#lisend").show();
					$("#lisend").append("<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='input"+times+"'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='del"+times+"'  class='btn btn-sm btn-info'  value='删除'onclick='delEidInput("+times+")'></div></div>");
				})
function delEidInput(id) {
	$("#input" + id).remove();
	$("#del" + id).remove();
}
$("#addMessage")
		.click(
				function() {
					jishi++;
					$("#lisMessage").show();
					$("#lisMessage").append("<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='mess"+jishi+"'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='delMess"+jishi+"' class='btn btn-sm btn-info'  value='删除'onclick='delMess("+jishi+")'></div></div>");
				})
function delMess(id) {
	$("#mess" + id).remove();
	$("#delMess" + id).remove();
}
$(document).ready(
		function() {
			$.ajax({
				cache : false,
				type : "POST",
				url : ctxPath + "entry/queryAllPoliceOffice",
				success : function(data) {
					var html = "";
					if (data != null) {
						for (i in data) {
							if (data[i].POLICE_OFFICE_NAME != undefined) {
								html += "<option value = '"+ data[i].POLICE_OFFICE_ID + "'>"+ data[i].POLICE_OFFICE_NAME+ "</option>";
							}
						}
						$("#POLICE_OFFICE_NAME").html(html)
					}
				},
			})

		});



$("#POLICE_OFFICE_NAME").off().change(function(){
	debugger
	var POLICE_OFFICE_ID=$("#POLICE_OFFICE_NAME").val();
	$.ajax({
		cache : false,
		type : "POST",
		url : ctxPath + "entry/queryMachineByPoliceOffceID?POLICE_OFFICE_ID="+POLICE_OFFICE_ID,
		success : function(data) {
			debugger
			var html = "";
			if (data != null) {
//				$("#MACHINE_NAME").val(data.MACHINE_NAME)
				for (i in data) {
					if (data[i].MACHINE_NAME != undefined) {
						html += "<option value = '"+ data[i].MACHINE_NAME + "'>"+ data[i].MACHINE_NAME+ "</option>";
					}
				}
				$("#MACHINE_NAME").html(html)
			}
		},
	})
})	