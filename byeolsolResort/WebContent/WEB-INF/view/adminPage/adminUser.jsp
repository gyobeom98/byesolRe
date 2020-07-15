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
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp" />
			</header>
			<img class="subbanner"
					src="https://gyonewproject.000webhostapp.com/byeolsolResort/myPage/myPageSubimg.jpg">
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>관리자페이지</li>
							<li>》</li>
							<li>유저정보관리</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">유저정보관리</h3>
					</div>
				</div>
				<form onsubmit="return check()" id="regis">
					<div class="content_foot">
						<ul class="flotBox_my_tap">
							<li><a href="/cus/adminUserInfo" class="li1">유저정보관리</a></li>
							<li><a href="/index/adminRoom" class="li2">객실정보관리</a></li>
							<li><a href="/index/adminQnA" class="li3">Q&A관리</a></li>
						</ul>
					</div>
					<div class="user_form">
						<div class="keywordForm">
							이름 : <input type="text" id="keyword_name">
						</div>
						<table id="user_list">
							<thead>
								<tr>
									<td>id</td>
									<td>user_id</td>
									<td>password</td>
									<td>name</td>
									<td>email</td>
									<td>zip_code</td>
									<td>address</td>
									<td>phone</td>
									<td>email_state</td>
									<td>birth_date</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${customerView.customerList }">
									<tr>
										<td>${u.id }</td>
										<td>${u.userId }</td>
										<td>${u.password }</td>
										<td>${u.name }</td>
										<td>${u.email }</td>
										<td>${u.zipCode }</td>
										<td>${u.address }</td>
										<td>${u.phone }</td>
										<td>${u.emailState }</td>
										<td>${u.birthDate }</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp" />
			</footer>
		</div>
		<c:if test='${userId=="admin"}'>
		<button onclick='updateImg("myPage","myPageSub")'>배너이미지 수정</button>
		</c:if>
	</div>
</body>
</html>