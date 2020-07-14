<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/event.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/event.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp" />
			</header>
			<div id="headerblank"></div>
			<div class="fee_mainImg">
				<img class="subbanner"
					src="https://byeolsol.000webhostapp.com/css/img/byeolsolnewssub.jpg">
			</div>
			<section>
				<div class="writ">
					<div id="secheader">
						<div class="route">
							<ul>
								<li>HOME</li>
								<li>》</li>
								<li>별솔소식</li>
								<li>》</li>
								<li>이벤트</li>
							</ul>
						</div>
						<form action="/event/updateEvent" method="post"
							enctype="multipart/form-data">
							<input class="hide" type="number" name="id" value="${event.id}"
								readonly="readonly">
							<table>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" value="${event.title}"></td>
								</tr>
								<tr>
									<td>이벤트 기간</td>
									<td>
									<input type="date" name="start" value="${event.startDate}">
									<input type="date" name="end" value="${event.endDate}">
									미상시<input type="radio" name="state" value="미상시">
									상시<input type="radio" name="state" value="상시">
									</td>
								</tr>
								<tr>
									<td>메인이미지</td>
									<td><input type="file" name="thumbnail" id="upload"></td>
								</tr>
								<tr>
									<td colspan="2">
										<div id="preview"></div>
									</td>
								</tr>
								<tr>
									<td>내용이미지</td>
									<td><input type="file" name="uploadFile" id="upload1"></td>
								</tr>
								<tr>
									<td colspan="2">
										<div id="preview1"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp" />
			</footer>
		</div>
	</div>
</body>
<script type="text/javascript" src="/script/imgView.js"></script>
</html>