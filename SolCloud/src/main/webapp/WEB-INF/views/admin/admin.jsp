<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>Admin Page</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../board/sideBar.jsp" />
			<div id="content-wrapper">
				<div class="container-fluid">
					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="admin.go">관리자 페이지</a>
						</li>
						<li class="breadcrumb-item active">
							<small>회원 정보 관리</small>
						</li>
					</ol>
					
					 <!-- DataTables Example -->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table"></i> 회원 정보 보기
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>이름</th>
											<th>우편번호</th>
											<th>주소</th>
											<th>상세주소</th>
											<th>회원관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="g" items="${map.list}">
											<c:if test="${g.m_id ne 'admin'}">
												<tr>
													<td>${g.m_id}</td>
													<td>${g.m_name}</td>
													<td>${g.m_zipcode}</td>
													<td>${g.m_address1}</td>
													<td>${g.m_address2}</td>
													<td><a href="adminDeleteMember.do?m_id=${g.m_id}">회원삭제</a></td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
						</div>
					</div>
					<div class="row" style="margin: 0 auto;">
					<div> <!--  class="col-sm-12 col-md-7" -->
						<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
							<ul class="pagination">
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								<c:if test="${map.boardPager.curPage > 1}">
									<li class="paginate_button page-item previous" id="dataTable_previous">
										<a href="javascript:list('1');" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">처음</a>
									</li>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<li class="paginate_button page-item previous" id="dataTable_previous">
										<a href="javascript:list('${map.boardPager.prevPage};" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전</a>
									</li>
								</c:if>
								
								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${num == map.boardPager.curPage}">
											<li class="paginate_button page-item active">
												<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item">
												<a href="javascript:list('${num}');" aria-controls="dataTable" data-dt-idx="${num}" tabindex="0" class="page-link">${num}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
				
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<li class="paginate_button page-item previous" id="dataTable_previous">
										<a href="javascript:list('${map.boardPager.nextPage};" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">다음</a>
									</li>
								</c:if>
								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage < map.boardPager.totPage}">
									<li class="paginate_button page-item next" id="dataTable_next">
										<a href="javascript:list('${map.boardPager.totPage}');" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">마지막</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>