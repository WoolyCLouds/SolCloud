<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar -->
<ul class="sidebar navbar-nav">
	<c:choose>
		<c:when test="${sessionID ne 'admin' && not empty sessionID}">
			<li class="progress" style="width: 90%; margin-left: 9px; margin-top: 9%;" >
	  			<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="${UC}" aria-valuemin="0" aria-valuemax="100" style="width: ${UC }%;">
	   				<font color="black"><strong>사용량 ${UC}%</strong></font>
	  			</div>
			</li>
			<li class="nav-item active" style="height: 30px">
				<form id="frm1" action="boardMain.go" method="post">
					<input type="hidden" id="m_id" name="m_id" value="${sessionID}">
					<a href="#" onclick="document.getElementById('frm1').submit();"	class="nav-link">
						<i class="fas fa-fw fa-tachometer-alt"></i>
						<span>Dashboard</span>
					</a>
				</form>
			</li>
			<li class="nav-item active" style="height: 30px">
				<form id="frm2" action="board.go" method="post">
					<input type="hidden" id="m_id" name="m_id" value="${sessionID }">
					<a href="#" onclick="document.getElementById('frm2').submit();" class="nav-link">
						<i class="fas fa-fw fa-folder"></i>
						<span>My Cloud</span>
					</a>
				</form>
			</li>
			<li class="nav-item active" style="height: 30px">
				<form id="frm3" action="publicboardList.go" method="post">
					<input type="hidden" id="m_id" name="m_id" value="${sessionID }">
					<a href="#" onclick="document.getElementById('frm3').submit();" class="nav-link">
						<i class="fas fa-fw fa-folder"></i>
						<span>Share Board</span>
					</a>
				</form>
			</li>
		</c:when>
		<c:when test="${sessionID eq 'admin'}">
			<li class="nav-item active" style="height: 30px">
				<form id="frm2" action="admin.go" method="post">
					<input type="hidden" id="m_id" name="m_id" value="${sessionID}">
					<a href="#" onclick="document.getElementById('frm2').submit();" class="nav-link">
						<i class="fas fa-fw fa-folder"></i>
						<span>Admin Page</span>
					</a>
				</form>
			</li>
		</c:when>
	</c:choose>
</ul>