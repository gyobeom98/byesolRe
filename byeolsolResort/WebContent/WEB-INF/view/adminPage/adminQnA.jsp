<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
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
							<li>Q&A현황</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">Q&A현황</h3>
					</div>
				</div>
				<form onsubmit="return check()" id="regis">
					<div class="content_foot">
						<ul class="flotBox_my_tap">
							<li><a href="/index/adminUser" class="li3">유저정보관리</a></li>
							<li><a href="/index/adminRoom" class="li2">객실정보관리</a></li>
							<li><a href="/index/adminQnA" class="li1">Q&A관리</a></li>
						</ul>
					</div>
					<div class="tag">
						<select name="select_qNa" id="select_qNa">
							<option value="전체">전체</option>
							<option value="기타">기타</option>
							<option value="예약">예약문의</option>
							<option value="객실">객실문의</option>
							<option value="식음시설">식음시설</option>
							<option value="관광정보">관광정보</option>
						</select>
					</div>
					<table id="user_list">
						<thead>
							<tr>
								<td>질문번호</td>
								<td>분류</td>
								<td>내용</td>
								<td>name</td>
								<td>작성일</td>
								<td>답변여부</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="q" items="${questionView.questionList }">
							<tr>
								<td>${q.id}</td>
								<td>${q.division }</td>
								<td>${q.message }</td>
								<td>${q.writer }</td>
								<td>${q.regDate }</td>
								<td>${q.state }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="button" onclick="location.href='answerPage'" value="답변">
				</form>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>