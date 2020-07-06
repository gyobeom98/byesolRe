<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/map.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div id="logo">
						<a id="logoimg" href="/index/main"> <img class="logo1"
							src="https://byeolsol.000webhostapp.com/css/title2.png">
						</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a href="/index/byeolsolInfo">별솔리조트</a>
									<ul>
										<li><a class="topmargin" href="/index/byeolsolInfo">별솔리조트란?</a></li>
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
										<li><a class="topmargin" href="/index/leftover">객실예약</a></li>
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
							<li><c:if test="${userId==null}">
									<a href="/cus/login">고객센터</a>
								</c:if> <c:if test="${userId!=null}">
									<a href="/question/addQuestion">고객센터</a>
								</c:if></li>
							<li><span>｜</span></li>
							<li><c:if test="${userId==null}">
									<a href="/cus/login">로그인</a>
								</c:if> <c:if test="${userId!=null}">
									<a href="/cus/logout">로그아웃</a>
								</c:if></li>
							<li><span>｜</span></li>
							<li><c:if test="${userId==null}">
									<a href="/cus/regis">회원가입</a>
								</c:if> <c:if test='${userId!=null && userId!="admin"}'>
									<a href="/cus/myPage">마이페이지</a>
								</c:if> <c:if test='${userId=="admin"}'>
									<a href="/index/adminUser">관리자페이지</a>
								</c:if></li>
						</ul>
					</div>
				</div>
			</header>
			<div id="headerblank"></div>
			<div class="fee_mainImg">
				<img class="subbanner"
					src="https://byeolsol.000webhostapp.com/css/img/roommainsub.jpg">
			</div>
			<section>
				<div class="writ">
					<div id="secheader">
						<div class="route">
							<ul>
								<li>HOME</li>
								<li>》</li>
								<li>별솔리조트</li>
								<li>》</li>
								<li>객실소개</li>
							</ul>
						</div>
						<!-- <div class="border">

                </div> -->
						<div class="sibtitle">
							<h3 class="stitle">오시는길</h3>
						</div>
						<div id="mapinfo">
							<div class="mapinfo">
								주소 : 강원 홍천군 서면 한치골길 262<br> 대표전화 : 1588-4888
							</div>
							<div class="maptitle">
								<div class="con">
									<strong>버스 이용 시</strong> <br>
									<p>홍천군 버스터미널에서 하차 후 택시 이용</p>
									<p class="btnArea_right">
										<a href="https://www.kobus.co.kr/main.do" target="_blank"
											class="downTxtBtn">고속버스 승차권예매</a> <a
											href="https://txbus.t-money.co.kr/intro/intro.html"
											target="_blank" class="downTxtBtn">시외버스 승차권예매</a>
									</p>
								</div>
								<div class="con">
									<strong>열차 이용 시</strong> <br>
									<p>홍천역에서 하차 후 택시이용</p>
									<p class="btnArea_right">
										<a href="http://info.korail.com/mbs/www/index.jsp"
											target="_blank" class="downTxtBtn">코레일 바로가기</a>
									</p>
								</div>
							</div>
							<div class="map">
								<a
									href="https://map.naver.com/v5/search/%EC%86%8C%EB%85%B8%EB%B2%A8%20%EB%B9%84%EB%B0%9C%EB%94%94%ED%8C%8C%ED%81%AC?c=14213184.3730046,4529682.1127625,16,0,0,0,dh"
									target="_blank"><iframe
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3159.107890705158!2d127.67952615341216!3d37.64666745983495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356319cab3692455%3A0x78694b445a04806!2z6rCV7JuQ64-EIO2ZjeyynOq1sCDshJzrqbQg7ZWc7LmY6rOo6ri4IDI2Mg!5e0!3m2!1sko!2skr!4v1593958433438!5m2!1sko!2skr"
										width="600" height="450" frameborder="0" style="border: 0;"
										allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></a>
							</div>
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