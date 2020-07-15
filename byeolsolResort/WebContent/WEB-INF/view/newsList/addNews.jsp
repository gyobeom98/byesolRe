<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/board1.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/up_addboard.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script src="https://kit.fontawesome.com/c945c12587.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp" />
			</header>
			<div>
				<img class="subimage"
					src="https://gyonewproject.000webhostapp.com/byeolsolResort/event/byeolsolnewssub.jpg">
			</div>
			<section>
				<div class="writ">
					<div class="sibtitle">
						<h3 class="stitle">공지사항</h3>
					</div>
						<form action="/board/addAdminBoard" method="post"
							enctype="multipart/form-data">
							<div class="tableborder">
								<table class="table">
									<tr>
										<td
											style="padding: 0; width: 400px; height: 50px; background: #d4d4d4; border-bottom: 2px solid #969696">제목</td>
										<td style="padding: 0; border-bottom: 2px solid #d4d4d4;" class="tableTd"><input
											class="titleText" type="text" name="title"></td>
									</tr>
									<tr>
										<td style="padding: 0; background: #d4d4d4;">내용</td>
										<td style="padding: 0" class="tableTd"><textarea
												class="content" cols="146" rows="10" name="content"></textarea></td>
									</tr>
								</table>
								
								<div class="addfile">
									<input type="file" name="uploadFile"
										multiple="multiple" id="input_imgs" maxlength="3"
										accept=".jpg,.jpeg,.png">
								</div>
								<div>
									<h1>파일미리보기</h1>
									<div class="imgs_wrap"></div>
								</div>
								
							</div>	
								<div>
									<input class="addbutton" type="submit" value="등록">
								</div>			
								
						</form>
					</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp" />
			</footer>
		</div>
		<c:if test='${userId=="admin"}'>
		<button onclick='updateImg("board","byeolsolnewssub")'>배너이미지 수정</button>
		</c:if>
	</div>
</body>
<script type="text/javascript" src="/script/multiImg.js"></script>
</html>