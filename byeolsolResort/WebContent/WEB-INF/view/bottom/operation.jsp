<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<li>
								<c:if test="${userId==null }">
								<a href="/cus/login">회원 서비스</a>
								</c:if>
								<c:if test="${userId!=null }">
								<a href="/index/leftover">회원 서비스</a>
								</c:if>
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
			<div class="subimage">
				<h2>서브 이미지 들어가야함.</h2>
			</div>
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>영상정보처리기기운영관리방침</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">영상정보처리기기운영관리방침</h3>
					</div>
					별솔리조트는 영상정보처리기기<br> 운영·관리 방침을 통해 본사에서 처리하는 영상정보가 어떠한 용도와 방식으로
					이용·관리되고 있는지 알려 드립니다.<br> 1. 영상정보처리기기의 설치 근거 및 설치 목적<br>
					본사는 개인정보보호법 제25조 제1항에 따라 다음과 같은 목적으로 영상정보처리기기를 설치 · 운영합니다.<br>
					<br> 시설안전 및 화재 예방<br> 고객의 안전을 위한 범죄 예방<br> 차량도난 및
					파손방지<br> 2. 설치 대수, 설치 위치 및 촬영범위<br> 3. 영상정보 확인<br>
					확인 방법: 영상정보 관리책임자에게 사전 연락 후 방문<br> 확인 장소 : 시설팀<br> 4.
					정보주체의 영상정보 열람 등 요구에 대한 조치<br> 귀하는 개인영상정보에 관하여 열람 또는 존재확인·삭제를
					원하는 경우 언제든지 영상정보처리 기기 운영자에게 요구하실 수 있습니다.<br> 단, 귀하가 촬영된 개인영상정보
					및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다.<br> <br>
					5. 영상정보의 안전성 확보 조치<br> 본사에서 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고
					있습니다.<br> 또한 본 사는 개인영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등
					부여하고 있고,<br> 개인영상정보의 위·변조 방지를 위하여 개인영상정보의 생성 일시, 열람 시 열람
					목적·열람자·열람 일시 등을 기록하여 관리하고 있습니다.<br> 이 외에도 개인영상정보의 안전한 물리적 보관을
					위하여 잠금장치를 설치하고 있습니다.<br> <br> 6. 개인정보 처리방침 변경에 관한 사항<br>
					이 영상정보처리기기 운영·관리방침은 2012년 3월 29일에 제정되었으며 법령·정책 또는 보안 기술의 변경에 따라<br>
					내용의 추가·삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 본사 홈페이지를 통해 변경사유 및 내용 등을 공지하도록
					하겠습니다.<br>
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