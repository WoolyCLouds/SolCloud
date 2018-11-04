<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>회원 정보 수정</title>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
</head>

<body class="bg-dark">
	<div class="container" style="padding-top: 0%">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">회원 정보 수정</div>
			<div class="card-body">
				<form class="form-horizontal" action="updateMemberInfo.do" method="post">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" class="form-control" required="required" readonly="readonly" placeholder="Enter new ID" id="m_id" name="m_id" autofocus="autofocus" value="${s.m_id }">
									<label for="m_id">ID</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" class="form-control" required="required" readonly="readonly" placeholder="Enter Name" id="m_name" name="m_name" value="${s.m_name }">
									<label for="m_name">Name</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" class="form-control" required="required" placeholder="Enter Password" id="m_pw" name="m_pw" value="${s.m_pw }">
									<label for="m_pw">Password</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" class="form-control" required="required" placeholder="Repeat Password" id="m_pwc" name="m_pwc" value="${s.m_pw }" onchange="isSame()">
									<label for="m_pwc">Repeat Password</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-9">
								<div class="form-label-group">
									<input type="text" class="form-control postcodify_postcode5" required="required" placeholder="Search Your Address" id="m_zipcode" name="m_zipcode" readonly="readonly" value="${s.m_zipcode }">
									<label for="m_zipcode">ZipCode</label>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-label-group">
									<button style="padding: 12px;" class="btn btn-default btn-block" type="button" id="postcodify_search_button">Search</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control postcodify_address" required="required" placeholder="Search Your Address" id="m_address1" name="m_address1" readonly="readonly" value="${s.m_address1 }">
							<label for="m_address1">Address</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control" required="required" placeholder="Enter Your Address" id="m_address2" name="m_address2" value="${s.m_address2 }">
							<label for="m_address2">Detail Address</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<select class="form-control" name="m_question" id="m_question">
								<option>어머니의 성함은?</option>
								<option>아버지의 성함은?</option>
								<option>감명깊게 읽은 책은?</option>
								<option>어렸을 때 나의 별명은?</option>
								<option>지금 가장 먹고 싶은 음식은?</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control" required="required" placeholder="Enter Your Answer" id="m_answer" name="m_answer" value="${s.m_answer }">
							<label for="m_answer">Answer</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-0 col-sm-12 text-center">
							<button type="reset" class="btn btn-default btn-lg btn-danger">다시 작성</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-lg btn-primary">정보 수정</button>
						</div>
					</div>
				</form>
			<div class="text-center">
				<form id="frm1" action="boardMain.go" method="post" >
					<input type="hidden" id="m_id" name="m_id" value="${sessionID}"> 
					<a class="d-block small mt-3" href="#" onclick="document.getElementById('frm1').submit();">클라우드로</a>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>