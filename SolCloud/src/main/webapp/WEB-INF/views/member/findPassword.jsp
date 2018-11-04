<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<title>비밀 번호 찾기</title>
</head>

<body class="bg-dark">
	<div class="container" style="padding-top: 5%">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">비밀번호 찾기</div>
			<div class="card-body">
				<div class="text-center mb-4">
					<h4>비밀번호를 잊어 버리셨습니까?</h4>
					<p>회원가입시 입력했던 정보를 입력해주세요.</p>
				</div>
				<form action="resetPassword.go" method="post">
					<div class="form-group">
						<div class="form-label-group">        	
							<input type="text" id="m_id" name="m_id" class="form-control" placeholder="ID" required="required" autofocus="autofocus">
							<label for="m_id">ID</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" placeholder="Name" class="form-control" id="m_name" name="m_name" required="required">
							<label for="m_name">Name</label>
						</div>
					</div>
					<select class="form-control" name="m_question" id="m_question" style="margin-bottom: 10pt">
						<option>어머니의 성함은?</option>
						<option>아버지의 성함은?</option>
						<option>감명깊게 읽은 책은?</option>
						<option>어렸을 때 나의 별명은?</option>
						<option>지금 가장 먹고 싶은 음식은?</option>
					</select>
					<div class="form-group">		
						<div class="form-label-group">
							<input type="text" placeholder="Answer" id="m_answer" name="m_answer" class="form-control" required="required">
							<label for="m_answer">Answer</label>
						</div>
					</div>
					<button class="btn btn-primary btn-block">비밀번호 초기화</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="login.go">로그인 페이지</a>
				</div>
			</div>
		</div>
	</div>
</body>
