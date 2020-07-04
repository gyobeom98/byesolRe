<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/test1.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div id="logo">
						<a id="logoimg" href="/index/main">
						<img class="logo1" src="https://byeolsol.000webhostapp.com/css/title2.png"> 
						</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a href="/index/byeolsolInfo">별솔리조트</a>
									<ul>
										<li><a class="topmargin"
											href="/index/byeolsolInfo">별솔리조트란?</a></li>
										<li><a href="/index/roomMain">객실소개</a></li>
										<li><a href="/index/fee">이용안내</a></li>
										<li><a href="/index/map">오시는길</a></li>
									</ul></li>
								<li><a href="/index/news">별솔소식</a>
									<ul>
										<li><a class="topmargin" href="/index/news">별솔뉴스</a></li>
										<li><a href="/index/event">이벤트</a></li>
									</ul></li>
								<li><a href="">회원 서비스</a>
									<ul>
										<li><a class="topmargin"
											href="/index/leftover">객실예약</a></li>
										<li><a href="/index/guestroom">객실현황</a></li>
										<li><a href="/index/board">후기게시판</a></li>
									</ul></li>
								<li><a href="">주변관광지</a>
									<ul>
										<li><a class="topmargin" href="/index/trip">여행코스</a></li>
										<li><a href="/index/golf">골프코스</a></li>
										<li><a href="/index/mount">등산코스</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<div id="side">
						<ul>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/login" >고객센터</a>
							</c:if>
							<c:if test="${userId!=null}">
							<a href="/question/addQuestion">고객센터</a>
							</c:if>
							</li>
							<li>
							<span>｜</span>
							</li>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/login" >로그인</a>
							</c:if>
							<c:if test="${userId!=null}">
							<a href="/cus/logout">로그아웃</a>
							</c:if>
							</li>
							<li><span>｜</span></li>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/regis" >회원가입</a>
							</c:if>
							<c:if test='${userId!=null && userId!="admin"}'>
							<a href="/cus/myPage">마이페이지</a>
							</c:if>
							<c:if test='${userId=="admin"}'>
							<a href="/index/adminUser">관리자페이지</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
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
								<li class="c01"><strong>에코힐링 리조트</strong>
									<p>자연과의 살아있는 교감을 통해 건강한 삶의 방식을 배우고 누를 수 있는 곳</p></li>
								<li class="c02"><strong>스파 리조트</strong>
									<p>해발고도 500m 숲 한가운데서 노천 스파를 즐길 수 있는 곳</p></li>
								<li class="c-3"><strong>가족사랑 리조트</strong>
									<p>차별화된 가족끼리의 쉼의 가치를 경험할수 있는 곳</p></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<footer>
				<div id="fnb">
					<ul>
						<li><a href="/index/about">회사소개</a></li>
						<li><a class="bold" href="/index/privacy">개인정보처리방침</a></li>
						<li><a class="bold" href="/index/operation">영상정보처리기기운영관리방침</a></li>
						<li><a href="/index/termsofuse">이용약관</a></li>
						<li><a href="/index/emailcollection">이메일무단수집거부</a></li>
					</ul>
				</div>
				<address class="address">
					<ul>
						<li class="line">별솔리조트</li>
						<li>대한민국 어디도 저기구 아마로</li>
						<li>사업자등록번호: <span>1234-1234-1234</span></li>
						<li>통신판매업신고 <span>1111</span>-플밍플밍-<span>2222</span></li>
					</ul>
					<ul>
						<li>예약문의: <a href="예약">02-000-0000</a></li>
						<li>단체문의: <a href="단체">02-111-1111</a></li>
						<li>회원권 분양문의: <a href="회원권">02-222-2222</a></li>
					</ul>
					<ul>
						<li>본 페이지는 TJ손해보험과 개인정보 배상책임보험을 체결하여 회원 개인정보를 보호하고 있습니다</li>
					</ul>
				</address>
			</footer>
		</div>
	</div>
</body>
</html>