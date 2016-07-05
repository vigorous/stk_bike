var formId = '#systemLogListSreachForm';
bindEvent();

function bindEvent() {
	// 点击事件
	$("#systemLogListSreachBtn").off().click(function() {
		$.ajax({
			url : 'systemLog/systemLogList',
			data : $(formId).serialize(),
			success : function(data){
			}
		});
	});
}
