<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>비밀번호 확인</title>
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">비밀번호 확인</div>
			<div class="card-body">
				<div class="text-center mb-4">
					<h4>비밀번호를 입력해주세요.</h4>
				</div>
				<form action="checkPW.do" method="post">
					<div class="form-group">
						<div class="form-label-group">
							<input type="hidden" name="value" id="value" value="${value}" />
							<input type="hidden" name="m_id" id="m_id" value="${s.m_id}">
							<input type="hidden" name="m_pw" id="m_pw" value="${s.m_pw}">
							<input type="password" id="pw" name="pw" class="form-control" required="required" autofocus="autofocus">
							<label for="pw">Enter password</label>
						</div>
					</div>
					<button class="btn btn-primary btn-block">입력</button>
				</form>
			</div>
		</div>
	</div>
</body>