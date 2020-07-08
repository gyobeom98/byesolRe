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
<link rel="stylesheet" href="/css/fee.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	//
</script>
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
										<li>
										<c:if test="${userId==null }">
										<a class="topmargin" href="/cus/login">객실예약</a>
										</c:if>
										<c:if test="${userId!=null }">
										<a class="topmargin" href="/index/leftover">객실예약</a>
										</c:if>
										</li>
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
			<div class="fee_mainImg">
				<img class="subbanner"
					src="https://byeolsol.000webhostapp.com/css/img/roommainsub.jpg">
			</div>
			<section>
				<div class="writ">
					<div class="fee_main">
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
							<div class="sibtitle">
								<h3 class="stitle">이용안내</h3>
							</div>
							<!-- header -->
							<div class="fee_info">
								<div class="checkin">
									<p>체크인</p>
									<table class="tablecenter1">
										<tr>
											<td class="th">구분</td>
											<td class="th">체크인 시간</td>
										</tr>
										<tr>
											<td>금·토·일요일,성수기,연휴</td>
											<td>15:00</td>
										</tr>
										<tr>
											<td>비수기 주중(월~목)</td>
											<td>14:00</td>
										</tr>
									</table>
									<div class="checkcom">성수기: 2020년 7월 17일 ~ 8월 22일</div>
									<div class="info">
										예약 번호와 신분증을 지참하시고 프런트에서 등록카드 작성 및 객실 배정을 마치면 객실로 이동합니다. <br>
										노약자, 임산부, 장애인 고객 객실은 프런트로 사전 요청 시 우선 배정해 드립니다. (현장 상황에 따라
										변동사항이 있을 수 있습니다)<br> 예약자명과 이용자명이 다를 경우 이용이 불가합니다. <br>
										22시 이후 입실하실 경우 사전에 프런트로 연락 주시기 바랍니다. <br> 이른 입실(Early
										Check-in) 시 시간당 10,000원의 추가요금이 발생합니다. <br> 성수기, 주말, 연휴 등
										이용률이 높은 기간에는 객실 정비시간으로 인해 부득이하게 입실이 늦어지는 경우가 있습니다. <br>양해
										부탁드립니다.
									</div>

								</div>
								<div class="checkout">
									<p>체크아웃</p>
									<table class="tablecenter1">
										<tr>
											<td class="th">구분</td>
											<td class="th">체크아웃 시간</td>
										</tr>
										<tr>
											<td>금·토·일요일,성수기,연휴</td>
											<td>11:00</td>
										</tr>
										<tr>
											<td>비수기 주중(월~목)</td>
											<td>12:00</td>
										</tr>
									</table>
								</div>
								<div class="person">
									<p class="center">객실정원</p>
									<table class="tablecenter2">
										<tr>
											<td class="th">구분</td>
											<td class="th">객실1</td>
											<td class="th">객실2</td>
											<td class="th">객실3</td>
										</tr>
										<tr>
											<td>규정인원</td>
											<td>4인</td>
											<td>6인</td>
											<td>8인</td>
										</tr>
										<tr>
											<td>최대 추가인원</td>
											<td>1인</td>
											<td>2인</td>
											<td>2인</td>
										</tr>
									</table>
									<div class="info">
										추가인원은 1인당 10,000원의 요금이 부과됩니다. (미신고 확인 시 1인당 15.000원 / 7세 미만
										무료)<br> 침구 추가 요청 시 1채당 10,000원의 요금이 발생합니다.<br> 추가
										침구는 최대 인원수를 초과하여 요청할 수 없습니다.<br>
									</div>


								</div>
								<div class="clean">
									<p class="center">객실정비</p>
									<div class="info">
										객실 3박 이상 투숙 시 무료 재정비가 1회 제공됩니다.(사전 요청 필수)<br> 3박 미만 투숙
										시에는 고객 요청에 따라 유상으로 제공됩니다. (1회당 G50 이하 20,000원 / G70 25,000원)<br>
										타월은 1박 객실 정원수만큼 제공되며, 추가 타월 요청시 1장당 500원의 비용이 부과됩니다.<br>
										소모품 교체(비누, 화장지, 샤워용품 등)는 1박 이후 고객 요청시 제공합니다.<br>
									</div>
								</div>
								<div class="use">
									<p class="center">이용안내</p>
									<ul class="use_rule">
										<li><strong>1. 반려동물 금지</strong>
											<p>반려동물도 소중한 가족이지만 다른 고객을 위하여 양해 부탁 드립니다.</p></li>
										<br>
										<li><strong>2. 취사 금지</strong>
											<p>
												별솔은 산 속에 위치한 펜션입니다. 화재예방, 자연 보호, 회원 재산 보호를 위하여 취사를 엄격히 금지하고
												있습니다. <br> 휴대용 버너, 전기 그릴, 에어 프라이어, 인덕션, 찜기 등의 사용이 불가하오니
												양해 부탁 드립니다.
											</p></li>
										<br>
										<li><strong>3. 귀중품 프런트 보관</strong>
											<p>현금을 포함한 귀중품은 프런트에 보관하여 주시기 바랍니다. 보관을 맡기지 않은 분실물에 대해서는
												보상을 받을 수 없습니다.</p></li>
										<br>
										<li><strong>4. 분실물 처리</strong>
											<p>
												분실물은 하우스키핑에서 접수·보관하며 고객요청 시 착불 택배로 발송해 드리고 있습니다. <br>분실물
												문의 시 투숙하신 날짜와 객실번호를 먼저 말씀해 주시면 더욱 신속하게 보관 여부를 안내 받으실 수 있습니다.
												<br>보관기간이 1개월이상 경과된 물품은 소정의 절차를 거쳐 폐기 처분됩니다. (문의
												010-1234-1234)
											</p></li>
										<br>
										<li><strong>5. 객실 비품 훼손 및 불출금지</strong>
											<p>투숙기간 중 객실 비품 파손 및 손실 발생 시 변상하셔야 합니다.</p></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- footer -->
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