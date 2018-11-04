<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script>
	$(document).ready(function() {
		if (${sessionID ne 'admin' && not empty sessionID}) {
			$('#ulInfo').addClass('ml-md-0');
		}
	});
</script>
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
			<c:choose>
				<c:when test="${sessionID ne 'admin' && not empty sessionID}">
					<a class="navbar-brand mr-1" href="boardMain.go">
						<!-- <font size="5">My SolCloud</font> -->
						<img src="resources/image/SolCloud.png" width="150px" height="35px">
					</a>
					<!-- Navbar Search -->
					<form action="board.go" method="post" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
						<div class="input-group" style="width: 300px;">
							<input type="hidden" id="m_id" name="m_id" value="${sessionID }">
							<input type="text" name="searchfname" id="searchfname" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${sessionID eq 'admin'}">
					<a class="navbar-brand mr-1" href="admin.go">
						<img src="resources/image/SolCloud.png" width="150px" height="35px">
					</a>
				</c:when>
			</c:choose>

			<!-- Navbar -->
			<ul class="navbar-nav ml-auto" id="ulInfo"><!--  ml-md-0 -->
				<li class="nav-item dropdown no-arrow">
					<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user-circle fa-fw"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="myInfo.go">My Page</a>
							<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout.do" data-toggle="modal" data-target="#logoutModal">Logout</a>
					</div>
				</li>
			</ul>
		</nav>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">LOGOUT</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">정말 로그아웃 하시겠습니까?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="logout.do">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>