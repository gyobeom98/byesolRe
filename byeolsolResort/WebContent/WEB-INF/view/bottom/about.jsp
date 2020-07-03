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
							<li>회사소개</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">회사소개</h3>
					</div>
					<div>
						나를 찾는 아날로그의 시간,<br> 그 곁에 별솔 세상의 속도에 묻힌 나를 찾아 돌아보는 시간,<br>
						기계에 종속된 삶을 벗어나 사람들을 만나는 시간,<br> 디지털의 편리만큼 아날로그의 편안을 찾는 당신을 위해
						어머니의 품처럼 따스한 별솔의 자연이 있습니다.<br> 어디에나 있지만 어디에도 없는 곳 힐링이 무엇인지
						설명해야 했던 그 시절, <br> 별솔은 처음으로 힐링 리조트를 선보였습니다. <br> 한 곳 한 곳
						잊지 못할 경험을 위해 앞으로도 선별하고 차별하여 특별하게 만들어 갈 것입니다.<br> 다시 만날 수 없는
						대자연과 상생하며 가치 있는 휴식과 가슴에 남는 특별한 경험을 선사할 리조트 잊지 못할 추억,<br> 감동의
						울림을 선사하겠습니다.<br>
					</div>
				</div>
			</section>
			<footer>
				<div id="fnb">
					<ul>
						<li><a href="../bottom/about.jsp">회사소개</a></li>
						<li><a class="bold" href="../bottom/privacy.jsp">개인정보처리방침</a></li>
						<li><a class="bold" href="../bottom/operation.jsp">영상정보처리기기운영관리방침</a></li>
						<li><a href="../bottom/termsofuse.jsp">이용약관</a></li>
						<li><a href="../bottom/emailcollection.jsp">이메일무단수집거부</a></li>
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