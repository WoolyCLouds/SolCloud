<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>공유 게시판 - 상세보기</title>
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
		function replace(inum) {
			inum = inum.replace(/&/g,"%26"); 
			inum = inum.replace(/\+/g,"%2B"); 
			return inum;
		}
	
		function downloadShare (m, i) {
			var name = replace(i);
			console.log(name);
			location.href="downloadShare?pb_writer="+m+"&pb_file="+name;
		}
		
		function deletePublicboard (m) {
			var con = confirm ('정말 삭제하겠습니까?');
			var pb_num = m;
			if (con) {
				location.href='deletePublicboard?pb_num='+pb_num;
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
					<li class="breadcrumb-item active"><small>게시물 상세보기</small></li>
				</ol>

				<div class="card card-default">
					<div class="card-header">게시물 정보</div>
					<div class="card-body">
						<form action="">
							<div class="table-responsive">
								<c:forEach var="g" items="${detail}">
									<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
										<tr>
											<th>제목</th>
											<td>
												<div class="form-label-group">
													<font>${g.pb_title}</font>
												</div>
											</td>
										</tr>
										<tr>
											<th>파일</th>
											<td>
												<div class="form-label-group">
													<a href="javascript:downloadShare('${g.pb_writer}','${g.pb_file}');">${g.pb_file}</a>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-label-group">
													<textarea class="form-control" name="" id="" cols="100"
														rows="20" readonly="readonly">${g.pb_content}</textarea>
												</div>
											</td>
										</tr>
									</table>
									<div class="row" style="float: right; margin-right: 0px;">
										<button type="button" class="btn" onclick="javascript:location.href='publicboardList.go';">목록</button>
										<c:if test="${sessionID eq g.pb_writer}">
											&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger"
												onclick="javascript:deletePublicboard('${g.pb_num}');">삭제</button>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>