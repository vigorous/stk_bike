var times = 0;
var jishi = 0;
var ctxPath = $("#ctxPath").val();
$("#addEid")
		.click(
				function() {
					times++;
					$("#lisend").show();
					$("#lisend")
							.append(
									"<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='input"
											+ times
											+ "'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='del"
											+ times
											+ "'  class='btn btn-sm btn-info'  value='删除'onclick='delEidInput("
											+ times + ")'></div></div>");
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
					$("#lisMessage")
							.append(
									"<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='mess"
											+ jishi
											+ "'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='delMess"
											+ jishi
											+ "' class='btn btn-sm btn-info'  value='删除'onclick='delMess("
											+ jishi + ")'></div></div>");
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
								html += "<option value = '"
										+ data[i].POLICE_OFFICE_ID + "'>"
										+ data[i].POLICE_OFFICE_NAME
										+ "</option>";
							}
						}
						$("#POLICE_OFFICE_NAME").html(html)
					}
				},
			})

		});

// 添加布防change
$("#POLICE_OFFICE_NAME").off().change(
		function() {
			var POLICE_OFFICE_ID = $("#POLICE_OFFICE_NAME").val();
			$.ajax({
				cache : false,
				type : "POST",
				url : ctxPath
						+ "entry/queryMachineByPoliceOffceID?POLICE_OFFICE_ID="
						+ POLICE_OFFICE_ID,
				success : function(data) {
					var html = "";
					if (data != null) {
						for (i in data) {
							if (data[i].MACHINE_NAME != undefined) {
								html += "<option name='MACHINE_NO' value = '"
										+ data[i].MACHINE_NO + "'>"
										+ data[i].MACHINE_NAME + "</option>";
							}
						}
						$("#MACHINE_NO").html(html)
					}
				},
			})
		})

// 机具编号选中状态
$("#MACHINE_NO").off().change(function() {
	var html = "";
	// 获取输入框里面的值
	var MACHINE_NO = $("#MACHINE_NO").find("option:selected").text();
	// 布防工具赋值
	var textarea = $("#textarea").val();
	html += "<div> <span>"+MACHINE_NO+" </span> </div>";
	
	$("#textarea").html(html)
	
	if (MACHINE_NO != null) {
		$("#textarea").val(textarea + "," + MACHINE_NO);
	} else {
		$("#textarea").val(MACHINE_NO);
	}
	
	
	

})

// 保存点击表单提交
var form = $("#form");
// 获取表单的所有值
var params = form.serialize();
function save() {
	var params = form.serialize();
	$.ajax({
		cache : false,
		type : "POST",
		data : params,
		url : ctxPath + "entry/addMonitorRuleInfo",
		success : function(data) {
			if (data == true) {
				alert("添加成功");
				Dialog.close();
				addTab('87398fd8899a48d2b423423015e850ae',
						'413f090a2f734d0aad0adb9cc3bff6a0', '布防设置',
						'entry/select')
			} else {
				alert("添加失败");
			}
		},
		error : function(data) {
			alert("添加失败");
		}
	})

}
