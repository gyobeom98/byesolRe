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
				<jsp:include page="../header/sub.jsp" />
			</header>
			<img
				src="http://tjteam.dothome.co.kr/byeolsolResort/board/byeolsolnewssub.jpg"
				class="subimage">
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
					<form action="/board/addAdminBoard" method="post"
						enctype="multipart/form-data">
						<table>
							<tr>
								<td><div>제목</div></td>
								<td class="tableTd"><input class="titleText" type="text"
									name="title"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="tableTd"><textarea class="content" cols="146"
										rows="10" name="content"></textarea></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><input type="file" name="uploadFile"
									multiple="multiple" id="input_imgs" maxlength="3"
									accept=".jpg,.jpeg,.png"></td>
							</tr>
							<tr>
								<td colspan="2">
									<h1>파일미리보기</h1>
									<div class="imgs_wrap"></div>
								</td>
							</tr>
						</table>
						<div>
							<input type="submit" id="review_submit" value="등록">
						</div>
					</form>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp" />
			</footer>
		</div>
	</div>
</body>
<script type="text/javascript" src="/script/multiImg.js"></script>
</html>