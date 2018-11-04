<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>DashBoard</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Page level plugin JavaScript-->
<script src="resources/vendor/chart.js/Chart.min.js"></script>
<script src="resources/vendor/datatables/jquery.dataTables.js"></script>
<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>
<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
	
			var data = google.visualization.arrayToDataTable([
				['사용한 용량', '클라우드 공간'],
				['사용한 용량', ${usedCapacity}],
				['남아있는 용랑', 2048-${usedCapacity}]
			]);
			
			var options = {
				title: '총 2GB',
				slices: {
					0: { color: '#DF013A' },
					1: { color: '#BDBDBD' },
				}
			};
	
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
			chart.draw(data, options);
		}
	</script>
	<script>
		function check() {
			
			var val = $('#f_share option:selected').val();
			
			<c:forEach var="g" items="${list}">
				if (val == '${g.f_name}') {
					console.log('test');
					$('#f_size').text('${g.f_size} MB');
					$('#f_date').html('<fmt:formatDate	value="${g.f_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />');
				}
			</c:forEach>
			
			if (val != 0) {
				$('#unshare').prop('disabled', false).addClass('btn-primary');
			} else {
				$('#f_size').text('');
				$('#f_date').text('');
				$('#unshare').prop('disabled', true).removeClass('btn-primary');
			}
				
		}
		
		function replace(inum) {
			inum = inum.replace(/&/g,"%26"); 
			inum = inum.replace(/\+/g,"%2B"); 
			return inum;
		}
		
		function unshare () {
			var val = $('#f_share option:selected').val();
			var name = replace(val);
			location.href="shareCheck?m_id=${sessionID}&f_name="+name+"&f_share=0&view=dashboard";
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
					<li class="breadcrumb-item"><a href="board.go">나의 자료실</a></li>
					<li class="breadcrumb-item active"><small>자료실 용량 이용 상황 및 자료 공유 현황</small></li>
				</ol>

				<!-- Icon Cards-->
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-3">
							<div class="card-header">자료실 이용 현황</div>
							<div class="card-body">
								<div>
									<!--  class="col-xl-3 col-sm-6 mb-3" -->
									<div class="card text-white bg-primary o-hidden h-100">
										<div class="card-body">
											<div class="card-body-icon">
												<img src="resources/image/file.png"></img>
											</div>
											<div class="mr-5">${count} Files</div>
										</div>
										<a class="card-footer text-white clearfix small z-1"
											href="board.go"> <span class="float-left">View
												Details</span> <span class="float-right"> <i
												class="fas fa-angle-right"></i>
										</span>
										</a>
									</div>
								</div>
								<br />
								<div>
									<!--  class="col-xl-3 col-sm-6 mb-3" -->
									<div class="card text-white bg-warning o-hidden h-100">
										<div class="card-body">
											<div class="card-body-icon">
												<img src="resources/image/cloud.png" />
											</div>
											<div class="mr-5">
												<fmt:formatNumber value="${usedCapacity/1024}"
													pattern="0.00" />
												GB / 2 GB
											</div>
										</div>
										<a class="card-footer text-white clearfix small z-1"
											href="board.go"> <span class="float-left">View
												Details</span> <span class="float-right"> <i
												class="fas fa-angle-right"></i>
										</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-3">
							<div class="card-header">공유한 나의 자료</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<thead>
											<tr>
												<th>파일 이름</th>
												<th>용량</th>
												<th>올린 날짜</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<div class="form-label-group">
														<select class="form-control" name="f_share" id="f_share" onchange="check();">
															<option value="0">공유한 파일 리스트</option>
															<c:forEach var="g" items="${list}">
																<option>${g.f_name}</option>
															</c:forEach>
														</select>
													</div>
												</td>
												<td id="f_size"></td>
												<td id="f_date"></td>
											</tr>
										</tbody>
									</table>
								</div>
									<div class="form-label-group" style="text-align: right;">
										<button class="btn" onclick="unshare();" id="unshare" disabled="disabled">공유해제</button>
									</div>
							</div>
						</div>
					</div>
				</div>
				<br />
				<br />
				<br />
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="publicboardList.go">자료 공유</a></li>
					<li class="breadcrumb-item active"><small>남은 공간 및 게시판 현황</small></li>
				</ol>

				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-3">
							<div class="card-header">
								<i class="fas fa-chart-pie"></i> 클라우드 남은 공간
							</div>
							<div class="card-body">
								<div id="piechart" style="width: 600px; height: 500px;"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-3">
							<div class="card-header">내가 작성한 게시물</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<thead>
											<tr>
												<th>제목</th>
												<th>올린 날짜</th>
												<th>올린 파일</th>
												<th>조회 수</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach var="b" items="${publicboard}">
											<tr>
													<td><font><small>${b.pb_title}</small></font></td>
													<td><font><small><fmt:formatDate value="${b.pb_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></small></font></td>
													<td><font><small>${b.pb_file}</small></font></td>
													<td><font><small>${b.pb_viewcnt}</small></font></td>
													
											</tr>
												</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
