<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/myQnA.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/myQnA.js"></script>
<script type="text/javascript" src="/script/detailMyQnA.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp" />
			</header>
			<div class="subimage">
				<h2>서브 이미지 들어가야함.</h2>
			</div>
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>마이페이지</li>
							<li>》</li>
							<li>나의예약</li>
							<li>》</li>
							<li>예약수정</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">예약수정</h3>
					</div>
				</div>
				<form action="/reserv/updateReserv" method="post">
					<input type="number" readonly="readonly" name="roomNum"
						value="${roomNum}"> <input type="date" name="startDate"
						value="${reserv.startDate}"> <input type="date"
						name="endDate" value="${reserv.endDate }"> <input
						type="number" name="peopleCount" value="${reserv.peopleCount}">
					<input type="submit">
				</form>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp" />
			</footer>
		</div>
	</div>
</body>
</html>