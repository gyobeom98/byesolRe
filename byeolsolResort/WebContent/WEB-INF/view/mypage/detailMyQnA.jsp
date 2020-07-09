<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/myQnA.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/myQnA.js"></script>
<script type="text/javascript" src="/script/detailMyQnA.js"></script>
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
							<li>마이페이지</li>
							<li>》</li>
							<li>나의 Q&A</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">나의 Q&A</h3>
					</div>
				</div>
				<div class="titleForm">
					<div>
						<c:if test="${question.writer==userId}">
							<button onclick="updateQuestion(${question.id})">수정</button>
							<button onclick="deleteQuestion(${question.id})">삭제</button>
						</c:if>
					</div>
					<table>
						<tr>
							<td>제목</td>
							<td>${question.title}</td>
						</tr>
						<tr>
							<td>문의사항</td>
							<td>${question.division }</td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2">${question.message}</td>
						</tr>
					</table>
				</div>
				<form action="/question/addAnswer?pageNum="
					${answerView.currentPageNum} method="post" class="anwer">
					<div>
						<div>댓글달기</div>
						<input type="number" class="hide" value="${question.id}" readonly="readonly"
							name="questionId"> 
							<input type="text" name="title"
							class="hide" value="XX">
						<textarea rows="20" cols="20" name="message"></textarea>
					</div>
					<div>
						<input type="submit">
					</div>
				</form>
				<div class="answerForm">
					<table>
						<c:forEach var="i" items="${answerView.answerList }">
							<div>댓글</div>
							<c:if test="${i.writer == userId}">
								<button onclick="goUpdateAnswer(${i.id})">수정</button>
								<button onclick="goDeleteAnswer(${i.id})">삭제</button>
							</c:if>
							<tr>
								<td class="hide">${i.title}</td>
								<td>${i.writer }</td>
								<td>${i.message}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
				<c:if
					test="${answerView.currentPageNum<answerView.pageTotalCount+1}">
					<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
					<c:if
						test="${answerView.currentPageNum>1 && answerView.currentPageNum<=answerView.pageTotalCount}">
						<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
						<a
							href="/question/detailQuestion?id=${question.id}&pageNum=${answerView.currentPageNum-1}">이전</a>
					</c:if>

					<!-- 만약 현재 페이지가 1이면 -->
					<c:if test="${answerView.currentPageNum==1}">

						<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
						<c:forEach var="k" begin="1" end="${answerView.pageTotalCount }">
							<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
							<c:if test="${k<6}">
								<a
									href="/question/detailQuestion?id=${question.id}&pageNum=${k}">${k}</a>
							</c:if>
						</c:forEach>

					</c:if>
					<!-- 현제 페이지가 1이 아니면 -->
					<c:if test="${answerView.currentPageNum!=1}">

						<c:if
							test="${answerView.pageTotalCount-answerView.currentPageNum >=3 && answerView.currentPageNum !=1 }">
							<c:forEach var="j" begin="${answerView.currentPageNum-1}"
								end="${answerView.currentPageNum+3}">
								<a
									href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
							</c:forEach>
						</c:if>

						<c:if
							test="${answerView.pageTotalCount-answerView.currentPageNum<3}">
							<c:if
								test="${(answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum)))<0}">
								<c:forEach var="j" begin="0" end="${answerView.pageTotalCount }">
									<c:if test="${j>0 }">
										<a
											href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
									</c:if>
								</c:forEach>
							</c:if>

							<c:if
								test="${(answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum)))>=0}">
								<c:forEach var="j"
									begin="${answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum))}"
									end="${answerView.pageTotalCount }">
									<c:if test="${j>0 }">
										<a
											href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
									</c:if>
								</c:forEach>
							</c:if>
						</c:if>
					</c:if>

					<c:if
						test="${answerView.currentPageNum <answerView.pageTotalCount }">
						<a
							href="/question/detailQuestion?id=${question.id}&pageNum=${answerView.currentPageNum+1}">다음</a>
					</c:if>
				</c:if>
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