<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/qna.js"></script>
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
							<li>고객센터</li>
							<li>》</li>
							<li>고객의 소리</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">고객의 소리</h3>
					</div>
				</div>
				<div class="qNa_form">
					<div class="qNa_info">
						<br> 고객의 소리함을 통해 고객 여러분의 문의, 제안, 칭찬 등을 접수합니다.<br>
						<br> 접수된 글은 마이페이지 나의 Q&A 확인 가능하며,<br>
						<br> 메일 또는 유선을 통해 빠른 시간 내에 답변해 드립니다.<br>
						<br>
					</div>
					<form onsubmit="return check()" name="qNa_write" id="qNa_write" action="/question/addQuestion" method="post">
						<table>
							<tr>
								<td class="formTd1">제목</td>
								<td><input type="text" id="qNa_title" name="title"></td>
							</tr>
							<tr>
								<td class="formTd1">분류</td>
								<td><select name="division">
										<option value="기타">기타</option>
										<option value="예약">예약문의</option>
										<option value="객실">객실문의</option>
										<option value="식음시설">식음시설</option>
										<option value="관광정보">관광정보</option>
									</select></td>
							</tr>
							<tr>
								<td class="formTd1">파일첨부</td>
								<td><input type="file" name="file_input"></td>
							</tr>
							<tr>
								<td class="formTd1">내용</td>
								<td><textarea name="message" id="textarea" rows="8" cols="80"></textarea></td>
							</tr>
						</table>
						<input type="submit" id="qNa_submit" value="등록">
					</form>
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