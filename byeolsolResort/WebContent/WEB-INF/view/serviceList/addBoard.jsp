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
							<li>회원서비스</li>
							<li>》</li>
							<li>후기게시판</li>
							<li>》</li>
							<li>후기작성하기</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">후기작성하기</h3>
					</div>
					<form onsubmit="return check()" action="/board/addBoard"
						method="post" enctype="multipart/form-data">
						<div>
							<table>
								<tr>
									<td class="adrv1">제목</td>
									<td><input name="title" id="text_title"></td>
								</tr>
								<tr>
									<td class="adrv1">내용</td>
									<td><textarea name="content" id="text_contents"></textarea></td>

								</tr>
								<tr>
									<td class="adrv1">파일</td>
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
						</div>
						<input type="submit" id="review_submit" value="작성">
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