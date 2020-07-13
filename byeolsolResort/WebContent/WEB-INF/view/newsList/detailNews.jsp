<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/board.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp"/>
			</header>
			<img  src="http://tjteam.dothome.co.kr/byeolsolResort/board/byeolsolnewssub.jpg"
				 class="subimage">
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>별솔소식</li>
							<li>》</li>
							<li>별솔뉴스</li>
							<li>》</li>
							<li>공지사항</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">공지사항</h3>
					</div>
					<div>
						<c:if test='${userId=="admin"}'>
							<button onclick="goAdminUpdate(${board.id})" class="update_btn">수정</button>
						</c:if>
					</div>
					<table>
						<tr>
							<td>제목</td>
							<td>${board.title }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${board.userId}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${board.content}</td>
						</tr>
						<tr>
							<c:if test="${board.firstPath!=null }">
							<td rowspan="3">사진</td>
							<td><img src="${board.firstPath }"></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${board.secondPath!=null }">
							<td><img src="${board.secondPath }"></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${board.thirdPath!=null }">
							<td><img src="${board.thirdPath }"></td>
							</c:if>
						</tr>
					</table>
					<div>
						<c:if test='${userId=="admin"}'>
							<button onclick="goAdminDelete(${board.id})" class="update_btn">삭제</button>
						</c:if>
					</div>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>