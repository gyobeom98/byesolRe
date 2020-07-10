<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/byeolsolInfo.css">
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
							<li>별솔리조트</li>
							<li>》</li>
							<li>별솔리조트란?</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">별솔 리조트란?</h3>
					</div>
					<div class="byeolsolInfo">
						<div class="infoImg">
							<h3>소개 이미지</h3>
						</div>
						<div class="infoTitle">
							<h2>
								<b>소개</b>
							</h2>
							<br>
							<div class="infoTxt">
								<h4>대자연에 가까이있는 별솔 빌라</h4>
								<p>별솔빌라에오세요 어쩌구저쩌구별솔빌라에오세요 어쩌구저쩌구별솔빌라에오세요 어쩌구저쩌구별솔빌라에오세요</p>
								<p>어쩌구저쩌구별솔빌라에오세요 어쩌구저쩌구</p>
								<p>별솔빌라에오세요 어쩌구저쩌구별솔빌라에오세요 어쩌구저쩌구별솔빌라에오세요 어쩌구저쩌구 별솔빌라에오세요
									어쩌구저쩌구</p>
							</div>
							<div class="infoImg__2">소개 밑에 넣을 사진</div>
							<ul class="concept">
								<li class="c01"><strong>에코힐링 리조트</strong><br />
								<img src="https://byeolsol.000webhostapp.com/image/nature.jpg"/>
									<p>자연과의 살아있는 교감을 통해 건강한 삶의 방식을 배우고 누를 수 있는 곳</p></li>
								<li class="c02"><strong>스파 리조트</strong><br />
								<img src="https://byeolsol.000webhostapp.com/image/spa.jpg" />
									<p>해발고도 500m 숲 한가운데서 노천 스파를 즐길 수 있는 곳</p></li>
								<li class="c-3"><strong>가족사랑 리조트</strong><br />
								<img src="https://byeolsol.000webhostapp.com/image/family.jpg"/>
									<p>차별화된 가족끼리의 쉼의 가치를 경험할수 있는 곳</p></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>