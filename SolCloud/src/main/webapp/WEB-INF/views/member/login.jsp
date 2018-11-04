<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>SolCloud</title>
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header"><h3 class="panel-title">로그인</h3></div>
			<div class="card-body">
				<form role="form" method="post" action="login.do" onsubmit="return login()">
					<input type="hidden" id="RSAModulus" value="${RSAModulus}" />
					<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
					<input type="hidden" id="USER_ID" name="m_id">
        			<input type="hidden" id="USER_PW" name="m_pw">
									
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="USER_ID_TEXT" name="USER_ID_TEXT" class="form-control" placeholder="Enter ID" required="required" autofocus="autofocus">
							<label for="USER_ID_TEXT">ID</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="USER_PW_TEXT" name="USER_PW_TEXT" class="form-control" placeholder="Password" required="required">
							<label for="USER_PW_TEXT">Password</label>
						</div>
					</div>
					<button class="btn btn-primary btn-block">로그인</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="joinMember.go">회원 가입</a>
					<a class="d-block small" href="findPassword.go">비밀 번호를 잊어버리셨나요??</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
