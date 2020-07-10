<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/leftover.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
<script type="text/javascript" src="/script/leftover.js"></script>
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
							<li>회원서비스</li>
							<li>》</li>
							<li>객실예약</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">객실예약</h3>
					</div>
				</div>
				<form class="btn" action="/reserv/addReserv" method="post">
					<div class="res_title">
						<h2>예약</h2>
						<div class="res_main">
							<div class="res_info">
								<table>
									<tr>
										<td class="tdForm">입실날짜</td>
										<td class="tdForm1"><input type="date" name="startDate"
											id="date1" class="date" readonly="readonly">
									</tr>
									<tr>
										<td class="tdForm">퇴실날짜</td>
										<td class="tdForm1"><input type="date" name="endDate"
											id="date2" class="date" readonly="readonly">
									</tr>
									<tr>
										<td class="tdForm">객실</td>
										<td class="tdForm1">
										<select class="room" name="roomNum" id="roomNum">
												<option value="">객실선택</option>
												
										</select></td>
									</tr>
									<tr>
										<td class="tdForm">인원</td>
										<td class="tdForm1">
										<select class="person" id="person" name="peopleCount">
												<option value="인원" selected>인원</option>
										</select>
										</td>
									</tr>
									<tr style="border-style:none">
										<td colspan="2">
											<button type="submit">예약</button>
										</td>
									</tr>
									<tr>
										<td colspan="2" >
											<span id="price">0</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
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