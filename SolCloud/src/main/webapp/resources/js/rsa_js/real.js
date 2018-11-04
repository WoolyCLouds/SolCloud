function login() {
	var id = $("#USER_ID_TEXT");
	var pw = $("#USER_PW_TEXT");

	if (id.val() == "") {
		alert("아이디를 입력 해주세요.");
		id.focus();
		return false;
	}

	if (pw.val() == "") {
		alert("비밀번호를 입력 해주세요.");
		pw.focus();
		return false;
	}

	// rsa 암호화
	var rsa = new RSAKey();
	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());

	$("#USER_ID").val(rsa.encrypt(id.val()));
	$("#USER_PW").val(rsa.encrypt(pw.val()));

	id.val("");
	pw.val("");

	return true;
}
