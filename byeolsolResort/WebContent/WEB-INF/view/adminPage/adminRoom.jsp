<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/admin.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/admin.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
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
		<div class="subimage">
			<h2>서브 이미지 들어가야함.</h2>
		</div>
		<section>
			<div class="writ">
				<div class="route">
					<ul>
						<li>HOME</li>
						<li>》</li>
						<li>관리자페이지</li>
						<li>》</li>
						<li>객실정보관리</li>
					</ul>
				</div>
				<div class="sibtitle">
					<h3 class="stitle">객실정보관리</h3>
				</div>
			</div>
			<form onsubmit="return check()" id="regis">
				<div class="content_foot">
					<ul class="flotBox_my_tap">
						<li><a href="/index/adminUser" class="li2">유저정보관리</a></li>
						<li><a href="/index/adminRoom" class="li1">객실정보관리</a></li>
						<li><a href="/index/adminQnA" class="li3">Q&A관리</a></li>
					</ul>
				</div>
				<div class="user_form">
					<div class="keywordForm">
						이름 : <input type="text" id="keyword_name"> 컨셉 : <input
							type="text" id="keyword_room">
					</div>
					<table id="user_list">
						<thead>
							<tr>
								<td>예약번호</td>
								<td>컨셉</td>
								<td>예약자명</td>
								<td>예약ID</td>
								<td>연락처</td>
								<td>입금확인</td>
								<td>인원몇명</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>객실2</td>
								<td>예약한ID</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>미입금</td>
								<td>3명</td>
								<td><input type="button" onclick="location.href=(예약삭제)"
									value="삭제"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			</form>
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