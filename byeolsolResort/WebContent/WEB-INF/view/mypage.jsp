<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="../css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../script/header.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div class="logo">
						<a href="../main/main.jsp">로고</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a class="brown"
									href="../explicateList/byeolsolInfo.jsp">별솔리조트</a>
									<ul>
										<li><a href="../explicateList/byeolsolInfo.jsp">별솔리조트란?</a></li>
										<li><a href="../explicateList/roomMain.jsp">객실소개</a></li>
										<li><a href="../explicateList/fee.jsp">이용안내</a></li>
										<li><a href="../explicateList/map.jsp">오시는길</a></li>
									</ul></li>
								<li><a class="brown" href="../newsList/news.jsp">별솔소식</a>
									<ul>
										<li><a href="../newsList/news.jsp">공지사항</a></li>
										<li><a href="../newsList/event.jsp">이벤트</a></li>
									</ul></li>
								<li><a class="brown" href="../serviceList/leftover.jsp">회원
										서비스</a>
									<ul>
										<li><a href="../serviceList/leftover.jsp">객실예약</a></li>
										<li><a href="../serviceList/guestroom.jsp">객실현황</a></li>
										<li><a href="../serviceList/board.jsp">후기게시판</a></li>
									</ul></li>
								<li><a class="brown" href="../tour/trip.jsp">주변관광지</a>
									<ul>
										<li><a href="../tour/trip.jsp">여행코스</a></li>
										<li><a href="../tour/golf.jsp">골프코스</a></li>
										<li><a href="../tour/mount.jsp">등산코스</a></li>
									</ul></li>
							</ul>
						</div>
						<div id="side">
							<ul>
								<li><a href="../sideform/qna.jsp">고객센터</a></li>
								<li><a href="../sideform/login.jsp">로그아웃</a></li>
								<li><a href="../sideform/signup.jsp">마이페이지</a></li>
							</ul>
						</div>
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
							<li>마이페이지</li>
							<li>》</li>
							<li>개인정보수정</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3>개인정보수정</h3>
					</div>
				</div>
				<form onsubmit="return check()" id="regis">
						<div class="content_foot">
							<ul class="flotBox_my_tap">
								<li><a href="마이페이지(업데이트폼)">개인정보</a></li>
								<li><a href="/question/list">나의 Q&A</a></li>
								<li><a href="나의예약링크">나의 예약</a></li>
							</ul>
						</div>
						<br><br>
						<div>
						<h3>
							필수 정보 입력(*항목은 필수 항목입니다)
						</h3>
						</div>
						<table>
							<tr>
								<td class="formTd1">아이디</td>
								<td class="formTd2">${customer.userId }</td>
							</tr>
							<tr>
								<td class="formTd1">* 비밀번호</td>
								<td class="formTd2"><input type="password" name="password" id="password">
									<p>대,소문자와 숫자를이용하여 9~12자로 입력하세요</p></td>
							</tr>
							<tr>
								<td class="formTd1">* 비밀번호 확인</td>
								<td class="formTd2"><input type="password" name="passwordCheck"
									id="passwordCheck"></td>
							</tr>
							<tr>
								<td class="formTd1">* 이름</td>
								<td class="formTd2">(이름 가져오기)</td>
							</tr>
							<tr>
								<td class="formTd1">* 이메일</td>
								<td class="formTd2"><input type="email" name="email" id="email">
									<p>예 : abc@abc.com</p></td>
							</tr>
							<tr>
								<td class="formTd1">* 주소</td>
								<td class="formTd2"><input type="text" id="sample6_postcode"
									placeholder="우편번호" name="zipCode"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									<br>
									<input type="text" id="sample6_address"
									placeholder="주소" name="address">
									<input type="text" id="sample6_detailAddress"
									placeholder="상세주소" name="addressDetail">
								</td>
							</tr>
							<tr>
								<td class="formTd1">* 전화번호</td>
								<td class="formTd2"><input type="text" name="phone" id="phone"></td>
							</tr>
							<tr>
								<td class="formTd1">* 생일</td>
								<td class="formTd2"><input type="date" name="birth" id="birth"></td>
							</tr>
						</table>

						<input type="reset" value="취소">
						<input type="submit" value="수정">
					<p>
						*별솔을 더이상 이용하지 않으시려면 <a href="../sideform/deleteForm.jsp">
						<input type="button" value="회원탈퇴 바로가기>"> </a>
					</p>
				</form>
			</section>
			<footer>
				<div class="fnb">
					<ul>
						<li><a href="../bottom/about.jsp">회사소개</a></li>
						<li><a href="../bottom/privacy.jsp">개인정보처리방침</a></li>
						<li><a href="../bottom/operation.jsp">영상정보처리기기운영관리방침</a></li>
						<li><a href="../bottom/termsofuse.jsp">이용약관</a></li>
						<li><a href="../bottom/emailcollection.jsp">이메일무단수집거부</a></li>
					</ul>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>