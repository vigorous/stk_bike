var locat = (window.location+'').split('/'); 
$(function(){
	/*alert(locat);*/
	if('main'== locat[3]){
		locat =  locat[0]+'//'+locat[2];
	}else{
		locat =  locat[0]+'//'+locat[2]+'/'+locat[3];
	};
});

var syid = "cgjIndex";
var zdsjid = "tmlData";
function addTab(id,fid,MENU_NAME,MENU_URL){
	if(id != zdsjid){
		$("#" + zdsjid).removeClass();
		zdsjid = id;
	}
	if(fid != syid){
		$("#" + syid).removeClass();
		syid = fid;
	}
	$("#" + fid).attr("class","active open");
	$("#" + id).attr("class","active");
	
	/*alert("locat="+locat);*/
	/*$.ajax({
		type: "POST",
		url: locat+'/head/getUname.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			//alert(data.list.length);
			 $.each(data.list, function(i, list){
				 //登陆者资料
				 $("#user_info").html('<small>Welcome</small> '+list.NAME+'');
				 user = list.USERNAME;
				 USER_ID = list.USER_ID;//用户ID
				 hf(list.SKIN);//皮肤
				 if(list.USERNAME != 'admin'){
					 $("#adminmenu").hide();	//隐藏菜单设置
					 $("#adminzidian").hide();	//隐藏数据字典
					 $("#systemset").hide();	//隐藏系统设置
					 $("#productCode").hide();	//隐藏代码生成
				 }
				 online();//连接在线管理
			 });
		}
	});*/
	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
}

function test(){
	alert("test...");
}
