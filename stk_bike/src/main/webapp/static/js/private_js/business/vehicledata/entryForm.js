var times = 0;
var jishi=0;
$("#addEid").click(function(){
	times++;
   		$("#lisend").show();
		$("#lisend").append("<input  type='text' id='input"+times+"''   class='width-120 margin-right-30'/><input name='text' type='button' id='del"+times+"' style='float：left' class='btn btn-sm btn-primary'  value='删除'onclick='delEidInput("+times+")'>");
		
  })
   function delEidInput(id){
		$("#input"+id).remove();
		$("#del"+id).remove();
}
$("#addMessage").click(function(){
	jishi++;
   		$("#lisMessage").show();
		$("#lisMessage").append("<input  type='text' id='mess"+jishi+"''  class='width-120 margin-right-30'/><input name='text' type='button' id='delMess"+jishi+"' class='btn btn-sm btn-primary'  value='删除'onclick='delMess("+jishi+")'>");
		
  })
  function delMess(id){
		$("#mess"+id).remove();
		$("#delMess"+id).remove();
}