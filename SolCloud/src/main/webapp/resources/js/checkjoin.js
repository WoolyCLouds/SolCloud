var idflag = false;
var nameflag = false;
var pwflag = false;
var pwcflag = false;
var zipflag = false;
var addflag1 = false;
var addflag2 = false;
var answerflag = false;

function signup () {
	// console.log($('#m_zipcode').val());
	if (idflag == true && nameflag == true && pwflag == true && pwcflag == true && zipflag == true && addflag1 == true && addflag2 == true && answerflag == true) {
		// console.log(idflag+', '+nameflag+', '+pwflag+', '+pwcflag+', '+zipflag+', '+addflag1+', '+addflag2+', '+answerflag);
		$('button[type=submit]').prop("disabled", false).addClass('btn-primary');
	} else {
		// console.log(idflag+', '+nameflag+', '+pwflag+', '+pwcflag+', '+zipflag+', '+addflag1+', '+addflag2+', '+answerflag);
		$('button[type=submit]').prop("disabled", true).removeClass('btn-primary');
	}
}

function idchk () {

	var value = $('#m_id').val();
	
	var regExp1 = /^[0-9]+$/; //숫자
	var regExp2 = /^[a-zA-Z]+$/; //영문
	var regExp3 = /^[a-zA-Z\s]+$/; //영문+공백
	var regExp4 = /^[가-힣]+$/; //한글
	var regExp5 = /^[가-힣\s]+$/; //한글+공백 
	var regExp6 = /^[가-힣a-zA-Z]+$/; //한글+영문
	var regExp7 = /^[0-9a-zA-Z]+$/; //영문+숫자
	
	if (!(value.length >= 4)) {
		$('#idcheck').css('display','inline-block').css('color', 'red').text('4글자 이상으로 완성해주세요.');
		idflag = false;
		// signup();
	} else {
		
		if (regExp1.test(value)) {
			$('#idcheck').css('display','inline-block').css('color', 'red').text('영어와 숫자 조합으로 완성해주세요.');
			idflag = false;
			// signup();
		} else if (!regExp7.test(value)) {
			$('#idcheck').css('display','inline-block').css('color', 'red').text('영어와 숫자 조합으로 완성해주세요.');
			idflag = false;
			// signup();
		} else {
			$.ajax({
				async : true,
				type : 'POST',
				data : value,
				url : "idcheck.do",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						$('#idcheck').css('display','inline-block').css('color', 'red').text('아이디가 중복됩니다. 다른 아이디를 입력해주세요.');
						idflag = false;
						// signup();
					} else {
						$('#idcheck').css('display', 'none');
						idflag = true;
						// signup();
					}
				},
				error : function(error) {
					$('#idcheck').css('display','inline-block').css('color', 'red').text('error :' + error);
				}
			});
		}
	}
}

function namechk() {

	var value = $('#m_name').val();
	
	var regExp = /^[가-힣]+$/; //한글
	
	if (!regExp.test(value)) {
		$('#namecheck').css('display','inline-block').css('color', 'red').text('한글만 허용됩니다.');
		nameflag = false;
		// signup();
	} else {
		$('#namecheck').css('display', 'none');
		nameflag = true;
		// signup();
	}
}

function pwc () {
				
	if ($('#m_pw').val() != $('#m_pwc').val()) {
		$('#equalcheck').css('display','inline-block').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		pwcflag = false;
		// signup();
	} else {
		$('#equalcheck').css('display', 'none');
		pwcflag = true;
		// signup();
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
		pwflag = false;
		// signup();
	} else {
		$('#pwcheck').css('display', 'none');
		pwflag = true;
		// signup();
	}
}

function zip () {
	if($('#m_zipcode').val() != '' && $('#m_zipcode').val() != null) {
		zipflag = true;
		// signup();
	} else {
		zipflag = false;
		// signup();
	}
}

function add1 () {
	if($('#m_address1').val() != '' && $('#m_address1').val() != null) {
		addflag1 = true;
		// signup();
	} else {
		addflag1 = false;
		// signup();
	}
}

function add2 () {
	if($('#m_address2').val() != '' && $('#m_address2').val() != null) {
		addflag2 = true;
		// signup();
	} else {
		addflag2 = false;
		// signup();
	}
}

function ans () {
	if($('#m_answer').val() != '' && $('#m_answer').val() != null) {
		answerflag = true;
		// signup();
	} else {
		answerflag = false;
		// signup();
	}
}

//"검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다
$(function() {
	$("#postcodify_search_button").postcodifyPopUp();
	setInterval(function() {
		zip();
		add1();
		signup();
	}, 1000);
});