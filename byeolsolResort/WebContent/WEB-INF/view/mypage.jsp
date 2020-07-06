<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/mypage.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/mypage.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
							<li>마이페이지</li>
							<li>》</li>
							<li>개인정보수정</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">개인정보수정</h3>
					</div>
				</div>
				<form onsubmit="return check()" id="regis">
					<div class="content_foot">
						<ul class="flotBox_my_tap">
							<li><a href="../mypage/mypage.jsp" class="li1">개인정보</a></li>
							<li><a href="/question/list" class="li2">나의 Q&A</a></li>
							<li><a href="/cus/myReserv" class="li3">나의 예약</a></li>
						</ul>
					</div>
					<h3 class="tit_3">
						필수 정보 입력 <span class="spanText">(*항목은 필수 항목입니다)</span>
					</h3>

					<table>
						<tr class="tableTr">
							<td class="formTd1">아이디</td>
							<td class="formTd2"> <input type="text" value="${customer.userId}" readonly="readonly" name="userId"></td>
						</tr>
						<tr class="tableTr">
							<td onclick="password()" class="formTd1">* 비밀번호</td>
							<td class="formTd2"><input type="password" name="password"
								id="password">
								<p>대,소문자와 숫자를이용하여 9~12자로 입력하세요</p></td>
						</tr>
						<tr class="tableTr">
							<td onclick="passwordCheck()" class="formTd1">* 비밀번호 확인</td>
							<td class="formTd2"><input type="password"
								name="passwordCheck" id="passwordCheck"></td>
						</tr>
						<tr class="tableTr">
							<td onclick="name()" class="formTd1">* 이름</td>
							<td class="formTd2"><input type="text" name="name" id="name" value="${customer.name }"></td>
						</tr>
						<tr class="tableTr">
							<td class="formTd1">이메일</td>
							<td class="formTd2"> <input type="email" value="${customer.email}" name="email"> </td>
						</tr>
						<tr class="tableTr">
							<td onclick="address()" class="formTd1">* 주소</td>
							<td class="formTd2"><input type="text" id="sample6_postcode"
								placeholder="우편번호" value="${customer.zipCode}" name="zipCode"> <input id="address" type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <br>
								<input type="text" id="sample6_address" placeholder="주소"
								name="address" value="${customer.address}"> <input type="text"
								id="sample6_detailAddress" placeholder="상세주소"
								name="addressDetail" value="${customer.addressDetail }"></td>
						</tr>
						<tr class="tableTr">
							<td onclick="phone()" class="formTd1">* 전화번호</td>
							<td class="formTd2"><input type="text" name="phone"
								id="phone" value="${customer.phone }"></td>
						</tr>
						<tr class="tableTr">
							<td id="birth1" class="formTd1" onclick="dbclick()">* 생일</td>
							<td class="formTd2">
							<input type="date"  name="birth" id="birth" readonly="readonly" value="${customer.birthDate }">
							</td>
						</tr>
					</table>

					<div class="btn">
						<input type="reset" value="취소"> <input type="submit"
							value="수정">
					</div>
					<br> <br> <br>
					<div class="ptag">
						<p>
							*별솔을 더이상 이용하지 않으시려면 <a href="../sideform/deleteForm.jsp"> <input
								type="button" value="회원탈퇴 바로가기>">
							</a>
						</p>
					</div>
				</form>
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