<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>게시물 작성</title>
	<style>
		th {
			width: 100px;
		}
		
		div.table-responsive {
			width: 70%;
			margin: 10px auto;
		}
		
		.table th {
			vertical-align: middle;
			text-align: center;
		}
		
		.form-label-group {
			margin-bottom: 0px;
		}
	</style>
	<script>
	function check() {
		
		var pb_file = $('#pb_file option:selected').val();
		var pb_class = $('#pb_class option:selected').val();
		var pb_title = $('#pb_title').val();
		
		console.log(pb_title);
		
		if (pb_class == 2) {
			$('#pb_file').prop('disabled', true);
			if (pb_title != '') {
				$('#btn_submit').prop('disabled', false).addClass('btn-primary');
			} else {
				$('#btn_submit').prop('disabled', true).removeClass('btn-primary');
			}
		} else if (pb_class == 1) {
			$('#pb_file').prop('disabled', false);
			if ((pb_title != '')) {
				$('#btn_submit').prop('disabled', false).addClass('btn-primary');
			} else {
				$('#btn_submit').prop('disabled', true).removeClass('btn-primary');
			}
		} else {
			$('#btn_submit').prop('disabled', true).removeClass('btn-primary');
		}
	}
	</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../board/sideBar.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="publicboardList.go">공유
							게시판</a></li>
					<li class="breadcrumb-item active"><small>게시물 작성</small></li>
				</ol>

				<div class="card card-default">
					<div class="card-header">게시물 정보</div>
					<div class="card-body">
						<form action="publicboardWrite.do" method="post">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
									<tr>
										<th>제목</th>
										<td>
											<div class="form-label-group">
												<input type="text" name="pb_title" id="pb_title" placeholder="title" class="form-control" required="required" oninput="check();">
												<label for="pb_title">title</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>파일</th>
										<td>
											<div class="form-label-group">
												<select class="form-control" name="pb_class" id="pb_class" required="required" onchange="check();">
													<option value="0">분류를 설정해주세요.</option>
													<option value="1">공유</option>
													<option value="2">요청</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th>파일</th>
										<td>
											<div class="form-label-group">
												<select class="form-control" name="pb_file" id="pb_file" onchange="check();" required="required" disabled="disabled">
													<option value="0">공유할 자료를 설정해주세요.</option>
													<c:forEach var="g" items="${list}">
														<option>${g.f_name}</option>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="form-label-group">
												<textarea class="form-control" name="pb_content" id="pb_content" required="required" cols="100" rows="20"></textarea>
											</div>
										</td>
									</tr>
								</table>
								<div class="row" style="float: right; margin-right: 0px;">
									<button type="reset" class="btn btn-danger">다시 작성</button>
									&nbsp;&nbsp;&nbsp;
									<button type="submit" id="btn_submit" class="btn" disabled="disabled">작성</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>