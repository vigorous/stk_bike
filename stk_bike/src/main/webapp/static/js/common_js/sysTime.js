function realSysTime() {
	var sysTime = "";
	var now = new Date(); //创建Date对象
	var year = now.getFullYear(); //获取年份
	var month = now.getMonth(); //获取月份
	var date = now.getDate(); //获取日期
	var day = now.getDay(); //获取星期
	var hour = now.getHours(); //获取小时
	var minu = now.getMinutes(); //获取分钟
	var sec = now.getSeconds(); //获取秒钟
	var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	var week = arr_week[day]; //获取中文的星期
	
	month = month + 1;
	month < 10 ? month = '0' + month : month; //判断年月日是否小于十,小于则加上0
	date <10 ? date = '0' + date : date;
    hour <10 ? hour = '0' + hour : hour; 
    minu <10 ? minu = '0' + minu : minu; 
    sec <10 ? sec = '0' + sec : sec;
	
	sysTime += year+"年"; //组合系统时间
	sysTime += month+"月";
	sysTime += date+"日";
	sysTime += "&nbsp;"+hour+":";
	sysTime += minu+":";
	sysTime += sec;
	sysTime += "&nbsp;"+week; 
	return sysTime;
}
setInterval(function(){$("#time").html(realSysTime);},1000);