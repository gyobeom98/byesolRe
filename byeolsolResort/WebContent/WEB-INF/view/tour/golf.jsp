<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<link rel="stylesheet" href="/css/golf.css">
<script src="https://kit.fontawesome.com/c945c12587.js" crossorigin="anonymous"></script>
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
										<li><a class="topmargin" href="/board/adminList">별솔뉴스</a></li>
										<li><a href="/index/event">이벤트</a></li>
									</ul></li>
								<li><c:if test="${userId==null }">
										<a href="/cus/login">회원 서비스</a>
									</c:if> <c:if test="${userId!=null }">
										<a href="/index/leftover">회원 서비스</a>
									</c:if>
									<ul>
										<li><c:if test="${userId==null }">
												<a class="topmargin" href="/cus/login">객실예약</a>
											</c:if> <c:if test="${userId!=null }">
												<a class="topmargin" href="/index/leftover">객실예약</a>
											</c:if></li>
										<li><a href="/index/guestroom">객실현황</a></li>
										<li><a href="/board/list">후기게시판</a></li>
									</ul></li>
								<li><a href="/index/trip">주변관광지</a>
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
			<img class="subbanner"
				src="https://byeolsol.000webhostapp.com/css/img/tour/golf/toursub.jpg">
			<section>
				<div class="writ">
					<div id="secheader">
						<div class="route">
							<ul>
								<li>HOME</li>
								<li>》</li>
								<li>주변관광지</li>
								<li>》</li>
								<li>골프코스</li>
							</ul>
						</div>
						<div class="sibtitle">
							<h3 class="stitle">골프코스</h3>
						</div>
					</div>

					<div id="allcourse">
						<div class="golftitle">산과 하늘이 맞닿는 곳에서 즐기는 청량한 즐거움, 별솔골프장</div>
						<div class="golfinfo" style="border-bottom: 1px solid #E4E1E1;">
							<p>
								별솔 회원권 보유객은 별솔 골프장을 <span class="green">무료</span>로 이용하실 수 있습니다.
							</p>
							<br> 일반 투숙객 역시 별도의 비용을 지불하시면 골프장을 이용하실 수 있으며,<br> 별솔 골프
							회원권만을 구입해 사용하시는 것도 가능합니다.
						</div>
						<div class="course">
							<div class="text">
								<p class="texttitle">솔바람 코스</p>
								<p class="textsubtitle">
									<strong>For Beginners</strong>
								</p>
								<p class="textmain">
									초보자에게도 부담없는 평탄한 입문 장소입니다.<br> 리조트에서 오가기에 편리한 거리이므로 자유로이
									방문하셔서 골프를 즐기실 수 있습니다.<br> 별솔이 자랑하는 천연 잔디 위에서 전문 강사와 함께 색다른
									취미를 경험해 보십시오.<br> 프론트에서 기본 장비를 대여하고 있습니다. 자세한 사항은 프론트에 문의
									바랍니다.
								</p>
							</div>
							<div class="map">
								<img
									src="https://byeolsol.000webhostapp.com/css/img/tour/golf/golf3.jpg">
							</div>
						</div>

						<div class="leaf">
							<i class="fab fa-envira"></i><i class="fab fa-envira"></i><i
								class="fab fa-envira"></i>
						</div>

						<div class="course">
							<div class="map">
								<img
									src="https://byeolsol.000webhostapp.com/css/img/tour/golf/golf2.jpg">
							</div>
							<div class="text">
								<p class="texttitle">산바람 코스</p>
								<p class="textsubtitle">
									<strong>For Experts</strong>
								</p>
								<p class="textmain">
									숙련자가 즐기기에 적합하도록 꾸며진 장소입니다.<br> 골프에 능숙한 숙련자를 위한 코스입니다. 취미를
									공유하는 소중한 사람들과<br>즐거운 시간을 보내실 수 있습니다.<br> 아름답게 꾸며진 주변
									환경과 코스 주변에 설치된 편의시설을 마음껏 즐겨 보십시오.
							</div>
						</div>

						<div class="leaf">
							<i class="fab fa-envira"></i><i class="fab fa-envira"></i><i
								class="fab fa-envira"></i>
						</div>

						<div class="course">
							<div class="text">
								<p class="texttitle">별바람 코스</p>
								<p class="textsubtitle">
									<strong>For Masters</strong>
								</p>
								<p class="textmain">
									마스터 골퍼들을 위해 정교하게 꾸며진 장소입니다.<br> 프로 골퍼들을 위한 장소입니다. 바람, 잔디,
									지형 등 모두가 전문가인 당신을 위해<br>섬세하게 설계되어 있습니다.<br> 예약시 특정
									옵션을 부가로 신청하시면 보다 특별한 서비스를 만끽하실 수 있습니다.<br> 자세한 사항은 프론트에 문의
									바랍니다.
								</p>
							</div>
							<div class="map">
								<img
									src="https://byeolsol.000webhostapp.com/css/img/tour/golf/golf1.jpg">
							</div>
						</div>
					</div>
				</div>
				<!-- writ -->
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