<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
	<meta charset="UTF-8">
	<title>My Cloud</title>
	<link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="resources/js/fileupload.js"></script>
	<script>
		//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
		function list(page){
			location.href="board.go?curPage="+page+"&searchfname=${map.searchfname}";
		}
	</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="sideBar.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="board.go">개인 자료실</a></li>
					<li class="breadcrumb-item active"><small>자료 목록보기</small></li>
				</ol>
				
				<div class="card card-default">
					<div class="card-header">
						<h3 class="panel-title">File Upload</h3>
					</div>
					<div class="card-body">
						<form action="uploadfile.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="m_id" id="m_id" value="${m_id}">
							<!-- COMPONENT START -->
							<div class="form-group">
								<div class="input-group input-file">
									<input type="text" class="form-control"
										placeholder='Choose a file...' /> <span
										class="input-group-btn">
										<button class="btn btn-default btn-choose" type="button">Choose</button>
									</span>
								</div>
							</div>
							<!-- COMPONENT END -->
							<div class="form-group" style="text-align: -webkit-right;">
								<button type="reset" class="btn btn-danger">Reset</button>
								&nbsp;&nbsp;&nbsp;
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="card card-default" style="margin: 0 20px;">
				<div class="row">
					<c:forEach var="b" items="${map.list}">
						<div class="col-xs-6 col-md-2" style="text-align: center; margin: 20px 20px 40px 20px;">
							<a href="javascript:downLink('${sessionID}','${b.f_name}');">
								<img src="${b.f_icon}" height="120px" title="${b.f_name}" />
							</a>
							<div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
								<font size="2pt" color="gray">
									${b.f_name}<br />
									${b.f_size} MB<br />
									<fmt:formatDate	value="${b.f_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /><br />
									<c:choose>
									    <c:when test="${b.f_share eq 1}">
											<a href="javascript:shareLink('${sessionID}','${b.f_name}', 0);"><font size="2pt" color="blue">공유해제</font></a>
									    </c:when>
									    <c:when test="${b.f_share eq 0}">
											<a href="javascript:shareLink('${sessionID}','${b.f_name}', 1);"><font size="2pt" color="gray">공유설정</font></a>
									    </c:when>
									</c:choose>
									<a href="javascript:delLink('${sessionID}','${b.f_name}');"><font size="2pt" color="red">삭제하기</font></a>
								</font>
							</div>
						</div>
					</c:forEach>
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
</body>
