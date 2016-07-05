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
	// if ($("#APPLY_ORG_NAME").val() == "" || $("#APPLY_ORG_NAME").val() ==
	// null) {
	// // $("#APPLY_ORG_NAME").tips({
	// // side : 1,
	// // msg : "申请卡单位不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("申请卡单位不能为空");
	// return false;
	// }
	// if ($("#AUTH_ORG_NAME").val() == "" || $("#AUTH_ORG_NAME").val() == null)
	// {
	// // $("#AUTH_ORG_NAME").tips({
	// // side : 1,
	// // msg : "发卡单位不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("发卡单位不能为空");
	// return false;
	// }
	// if ($("#APPLY_TIME").val() == "" || $("#APPLY_TIME").val() == null) {
	// // $("#APPLY_TIME").tips({
	// // side : 1,
	// // msg : "申请时间不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("申请时间不能为空");
	// return false;
	// }
	// if ($("#CARD_BEGIN_NO").val() == "" || $("#CARD_BEGIN_NO").val() == null)
	// {
	// // $("#CARD_BEGIN_NO").tips({
	// // side : 1,
	// // msg : "开始号码不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("开始号码不能为空");
	// return false;
	// }
	//
	// if ($("#CARD_END_NO").val() == "" || $("#CARD_END_NO").val() == null) {
	// // $("#CARD_END_NO").tips({
	// // side : 1,
	// // msg : "结束号码不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("结束号码不能为空");
	//
	// return false;
	// }
	// if ($("#APPLY_NUM").val() == "" || $("#APPLY_NUM").val() == null) {
	// // $("#APPLY_NUM").tips({
	// // side : 1,
	// // msg : "卡片数量不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("卡片数量不能为空");
	//
	// return false;
	// }
	// if ($("#POLICE_ID").val() == "" || $("#POLICE_ID").val() == null) {
	// // $("#manageID").tips({
	// // side : 1,
	// // msg : "经办人ID不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("经办人ID不能为空");
	// return false;
	// }
	// if ($("#POLICE_NAME").val() == "" || $("#POLICE_NAME").val() == null) {
	// // $("#POLICE_NAME").tips({
	// // side : 1,
	// // msg : "经办人姓名不能为空",
	// // bg : '#FF5080',
	// // time : 3
	// // });
	// alert("经办人姓名不能为空");
	// return false;
	// }
	if (!validateForm()) {
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
				Dialog.close();
				addTab('c1c24ce5599d4951b5f5209d9c624ad4',
						'5ca05caac74545bc9a1dc343741f4209', '电子车牌发卡管理',
						'plate/select')
			} else {
				alert("添加失败");
			}
		},
		error : function(data) {
			alert("添加失败");
		}
	})

}
// 验证表单
function validateForm() {
	debugger
	var flag = true;
	
	
	
	// 发卡单位
	var AUTH_ORG_NAME = $(form).find("input[name='AUTH_ORG_NAME']");
	var AUTH_ORG_NAME_length = $.trim(AUTH_ORG_NAME.val()).length;
	if (AUTH_ORG_NAME_length < 1) {
		showTip(AUTH_ORG_NAME, "发卡单位不能为空");
		flag = false;
	}
	
	// 发卡信息
	var APPLY_ORG_NAME = $(form).find("select[name='APPLY_ORG_NAME']");
	var APPLY_ORG_NAME_length = $.trim(APPLY_ORG_NAME.val()).length;
	if (APPLY_ORG_NAME_length < 1) {
		showTip(APPLY_ORG_NAME, "发卡信息不能为空");
		flag = false;
	}

	// 申请时间 APPLY_TIME

	var APPLY_TIME = $(form).find("input[name='APPLY_TIME']");
	var APPLY_TIME_length = $.trim(APPLY_TIME.val()).length;

	if (APPLY_TIME_length < 1) {
		showTip(APPLY_TIME, "申请时间不能为空");
		flag = false;
	}
	// 开始号码 CARD_BEGIN_NO
	var CARD_BEGIN_NO = $(form).find("input[name='CARD_BEGIN_NO']");
	var CARD_BEGIN_NO_length = $.trim(CARD_BEGIN_NO.val()).length;
	if (CARD_BEGIN_NO_length < 1) {
		showTip(CARD_BEGIN_NO, "开始号码不能为空");
		flag = false;
	}
	// 结束号码 CARD_END_NO

	var CARD_END_NO = $(form).find("input[name='CARD_END_NO']");
	var CARD_END_NO_length = $.trim(CARD_END_NO.val()).length;
	if (CARD_END_NO_length < 1) {
		showTip(CARD_END_NO, "结束号码不能为空");
		flag = false;
	}
	// 卡片数量 APPLY_NUM

	var APPLY_NUM = $(form).find("input[name='APPLY_NUM']");
	var APPLY_NUM_length = $.trim(APPLY_NUM.val()).length;
	if (APPLY_NUM_length < 1) {
		showTip(APPLY_NUM, "卡片数量不能为空");
		flag = false;
	}
	// 经办人id POLICE_ID

	var POLICE_ID = $(form).find("select[name='POLICE_ID']");
	var POLICE_ID_length = $.trim(POLICE_ID.val()).length;
	if (POLICE_ID_length < 1) {
		showTip(POLICE_ID, "经办人id不能为空");
		flag = false;
	}
	// 经办人姓名 POLICE_NAME

	var POLICE_NAME = $(form).find("input[name='POLICE_NAME']");
	var POLICE_NAME_length = $.trim(POLICE_NAME.val()).length;
	if (POLICE_NAME_length < 1) {
		showTip(POLICE_NAME, "经办人姓名不能为空");
		flag = false;
	}
	return flag;
}


//退出
$("#close").off().click(
		function() {
			Dialog.close();
		});

// 点击事件
$("#selectPlate").off().click(
		function() {
			// 根据id获取控件
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			var ctxPaths = $("#ctxPath").val();
			addTab('c1c24ce5599d4951b5f5209d9c624ad4',
					'5ca05caac74545bc9a1dc343741f4209', '电子车牌发卡管理',
					'plate/select?startTime=' + startTime + '&endTime='
							+ endTime)
		});
// 给jquery元素设置提示
function showTip(element, msg) {
	element.tips({
		msg : msg,
		side : 2,
		bg : '#FF0000',
		time : 3,
		x : 12
	});
}


//弹框
function showDialog(tip, success){
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function(){
		if(success){
			success();
		}
	});
}