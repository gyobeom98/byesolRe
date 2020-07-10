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
							<li>별솔소식</li>
							<li>》</li>
							<li>공지사항</li>
							<li>》</li>
							<li>공지사항작성하기</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">공지사항작성하기</h3>
					</div>
					<form action="/board/addAdminBoard" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td><div>제목</div> </td>
							<td class="tableTd"><input class="titleText" type="text" name="title"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td class="tableTd"><textarea class="content" cols="146" rows="10" name="content"></textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="uploadFile" multiple="multiple" max="3"></td>
						</tr>
					</table>
						<div><input type="submit" value="등록"></div>
					</form>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>