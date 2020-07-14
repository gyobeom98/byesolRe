<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c945c12587.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/script/main.js"></script>

<script type="text/javascript">

window.addEventListener("DOMContentLoaded",function(){
	
	var errorMessage = "${errorMessage}";
	if(errorMessage != ""){
		alert(errorMessage)
		location.href="/index/main"
	}
	//var mainImg = document.querySelector(".mainImg");
	//mainImg.style.backgroundImg = 'url:("http://tjteam.dothome.co.kr/byeolsolResort/mainImg/main.jpg?nocache=${Math.random()}")'
})


function updateImg(classification,value){
	console.log(classification,value)
	location.href="/index/imgUpdate?classification="+classification+"&value="+value;
	
}

</script>

</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
			<jsp:include page="../header/header.jsp"></jsp:include>
			</header>
			<div class="mainImg">
				<div id="center">
					<div class="img1info">
						<div>
							<div class="img1title">CONCEPT 1</div>
							<br>
							<div>
								힐링룸 입니다.
							</div>
							<div class="centerlink">
								<a href="룸1설명">More Info</a><br> <a href="룸1이벤트">Related
									Event</a>
							</div>
						</div>

					</div>
					<div id="img1"></div>
				</div>
			</div>
			<div id="roomInfo">
				<ul>
					<li id="room1"><a href="/index/roomInfo_01">
							<p>
								<span><i class="fas fa-door-closed"></i></span> <br> <span>힐링룸</span>
							</p>
					</a></li>
					<li id="room2"><a href="/index/roomInfo_02">
							<p>
								<span><i class="fas fa-door-closed"></i></span><br> <span>키즈룸</span>
							</p>
					</a></li>
					<li id="room3"><a href="/index/roomInfo_03">
							<p>
								<span><i class="fas fa-door-closed"></i></span><br> <span>게임룸</span>
							</p>
					</a></li>
				</ul>
			</div>
			<div class="scrolldown">SCROLL DOWN</div>
			<div id="mainNotice">
				<div class="inbox">공지사항</div>
				<div class="mainNotic_list">
					<ul>
						<li><a href="공지사항1">공지사항1</a></li>
					</ul>
				</div>
				<div class="more">
					<a href="더보기"><i style="color: lightgrey;" class="fas fa-plus"></i>
						MORE...</a>
				</div>
			</div>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
	<!--  -->
	<button onclick='updateImg("mainImg","main")'>이미지 수정</button>	
</body>
</html>