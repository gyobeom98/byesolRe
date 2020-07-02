<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function() {
		var d = "${errorMessage}";
		if (d != "") {
			alert(d)
			if (d == "로그인이 되어 있지 않습니다") {
				var t = confirm("로그인 하시겠습니까?")
				if (t) {
					location.href = "/cus/login"
				}

				else {
					location.href = "/event/list"
				}
			}else{
				location.href = "/event/list"
			}
		}
	})
	
function goDetail(id){
		location.href = "/event/detailEvent?id="+id;
	}	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="i" items="${eventView.eventList}">
${i.title}
${i.regDate}
<button onclick="goDetail(${i.id})">goDetail</button>
</c:forEach>


	<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
	<c:if test="${eventView.currentPageNum<eventView.pageTotalCount+1}">
		<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
		<c:if
			test="${eventView.currentPageNum>1 && eventView.currentPageNum<=eventView.pageTotalCount}">
			<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
			<a href="/event/list?pageNum=${eventView.currentPageNum-1}">이전</a>
		</c:if>

		<!-- 만약 현재 페이지가 1이면 -->
		<c:if test="${eventView.currentPageNum==1}">

			<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
			<c:forEach var="k" begin="1" end="${eventView.pageTotalCount }">
				<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
				<c:if test="${k<6}">
					<a href="/event/list?pageNum=${k}">${k}</a>
				</c:if>
			</c:forEach>

		</c:if>
		<!-- 현제 페이지가 1이 아니면 -->
		<c:if test="${eventView.currentPageNum!=1}">

			<c:if
				test="${eventView.pageTotalCount-eventView.currentPageNum >=3 && eventView.currentPageNum !=1 }">
				<c:forEach var="j" begin="${eventView.currentPageNum-1}"
					end="${eventView.currentPageNum+3}">
					<a href="/event/list?pageNum=${j}">${j}</a>
				</c:forEach>
			</c:if>

			<c:if test="${eventView.pageTotalCount-eventView.currentPageNum<3}">
				<c:if
					test="${(eventView.currentPageNum-(4-(eventView.pageTotalCount-eventView.currentPageNum)))<0}">
					<c:forEach var="j" begin="0" end="${eventView.pageTotalCount }">
						<c:if test="${j>0 }">
							<a href="/event/list?pageNum=${j}">${j}</a>
						</c:if>
					</c:forEach>
				</c:if>

				<c:if
					test="${(eventView.currentPageNum-(4-(eventView.pageTotalCount-eventView.currentPageNum)))>=0}">
					<c:forEach var="j"
						begin="${eventView.currentPageNum-(4-(eventView.pageTotalCount-eventView.currentPageNum))}"
						end="${eventView.pageTotalCount }">
						<c:if test="${j>0 }">
							<a href="/event/list?pageNum=${j}">${j}</a>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
		</c:if>

		<c:if test="${eventView.currentPageNum <eventView.pageTotalCount }">
			<a href="/event/list?pageNum=${eventView.currentPageNum+1}">다음</a>
		</c:if>
	</c:if>



</body>
</html>