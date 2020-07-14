<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="jt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/myRoom.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/myroom.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<jsp:include page="../header/sub.jsp"/>
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
							<li>나의 예약</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">나의 예약</h3>
					</div>
				</div>
				<form onsubmit="return check()" id="regis">
					<div class="content_foot">
						<ul class="flotBox_my_tap">
							<li><a href="/cus/myPage" class="li3">개인정보</a></li>
							<li><a href="/question/list" class="li2">나의 Q&A</a></li>
							<li><a href="/cus/myReserv" class="li1">나의 예약</a></li>
						</ul>
					</div>
					<div class="myRoom_main">
					<table>
						<tr class="myRoomTr1">
							<td>요금</td>
							<td>방 번호</td>
							<td>입실예약날짜</td>
							<td>퇴실날짜</td>
							<td>예약인원</td>
							<td>입금상태</td>
							<td>접수일</td>
						</tr>
					<c:forEach var="i" items="${reservWithRoomNumView.reservWithRoomNumList }">
						<tr class="myRoomTr2">
							<td>
								${i.totalPrice }
							</td>
							<td>
								${i.roomNum }
							</td>
							<td>
								${i.startDate }
							</td>
							<td>
								${i.endDate}	
							</td>
							<td>
								${i.peopleCount }
							</td>
							<td>
								${i.state}
							</td>
							<td>
								<jt:format value="${i.regDate}" pattern="YYYY-MM-dd HH:mm:ss" />
							</td>
						</tr>
					</c:forEach>
					</table>
					</div>
				</form>
			</section>
			<footer>
				<jsp:include page="../footer/footer.jsp"/>
			</footer>
		</div>
	</div>
</body>
</html>