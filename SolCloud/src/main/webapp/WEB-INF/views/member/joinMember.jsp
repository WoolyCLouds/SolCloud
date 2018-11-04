<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript" src="resources/js/checkjoin.js"></script>
	<style>p{margin-bottom: 0px;}</style>
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">회원 가입</div>
			<div class="card-body">
				<form class="form-horizontal" action="joinMember.do" method="post" name="joinMember">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" class="form-control" required="required" placeholder="Enter new ID" id="m_id" name="m_id" autofocus="autofocus" oninput="idchk();">
									<label for="m_id">ID</label>
								</div>
								<p align="right"><small id="idcheck"></small></p>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" class="form-control" required="required" placeholder="Enter Name" id="m_name" name="m_name" oninput="namechk();">
									<label for="m_name">Name</label>
								</div>
								<p align="right"><small id="namecheck"></small></p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" class="form-control" required="required" placeholder="Enter Password" id="m_pw" name="m_pw" oninput="pw();">
									<label for="m_pw">Password</label>
								</div>
								<p align="right"><small id="pwcheck"></small></p>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" class="form-control" required="required" placeholder="Repeat Password" id="m_pwc" name="m_pwc" oninput="pwc();">
									<label for="m_pwc">Repeat Password</label>
								</div>
								<p align="right"><small id="equalcheck"></small></p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-9">
								<div class="form-label-group">
									<input type="text" class="form-control postcodify_postcode5" required="required" placeholder="Search Your Address" id="m_zipcode" name="m_zipcode" readonly="readonly" oninput="zip();">
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
							<input type="text" class="form-control postcodify_address" required="required" placeholder="Search Your Address" id="m_address1" name="m_address1" readonly="readonly" oninput="add1();">
							<label for="m_address1">Address</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control" required="required" placeholder="Enter Your Address" id="m_address2" name="m_address2" oninput="add2();">
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
							<input type="text" class="form-control" required="required" placeholder="Enter Your Answer" id="m_answer" name="m_answer" oninput="ans();">
							<label for="m_answer">Answer</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-0 col-sm-12 text-center">
							<button type="reset" class="btn btn-default btn-lg btn-danger">다시 작성</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-lg" disabled="disabled">회원가입</button>
							<a class="d-block small mt-3" href="login.go">뒤로 가기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>