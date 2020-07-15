<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/board1.css">
<link rel="stylesheet" href="/css/notice.css">
<link rel="stylesheet" href="/css/header.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/board.js"></script>
<script src="https://kit.fontawesome.com/c945c12587.js" crossorigin="anonymous"></script>
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
					<div class="route" style="padding:0;">
						<ul style="padding-left: 650px;">
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
					<div class="tableborder2">
						<table class="detailtable">
						<tbody>
							<tr style=" background: #d4d4d4;border-bottom: 2px solid #c9c9c9;">
								<td class="detailleft">작성자</td>
								<td class="detailright">별솔</td>
							</tr>
							<tr style="border-bottom: 2px solid #c9c9c9;">
								<td class="detailleft">제목</td>
								<td class="detailright"><b>${board.title }</b></td>
							</tr>
							<tr>
								<td colspan="2" style="width:100%;padding-top: 50px; padding-bottom: 50px;">
										<td class="text"><textarea rows="8" cols="150" name="context" class="context">${board.content}</textarea> </td>
								</td>
							</tr>
							<c:if test="${board.firstPath!=null }">
							<tr id="photo" class="photo">
								<c:if test="${board.firstPath!=null }">
								<td><img class="detailImg" src="${board.firstPath}"></td>
								</c:if>
							</tr>
							<tr class="photo">
								<c:if test="${board.secondPath!=null }">
								<td><img class="detailImg" src="${board.secondPath }"></td>
								</c:if>
							</tr>
							<tr class="photo">
								<c:if test="${board.thirdPath!=null }">
								<td><img class="detailImg" src="${board.thirdPath }"></td>
								</c:if>
							</tr>
							</c:if>
							</tbody>
						</table>
						<div class="button">
						<div>
							<c:if test='${userId=="admin"}'>
								<button onclick="goAdminUpdate(${board.id})" class="update_btn">수정</button>
							</c:if>
						</div>
						<div>
							<c:if test='${userId=="admin"}'>
								<button onclick="goAdminDelete(${board.id})" class="update_btn">삭제</button>
							</c:if>
						</div>
					</div>
					</div>
					
					
					<a href="javascript:history.back()"><i class="fas fa-arrow-left"></i></a>
				</div>
				
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>