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
							<li>공지사항수정하기</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">공지사항수정하기</h3>
					</div>
					<form action="/board/updateAdminBoard" method="post"
						enctype="multipart/form-data">
						<input type="number" value="${board.id}" name="id" readonly="readonly" style="display:none">
						<table>
							<tr>
								<td>제목</td>
								<td><input type="text" value="${board.title}" name="title"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="content" rows="20" cols="150">${board.content}</textarea>
							</tr>
							<tr>
								<td><img alt="" src="${board.firstPath }" height="50px"></td>
							</tr>
							<tr>
								<td><input type="file" name="uploadFile01"></td>
							</tr>
							<tr>
								<td><img alt="" src="${board.secondPath }" height="50px"></td>
							</tr>
							<tr>
								<td><input type="file" name="uploadFile02"></td>
							</tr>
							<tr>
								<td><img alt="" src="${board.thirdPath }" height="50px"></td>
							</tr>
							<tr>
								<td><input type="file" name="uploadFile03"></td>
							</tr>
						</table>
						<input type="submit" value="수정" id="update_subBtn">
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