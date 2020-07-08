<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/roominfo.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	//
</script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/roomInfo.js"></script>
<script src="https://kit.fontawesome.com/c945c12587.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div id="logo">
						<a id="logoimg" href="/index/main"> <img class="logo1"
							src="https://byeolsol.000webhostapp.com/css/title1.png"> <img
							class="logo2"
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
										<li><a href="/board/list">후기게시판</a></li>
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
			<div class="roomInfo_01_mainImg">
				<img class="subbanner"
					src="https://byeolsol.000webhostapp.com/css/img/img6.jpg">
			</div>
			<section>
				<div class="writ">
					<div class="roomInfo_01_info">
						<div id="secheader">
							<div class="route">
								<ul>
									<li>HOME</li>
									<li>》</li>
									<li>별솔리조트</li>
									<li>》</li>
									<li>객실소개</li>
									<li>》</li>
									<li>객실1</li>
								</ul>
							</div>
							<div class="sibtitle">
								<h3>Healing Room</h3>
							</div>
						</div>
						<div class="img_slide">
							<ul>
								<li><img
									src="https://byeolsol.000webhostapp.com/css/img/room1img/img7-3.jpg"
									alt=""></li>
								<li><img
									src="https://byeolsol.000webhostapp.com/css/img/room1img/img7-2.jpg"
									alt=""></li>
								<li><img
									src="https://byeolsol.000webhostapp.com/css/img/room1img/img7-1.jpg"
									alt=""></li>
							</ul>
							<div class="slidebtn" id="next">
								<i class="fas fa-angle-right"></i>
							</div>
							<div class="slidebtn" id="prev">
								<i class="fas fa-angle-left"></i>
							</div>
						</div>
						<div class="table">
							<div class="foot_right">
								<table class="map">
									<thead style="border-top: 2px solid #C1CCCB">
										<tr>
											<th class="tit" colspan="2">평면도</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><img
												src="https://byeolsol.000webhostapp.com/css/img/room1img/room1.PNG"></td>
										</tr>
									</tbody>
								</table>

							</div>
							<div class="foot_price">
								<table class="price">
									<thead style="border-top: 2px solid #C1CCCB">
										<tr>
											<th class="tit" colspan="2">요금</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="bold">금·토·일요일, 성수기, 연휴</td>
											<td>150,000원</td>
										</tr>
										<tr>
											<td class="bold">비수기 주중(월~목)</td>
											<td>120,000원</td>
										</tr>
									</tbody>
								</table>
								<table>
									<thead>
										<tr>
											<th class="tit" colspan="2">객실시설 안내</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="bold">객실 수</td>
											<td>3실</td>
										</tr>
										<tr>
											<td class="bold">객실정원</td>
											<td>4명</td>
										</tr>
										<tr>
											<td class="bold">전용면적</td>
											<td>16평</td>
										</tr>
										<tr>
											<td class="bold">객실비품</td>
											<td>TV, 오디오, 전자레인지, 전기포트, 식기, 헤어드라이어, 샤워용품, 도서 등</td>
										</tr>
										<tr>
											<td class="bold">취사가능여부</td>
											<td>불가</td>
										</tr>
									</tbody>
								</table>
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