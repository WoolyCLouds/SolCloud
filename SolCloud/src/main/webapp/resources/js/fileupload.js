function bs_input_file() {
	$(".input-file").before(function() {
		if (!$(this).prev().hasClass('input-ghost')) {
			var element = $("<input type='file' id='file1' name='file1' class='input-ghost' style='visibility:hidden; height:0'>");
			element.attr("name", $(this).attr("name"));
			element.change(function() {
				element.next(element).find('input').val((element.val()).split('\\').pop());
			});
			
			$(this).find("button.btn-choose").click(function() {
				element.click();
			});
			
			$(this).find("button.btn-reset").click(function() {
				element.val(null);
				$(this).parents(".input-file").find('input').val('');
			});
			
			$(this).find('input').css("cursor", "pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		});
}
$(function() {
	bs_input_file();
});

function replace(inum) {
	inum = inum.replace(/&/g,"%26"); 
	inum = inum.replace(/\+/g,"%2B"); 
	return inum;
}

function downLink (m, i) {
	var name = replace(i);
	console.log(name);
	location.href="downloadfile?m_id="+m+"&f_name="+name;
}

function shareLink (m, i, f) {
	var name = replace(i);
	console.log(name);
	location.href="shareCheck?m_id="+m+"&f_name="+name+"&f_share="+f+"&view=board";
}

function delLink (m, i) {
	var name = replace(i);
	console.log(name);
	var con = confirm('정말로 삭제하시겠습니까?');
	if (con) {
		location.href="deletefile.do?m_id="+m+"&f_name="+name;
	}
}