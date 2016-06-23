var times = 0;   	
$("#addEid").click(function(){
	times++;
   		$("#lisend").show();
		$("#lisend").append("<input  type='text' id='input"+times+"''  class='width-120 margin-right-30'/><input name='text' type='button' id='del"+times+"' class='btn btn-sm btn-primary'  value='删除'onclick='delEidInput("+times+")'>");
		
  })
   function delEidInput(id){
		$("#input"+id).remove();
		$("#del"+id).remove();
}