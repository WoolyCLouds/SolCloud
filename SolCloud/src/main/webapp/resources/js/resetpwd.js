function pwc () {
				
	if ($('#m_pw').val() != $('#m_pwc').val()) {
		$('#equalcheck').css('display','inline-block').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		$('button[type=submit]').prop("disabled", true);
	} else {
		$('#equalcheck').css('display', 'none');
		$('button[type=submit]').prop("disabled", false);
	}
	
}

function pw () {
	
	var lowerOK = false;
	var lower = "qwertyuiopasdfghjklzxcvbnm";
	for (var i = 0; i < lower.length; i++) {
		if ($('#m_pw').val().indexOf(lower[i]) != -1){
			lowerOK = true;
			break;
		}
	}
	
	var speOK = false;
	var spe = "[~!@#$%<>^&*()-=+_’/|?\]";
	for (var i = 0; i < spe.length; i++){
		if ($('#m_pw').val().indexOf(spe[i]) != -1) {
			speOK = true;
			break;
		}
	}
	
	var numOK = false;
	var num = "1234567890";
	for (var i = 0; i < num.length; i++) {
		if ($('#m_pw').val().indexOf(num[i]) != -1){
			numOK = true;
			break;
		}
	}
	
	if(!lowerOK || !numOK || !speOK){
		$('#pwcheck').css('display','inline-block').css('color', 'red').text('영어(소), 숫자, 특수문자가 각각 1개 이상');
	} else {
		$('#pwcheck').css('display', 'none');
	}
}