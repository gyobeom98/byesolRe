<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/admin.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/admin.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<div class="allwrap">
	<div class="wrap">
		<header class="header">
			<jsp:include page="../header/sub.jsp"/>
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
						<li>관리자페이지</li>
						<li>》</li>
						<li>객실예약관리</li>
					</ul>
				</div>
				<div class="sibtitle">
					<h3 class="stitle">객실예약관리</h3>
				</div>
			</div>
			<form onsubmit="return check()" id="regis">
				<div class="content_foot">
					<ul class="flotBox_my_tap">
						<li><a href="/index/adminUser" class="li2">유저정보관리</a></li>
						<li><a href="/index/adminRoom" class="li1">객실예약관리</a></li>
						<li><a href="/index/adminQnA" class="li3">Q&A관리</a></li>
					</ul>
				</div>
				<div class="user_form">
					<div class="keywordForm">
						이름 : <input type="text" id="keyword_name"> 컨셉 : <input
							type="text" id="keyword_room">
					</div>
					<table id="user_list">
						<thead>
							<tr>
								<td>예약번호</td>
								<td>컨셉</td>
								<td>예약자명</td>
								<td>예약ID</td>
								<td>연락처</td>
								<td>입금확인</td>
								<td>인원몇명</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>객실2</td>
								<td>예약한ID</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>미입금</td>
								<td>3명</td>
								<td><input type="button" onclick="location.href=(예약삭제)"
									value="삭제"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</section>
		<footer>
			<jsp:include page="../footer/footer.jsp"/>
		</footer>
	</div>
</div>
</body>
</html>