var formId = '#systemLogListSreachForm';
bindEvent();

function bindEvent() {
	// 点击事件
	$("#systemLogListSreachBtn").off().click(function() {
		window.location.href = 'systemLog/systemLogList?'+$(formId).serialize();
	});
}

