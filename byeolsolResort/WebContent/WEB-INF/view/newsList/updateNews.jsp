<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/up_addboard.css">
<link rel="stylesheet" href="/css/board1.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<script src="https://kit.fontawesome.com/c945c12587.js" crossorigin="anonymous"></script>
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
			<div>
				<img class="subimage"
					src="https://byeolsol.000webhostapp.com/css/img/byeolsolnewssub.jpg">
			</div>
			<section>
				<div class="writ">
					<div class="sibtitle">
						<h3 class="stitle">공지사항</h3>
					</div>
					<form action="/board/updateAdminBoard" method="post"
						enctype="multipart/form-data">
						<input type="number" value="${board.id}" name="id" readonly="readonly" style="display:none">
						
					<div class="tableborder">
						<table class="table">
							<tr>
								<td style="padding:0; width:400px; height:50px; background: #d4d4d4; border-bottom: 2px solid #969696">제목</td>
								<td style="padding:0; border-bottom: 2px solid #d4d4d4"><input class="input1" type="text" value="${board.title}" name="title"></td>
							</tr>
							<tr>
								<td style="padding:0;background: #d4d4d4;">내용</td>
								<td style="padding:0;"><textarea class="textarea" name="content">${board.content}</textarea>
							</tr>
						</table>
						<div class="allimg">
							<div class="imgfile">
								<input type="file" name="uploadFile01" id="upload">
								<img alt="" src="${board.firstPath}" height="50px">
								<div id="preview"></div>
							</div>
							<div class="imgfile">
								<input type="file" name="uploadFile02" id="upload1">
								<img alt="" src="${board.secondPath }" height="50px">
								<div id="preview1"></div>
							</div>
							<div class="imgfile">
								<input type="file" name="uploadFile03" id="upload2">
								<img alt="" src="${board.thirdPath }" height="50px">
								<div id="preview2"></div>
							</div>
						</div>
					</div>	
					<input type="submit" value="수정" id="update_subBtn">
					</form>
					<a href="javascript:history.back()"><i class="fas fa-arrow-left"></i></a>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
		<c:if test='${userId=="admin"}'>
		<button onclick='updateImg("updateNews","main")'>배너이미지 수정</button>
		</c:if>
	</div>
</body>
<script type="text/javascript" src="/script/imgView.js"></script>
</html>