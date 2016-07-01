$("#addPlate").off().click(function() {
	var dialog = new Dialog();
	dialog.Title = "添加电子车牌";
	dialog.URL = "plateManagerForm";
	dialog.Height = 400;
	dialog.show();
});

// 获取from表单
var form = $("#form");
$(form).find("select[name='APPLY_ORG_NAME']").off().change(function() {
	var apply_org_id = $(this).children("option:selected").attr("data-id");
	$(form).find("input[name='APPLY_ORG_ID']").val(apply_org_id);
});

$(form).find("select[name='POLICE_ID']").off().change(function() {
	var apply_org_id = $(this).children("option:selected").attr("data-id");
	$(form).find("input[name='AUTH_ORG_ID']").val(apply_org_id);
});

// 获取表单的所有值
var params = form.serialize();
function save() {
	if ($("#APPLY_ORG_NAME").val() == "" || $("#APPLY_ORG_NAME").val() == null) {
		// $("#APPLY_ORG_NAME").tips({
		// side : 1,
		// msg : "申请卡单位不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("申请卡单位不能为空");
		return false;
	}
	if ($("#AUTH_ORG_NAME").val() == "" || $("#AUTH_ORG_NAME").val() == null) {
		// $("#AUTH_ORG_NAME").tips({
		// side : 1,
		// msg : "发卡单位不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("发卡单位不能为空");
		return false;
	}
	if ($("#APPLY_TIME").val() == "" || $("#APPLY_TIME").val() == null) {
		// $("#APPLY_TIME").tips({
		// side : 1,
		// msg : "申请时间不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("申请时间不能为空");
		return false;
	}
	if ($("#CARD_BEGIN_NO").val() == "" || $("#CARD_BEGIN_NO").val() == null) {
		// $("#CARD_BEGIN_NO").tips({
		// side : 1,
		// msg : "开始号码不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("开始号码不能为空");
		return false;
	}

	if ($("#CARD_END_NO").val() == "" || $("#CARD_END_NO").val() == null) {
		// $("#CARD_END_NO").tips({
		// side : 1,
		// msg : "结束号码不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("结束号码不能为空");

		return false;
	}
	if ($("#APPLY_NUM").val() == "" || $("#APPLY_NUM").val() == null) {
		// $("#APPLY_NUM").tips({
		// side : 1,
		// msg : "卡片数量不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("卡片数量不能为空");

		return false;
	}
	if ($("#POLICE_ID").val() == "" || $("#POLICE_ID").val() == null) {
		// $("#manageID").tips({
		// side : 1,
		// msg : "经办人ID不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("经办人ID不能为空");
		return false;
	}
	if ($("#POLICE_NAME").val() == "" || $("#POLICE_NAME").val() == null) {
		// $("#POLICE_NAME").tips({
		// side : 1,
		// msg : "经办人姓名不能为空",
		// bg : '#FF5080',
		// time : 3
		// });
		alert("经办人姓名不能为空");
		return false;
	}

	var ctxPath = $("#addCtxPath").val();
	var params = form.serialize();
	$.ajax({
		cache : false,
		type : "POST",
		data : params,
		url : ctxPath + "plate/addCard",
		success : function(data) {
			if (data == true) {
				alert("添加成功");
				addTab('c1c24ce5599d4951b5f5209d9c624ad4',
						'5ca05caac74545bc9a1dc343741f4209', '电子车牌发卡管理',
						'plate/select')
				Dialog.close();
			} else {
				alert("添加失败");
			}
		},
		error : function(data) {
			alert("添加失败");
		}
	})

}

// 点击事件
$("#selectPlate").off().click(
		function() {
			// 根据id获取控件
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var ctxPaths = $("#ctxPath").val();
			addTab('c1c24ce5599d4951b5f5209d9c624ad4',
					'5ca05caac74545bc9a1dc343741f4209', '电子车牌发卡管理',
					'plate/select?startTime='+startTime+'&endTime='+endTime)
		});
