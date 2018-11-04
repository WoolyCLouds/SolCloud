<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>비밀번호 초기화</title>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript" src="resources/js/resetpwd.js"></script>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">비밀번호 확인</div>
				<div class="card-body">
					<div class="text-center mb-4">
						<h4>비밀번호를 재설정해주세요.</h4>
					</div>
					<form action="updatePW.do" method="post">
						<input type="hidden" name="m_id" id="m_id" value="${id}">
							<div class="form-group">
								<div class="form-label-group">
									<input type="password" class="form-control" placeholder="비밀번호" name="m_pw" id="m_pw" required="required" autofocus="autofocus" oninput="pw();">
									<label for="m_pw">비밀번호</label>
								</div>
								<p align="right"><small id="pwcheck"></small></p>
							</div>
						<div class="form-group" style="margin-bottom: 0px;">
							<div class="form-label-group">		
								<input type="password" id="m_pwc" name="m_pwc" placeholder="비밀번호 재확인" class="form-control" required="required" oninput="pwc();">
								<label for="m_pwc">비밀번호 재확인</label>
							</div>
							<p align="right"><small id="equalcheck"></small></p>
						</div>
						
					<button type="submit" class="btn btn-primary btn-block" disabled="disabled">입력</button>
				</form>
			</div>
		</div>
	</div>
</body>
