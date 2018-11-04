<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>개인정보 확인</title>
	<link href="resources/js/jquery-filestyle.min.css" rel="stylesheet" />
</head>

<body class="bg-dark">
	<div class="container" style="padding-top: 0%;">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">My Page</div>
			<div class="card-body">
			<form action="checkPW.go" method="post">
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_id" id="m_id" class="form-control" readonly="readonly" placeholder="ID" required="required" value="${s.m_id}">
						<label for="m_id">ID</label>
					</div>
				</div>
            	<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_name" id="m_name" class="form-control" readonly="readonly" placeholder="이름" required="required" value="${s.m_name}">
						<label for="m_name">이름</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_zipcode" id="m_zipcode" class="form-control" readonly="readonly" placeholder="우편번호" required="required" value="${s.m_zipcode }">
						<label for="m_zipcode">우편번호</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_address1" id="m_address1" class="form-control" readonly="readonly" placeholder="주소" required="required" value="${s.m_address1 }">
						<label for="m_address1">주소</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_address2" id="m_address2" class="form-control" readonly="readonly" placeholder="주소" required="required" value="${s.m_address2 }">
						<label for="m_address2">상세주소</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="m_question" id="m_question" class="form-control" readonly="readonly" placeholder="질문" required="required" value="${s.m_question }">
						<label for="m_question">질문</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" id="답변" class="form-control" readonly="readonly" placeholder="답변" required="required" value="${s.m_answer }">
						<label for="답변">답변</label>
					</div>
				</div>
				<input type="hidden" id="value" name="value" value="1" />
				<button class="btn btn-primary btn-block">정보 수정</button>
			</form>
			
			<div class="text-center">
				<form id="frm0" action="checkPW.go" method="post" >
					<input type="hidden" id="value" name="value" value="2" />
					<input type="hidden" id="m_id" name="m_id" value="${sessionID}"> 
					<a class="d-block small mt-3" href="#" onclick="document.getElementById('frm0').submit();">회원 탈퇴</a>
				</form>
				<form id="frm1" action="boardMain.go" method="post" >
					<input type="hidden" id="m_id" name="m_id" value="${sessionID}"> 
					<a class="d-block small mt-3" href="#" onclick="document.getElementById('frm1').submit();">클라우드로</a>
				</form>
			</div>
			</div>
		</div>
	</div>
</body>