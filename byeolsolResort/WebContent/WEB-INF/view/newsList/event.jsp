<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet"
	href="/css/footer.css">
<link rel="stylesheet"
	href="/css/header.css">
<link rel="stylesheet" href="/css/event.css">
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
						<div class="sibtitle">
							<h3 class="stitle">이벤트</h3>
						</div>
						<div class="allevent">
							<div class="event_area">
								<div class="event">
									<!-- 반복문 돌릴것 -->
									<ul>
										<li>
											<p class="thmb">
												<a href="#"><img
													src="https://byeolsol.000webhostapp.com/css/img/events/event3.jpg"></a>
											</p> <a class="margin" href="#"><strong>[진행중]함께 이겨내요
													코로나!</strong></a>
											<p class="tx_brief">2020-07-01~2020-07-31</p>
										</li>
									</ul>
								</div>
								<div class="event">
									<ul>
										<li>
											<p class="thmb">
												<a href="#"><img
													src="https://byeolsol.000webhostapp.com/css/img/events/event2.jpg"></a>
											</p> <a href="#"><strong>[종료]가정의 달 1+1 이벤트</strong></a>
											<p class="tx_brief">2020-05-01~2020-06-30</p>
										</li>
									</ul>
								</div>
								<div class="event">
									<ul>
										<li>
											<p class="thmb">
												<a href="#"><img
													src="https://byeolsol.000webhostapp.com/css/img/events/event1.jpg"></a>
											</p> <a href="#"><strong>[종료]봄맞이 할인 이벤트!</strong></a>
											<p class="tx_brief">2020-02-01~2020-03-30</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="paginate">
								<a class="padding pre" href="#" class="">이전</a> <a
									class="padding" href="">1</a> <a class="padding" href="">2</a>
								<a class="padding" href="">3</a> <a class="padding" href="">4</a>
								<a class="padding" href=""><strong>5</strong></a> <a
									class="padding" href="">6</a> <a class="padding" href="">7</a>
								<a class="padding" href="">8</a> <a class="padding" href="">9</a>
								<a class="padding" href="#" class="next">다음</a>
							</div>
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