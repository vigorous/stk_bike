var formId = '#systemLogListSreachForm';
bindEvent();

function bindEvent() {
	// 点击事件
	$("#systemLogListSreachBtn").off().click(function() {
		window.location.href = 'systemLog/systemLogList?'+$(formId).serialize();
		
	});
}
//刷新页面
function refresh(){
	debugger;
	addTab('b0ae299bae2448898e7aa085961c3eaf','cc7f755f347c4ae7b0f6c704652d5b4d','系统日志','systemLog/systemLogList');
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