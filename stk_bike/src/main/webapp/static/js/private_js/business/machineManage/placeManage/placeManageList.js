var formId = '#placeListSreachForm';
bindEvent();

function bindEvent() {
	// 点击事件
	$("#placeListSreachBtn").off().click(function() {
		$.ajax({
			url : 'placeManage/placeManageList',
			data : $(formId).serialize(),
			success : function(data){
				
			}
		});
	});
}