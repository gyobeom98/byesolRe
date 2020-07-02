<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="../css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c945c12587.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../script/header.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div id="logo">
						<a id="logoimg" href="../main/main.jsp">
						<img class="logo1" src="https://byeolsol.000webhostapp.com/css/title1.png"> 
						<img class="logo2" src="https://byeolsol.000webhostapp.com/css/title2.png">
						</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a href="../explicateList/byeolsolInfo.jsp">별솔리조트</a>
									<ul>
										<li><a class="topmargin"
											href="../explicateList/byeolsolInfo.jsp">별솔리조트란?</a></li>
										<li><a href="../explicateList/roomMain.jsp">객실소개</a></li>
										<li><a href="../explicateList/fee.jsp">이용안내</a></li>
										<li><a href="../explicateList/map.jsp">오시는길</a></li>
									</ul></li>
								<li><a href="../newsList/news.jsp">별솔소식</a>
									<ul>
										<li><a class="topmargin" href="../newsList/news.jsp">별솔뉴스</a></li>
										<li><a href="../newsList/event.jsp">이벤트</a></li>
									</ul></li>
								<li><a href="">회원 서비스</a>
									<ul>
										<li><a class="topmargin"
											href="../serviceList/leftover.jsp">객실예약</a></li>
										<li><a href="../serviceList/guestroom.jsp">객실현황</a></li>
										<li><a href="../serviceList/board.jsp">후기게시판</a></li>
									</ul></li>
								<li><a href="">주변관광지</a>
									<ul>
										<li><a class="topmargin" href="../tour/trip.jsp">여행코스</a></li>
										<li><a href="../tour/golf.jsp">골프코스</a></li>
										<li><a href="../tour/mount.jsp">등산코스</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<div id="side">
						<ul>
							<li><a href="../sideform/qna.jsp">고객센터</a></li>
							<li><span>｜</span></li>
							<li><a href="../sideform/login.jsp">로그인</a></li>
							<li><span>｜</span></li>
							<li><a href="../sideform/signup.jsp">회원가입</a></li>
						</ul>
					</div>
				</div>
			</header>
			<div class="mainImg">
				<div id="center">
					<div class="img1info">
						<div>
							<div class="img1title">ROOM 1</div>
							<br>
							<div>
								룸1설명설명설명설명 설명설명설명설명<br> 설명설명설 명설명설명설명설 명설명설명설명설명설명<br>
								설명설명설명설명설명설명설명설명설명설명설명설명<br> 설명설명설명설명 설명설명설명설명설명설명설명설명<br>
							</div>
							<div class="centerlink">
								<a href="룸1설명">More Info</a><br> <a href="룸1이벤트">Related
									Event</a>
							</div>
						</div>

					</div>
					<img id="img1"
						src="https://byeolsol.000webhostapp.com/css/img/img5.jpg" alt=""></img>
				</div>
			</div>
			<div id="roomInfo">
				<ul>
					<li id="room1"><a href="객실1">
							<p>
								<span><i class="fas fa-door-closed"></i></span> <br> <span>ROOM1</span>
							</p>
					</a></li>
					<li id="room2"><a href="객실2">
							<p>
								<span><i class="fas fa-door-closed"></i></span><br> <span>ROOM2</span>
							</p>
					</a></li>
					<li id="room3"><a href="객실3">
							<p>
								<span><i class="fas fa-door-closed"></i></span><br> <span>ROOM3</span>
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