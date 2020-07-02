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
<script type="text/javascript">

function check() {

	// 정규식
	var passwordPattern = /^[A-Za-z0-9]{9,14}$/;
	var namePattern = /^[가-힣]{2,6}|[a-zA-Z]{2,10}$/;
	var phonePattern = /^\d{3}\d{3,4}\d{4}$/;

	// 비밀번호 공백 확인
	if ($("#password").val() == "") {
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	// 비밀번호 유효성 검사
	if (!passwordPattern.test($("#password").val())) {
		alert("비밀번호 형식에 맞게 입력해주세요");
		$("#password").val("");
		$("#password").focus();
		return false;
	}

	// 아이디랑 비밀번호랑 같은지
	if ($("#userId").val() == ($("#password").val())) {
		alert("ID와 비밀번호를 다르게 입력하세요");
		$("#password").val("");
		$("#password").focus();
	}
	// 비밀번호확인 공백 확인
	if ($("#passwordCheck").val() == "") {
		alert("비밀번호를 확인하세요");
		$("#passwordCheck").focus();
		return false;
	}
	// 비밀번호 똑같은지
	if ($("#password").val() != ($("#passwordCheck").val())) {
		alert("비밀번호가 같지 않습니다.");
		$("#password").val("");
		$("#passwordCheck").val("");
		$("#passwordCheck").focus();
		return false;
	}
	// 이름 공백확인
	if ($("#name").val() == "") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;
	}
	// 이름 유효성
	if (!namePattern.test($("#name").val())) {
		alert("이름을 올바르게 입력하세요.");
		$("#name").val("");
		$("#name").focus();
		return false;
	}

	// 주소 공백 확인
	if ($("#sample6_postcode").val() == "") {
		alert("주소를 입력해주세요");
		$("#sample6_postcode").focus();
		return false;
	}
	// 전화번호 공백 확인
	if ($("#phone").val() == "") {
		alert("전화번호를 입력해주세요");
		$("#phone").focus();
		return false;
	}
	// 전화번호 유효성 검사
	if (!phonePattern.test($("#phone").val())) {
		alert("전화번호 형식에 맞게 입력해주세요")
		$("#phone").val("");
		$("#phone").focus();
		return false;
	}
	// 생일 공백 확인
	if ($("#birth").val() == "") {
		alert("생년월일을 입력해주세요");
		$("#birth").focus();
		return false;
	}
}


</script>

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
				<form onsubmit="return check()" id="regis" method="post" action="/cus/updateCustomer">
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
								<td class="formTd2"> <input type="text" value="${customer.userId }" name="userId" readonly="readonly"></td>
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
								<td class="formTd2"><input type="text" name="name" value="${customer.name}"></td>
							</tr>
							<tr>
								<td class="formTd1">* 이메일</td>
								<td class="formTd2"><input type ="email" value="${customer.email}" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="formTd1">* 주소</td>
								<td class="formTd2"><input type="text" id="sample6_postcode"
									placeholder="우편번호" name="zipCode" value="${customer.zipCode }"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									<br>
									<input type="text" id="sample6_address"
									placeholder="주소" name="address" value="${customer.address}">
									<input type="text" id="sample6_detailAddress"
									placeholder="상세주소" name="addressDetail" value="${customer.addressDetail }">
								</td>
							</tr>
							<tr>
								<td class="formTd1">* 전화번호</td>
								<td class="formTd2"><input type="text" name="phone" id="phone" value="${customer.phone }"></td>
							</tr>
							<tr>
								<td class="formTd1">* 생일</td>
								<td class="formTd2"><input type="date" name="birth" id="birth" value="${customer.birthDate }"></td>
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