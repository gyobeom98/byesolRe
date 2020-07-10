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
			<div class="subimage">
				<h2>서브 이미지 들어가야함.</h2>
			</div>
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>회원서비스</li>
							<li>》</li>
							<li>후기게시판</li>
							<li>》</li>
							<li>댓글수정</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">댓글수정</h3>
					</div>
				</div>
				<form action="/question/updateAnswer" method="post">
					<table>
						<tr>
							<td><input type="number" value="${answer.id}"
								readonly="readonly" name="id" class="hide"></td>
						</tr>
						<tr>
							<td><input type="text" class="hide" name="title" value="${answer.title}"></td>
						</tr>
						<tr>
							<td><textarea rows="20" cols="20" name="message">
						${answer.message }
						</textarea></td>
						</tr>
					</table>
					<div>
						<input type="submit">
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