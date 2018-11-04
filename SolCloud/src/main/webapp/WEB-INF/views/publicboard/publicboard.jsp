<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>공유 게시판</title>
	<script>
		//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
		function list(page){
			location.href="board.go?curPage="+page+"&searchfname=${map.searchfname}";
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
						<li class="breadcrumb-item"><a href="publicboardList.go">공유 게시판</a></li>
						<li class="breadcrumb-item active"><small>게시물 목록보기</small></li>
					</ol>
					
					<!-- DataTables Example -->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table"></i> 공유 게시판
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead>
										<tr>
											<th>No</th>
											<th>분류</th>
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="g" items="${map.list}">
											<tr>
												<td>${g.pb_num}</td>
												<td>
													<c:choose>
														<c:when test="${g.pb_class == 1}">
															공유
														</c:when>
														<c:when test="${g.pb_class == 2}">
															요청
														</c:when>
													</c:choose>
												</td>
												<td><a href="publicboardDetail?pb_num=${g.pb_num}">${g.pb_title}</a></td>
												<td>${g.pb_writer}</td>
												<td><fmt:formatDate value="${g.pb_date}"
														pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
												<td>${g.pb_viewcnt}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row" style="float: right; padding-right: 20px;">
								<button class="btn btn-primary" onclick="javascript:location.href='publicboardWrite.go?m_id=${sessionID}';">게시물 작성</button>
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