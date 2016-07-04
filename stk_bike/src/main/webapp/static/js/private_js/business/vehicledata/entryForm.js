var times = 0;
var jishi=0;
$("#addEid").click(function(){
	times++;
   		$("#lisend").show();
		/*$("#lisend").append("<input  type='text' id='input"+times+"''   class='width-120 margin-right-30'/><input name='text' type='button' id='del"+times+"' style='float：left' class='btn btn-sm btn-primary'  value='删除'onclick='delEidInput("+times+")'>");*/
   		$("#lisend").append("<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='input"+times+"'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='del"+times+"'  class='btn btn-sm btn-info'  value='删除'onclick='delEidInput("+times+")'></div></div>");
  })
   function delEidInput(id){
		$("#input"+id).remove();
		$("#del"+id).remove();
}
$("#addMessage").click(function(){
	jishi++;
   		$("#lisMessage").show();
		/*$("#lisMessage").append("<input  type='text' id='mess"+jishi+"''  class='width-120 margin-right-30'/><input name='text' type='button' id='delMess"+jishi+"' class='btn btn-sm btn-primary'  value='删除'onclick='delMess("+jishi+")'>");*/
   		$("#lisMessage").append("<div class='col-xs-12 no-padding-left' style='margin-top:2px'><div class='col-xs-7 no-padding-left'><input  type='text' id='mess"+jishi+"'' /></div><div class='col-xs-4 no-padding-left'><input name='text' type='button' id='delMess"+jishi+"' class='btn btn-sm btn-info'  value='删除'onclick='delMess("+jishi+")'></div></div>");
  })
  function delMess(id){
		$("#mess"+id).remove();
		$("#delMess"+id).remove();
}