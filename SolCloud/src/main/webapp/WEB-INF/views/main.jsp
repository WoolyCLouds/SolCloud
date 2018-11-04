<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS-->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin.css" rel="stylesheet">

    <script type="text/javascript" src="resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- 공개키 기반 구조의 암호화 기술 중 하나인 RSA 암호화. 로그인시 사용 -->
	<script type="text/javascript" src="resources/js/rsa_js/rsa.js"></script>
	<script type="text/javascript" src="resources/js/rsa_js/jsbn.js"></script>
	<script type="text/javascript" src="resources/js/rsa_js/prng4.js"></script>
	<script type="text/javascript" src="resources/js/rsa_js/rng.js"></script>
	<script type="text/javascript" src="resources/js/rsa_js/real.js"></script>
	
    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    
</head>
<body>
	<jsp:include page="${page}" />
</body>
</html>