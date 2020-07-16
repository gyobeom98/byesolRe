<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%Random random = new Random(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/admin.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/admin.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/script/updateImg.js"></script>
<script type="text/javascript">
window.addEventListener("DOMContentLoaded",function(){
	var errorMessage = "${errorMessage}";
	if(errorMessage != ""){
		alert(errorMessage)
		location.href="/index/main"
	}
})
</script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp"/>
			</header>
			<div class="subbanner">
		<img class="subbanner"
					src="https://gyonewproject.000webhostapp.com/byeolsolResort/myPage/myPageSubimg.jpg?<%=random.nextInt(500)%>">
			</div>					
			<section>
				<div class="writ">
                    <div class="route">
                        <ul>
                            <li>HOME</li>
                            <li>》</li>
                            <li>관리자페이지</li>
                            <li>》</li>
                            <li>Q&A관리</li>
                            <li>》</li>
                            <li>Q&A현황</li>
                        </ul>
                    </div>
                    <div class="sibtitle">
                        <h3 class="stitle">Q&A 답변</h3>
                    </div>
				</div>
				<form onsubmit="return check()" id="regis">
					<div class="content_foot">
						<ul class="flotBox_my_tap">
							<li><a href="/cus/adminUserInfo" class="li1">유저정보관리</a></li>
							<li><a href="/index/adminRoom" class="li2">객실정보관리</a></li>
							<li><a href="/index/adminQnA" class="li3">Q&A관리</a></li>
						</ul>
					</div>
					<div class="qNa_box">
						<div class="qNa_origin">
							<textarea name="" id="" cols="30" rows="10"
								style="border-style: none; resize: none; height: 300px;"
								readonly>(질문원본글가져오기)</textarea>
						</div>
						<div class="qNa_answer">
							답변
							<textarea name="answer_textBox" id="" cols="30" rows="10"
								style="resize: none;"></textarea>
						</div>
						<div class="qNa_btn">
							<input type="reset" onclick="location.href='adminQnA.html'"
								value="취소" id="no"> <input type="submit" value="답변"
								id="qNa_answer_btn">
						</div>
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