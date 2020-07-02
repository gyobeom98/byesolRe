<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function goUpdate(id){
	location.href="/board/updateBoard?id="+id;
}

function goDetail(id){
	location.href="/board/detailBoard?boardId="+id;
}

window.addEventListener("DOMContentLoaded",function(){
	
	var errorMessage = "${errorMessage}";
	if (errorMessage != "") {
		alert(errorMessage)
		if (errorMessage == "로그인이 되어 있지 않습니다") {
			var t = confirm("로그인 하시겠습니까?")
			if (t) {
				location.href = "/cus/login"
			}

			else {
				location.href = "/board/list"
			}
		}else{
			location.href = "/board/list"
		}
	}
	
	
	
})

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="q" items="${adBoardList}">

공지사항 title : ${q.title} <br>
공지사항 content : ${q.content}<br>
공지사항 작성일 : ${q.wDate }<br>
</c:forEach>
<br>
<!-- 만약 정보의 총 수가 0 보다 크면 --> 
<c:if test="${boardView.boardCnt>0 }">
<!-- request로 받은 boardView의 정보리스트를 item으로 잡고 -->

<c:forEach var="i" items="${boardView.boardList}">
<!-- 정보를 출력하게 하는데 삭제 버튼을 누르면 deleteGuest메서드(인자로 이 정보의 아이디를 줌)를 실행
수정 버튼을 누르면 updateGuest메서드 (인자로 이 정보의 아이디를 줌)를 실행 하게 함. -->
title : ${i.title} <hr>
content : ${i.content} <hr>
작성자 : ${i.userId} <hr>
작성일 : ${i.wDate} <hr>
<c:if test="${i.firstPath != null }">
첫번째 이미지 : <img alt="" src="${i.firstPath}" height="50px"><hr>
</c:if>

<c:if test="${i.secondPath != null }">
두번째 이미지 : <img alt="" src="${i.secondPath}" height="50px"><hr>
</c:if>

<c:if test="${i.thirdPath != null }">
세번째 이미지 : <img alt="" src="${i.thirdPath}" height="50px"><hr>
</c:if>
<button onclick="goUpdate(${i.id})">수정</button>
<button onclick="goDetail(${i.id})">자세히</button>
<hr>
<hr>
</c:forEach>

<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
<c:if test="${boardView.currentPageNum<boardView.pageTotalCount+1}">
<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
<c:if test="${boardView.currentPageNum>1 && boardView.currentPageNum<=boardView.pageTotalCount}">
<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
<a href="/board/list?pageNum=${boardView.currentPageNum-1}">이전</a>
</c:if>

<!-- 만약 현재 페이지가 1이면 -->
<c:if test="${boardView.currentPageNum==1}">

<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
<c:forEach var="k" begin="1" end="${boardView.pageTotalCount }">
<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
<c:if test="${k<6}">
<a href="/board/list?pageNum=${k}">${k}</a>
</c:if>
</c:forEach>

</c:if>
<!-- 현제 페이지가 1이 아니면 -->
<c:if test="${boardView.currentPageNum!=1}">

<c:if test="${boardView.pageTotalCount-boardView.currentPageNum >=3 && boardView.currentPageNum !=1 }">
<c:forEach var="j" begin="${boardView.currentPageNum-1}" end="${boardView.currentPageNum+3}">
<a href="/board/list?pageNum=${j}">${j}</a>
</c:forEach>
</c:if>

<c:if test="${boardView.pageTotalCount-boardView.currentPageNum<3}">
<c:if test="${(boardView.currentPageNum-(4-(boardView.pageTotalCount-boardView.currentPageNum)))<0}">
<c:forEach var="j" begin="0" end="${boardView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/board/list?pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 
 <c:if test="${(boardView.currentPageNum-(4-(boardView.pageTotalCount-boardView.currentPageNum)))>=0}">
 <c:forEach var="j" begin="${boardView.currentPageNum-(4-(boardView.pageTotalCount-boardView.currentPageNum))}" end="${boardView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/board/list?pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 </c:if>
 </c:if>

<c:if test="${boardView.currentPageNum <boardView.pageTotalCount }">
<a href="/board/list?pageNum=${boardView.currentPageNum+1}">다음</a>
</c:if>
</c:if>
</c:if>

<c:if test="${boardView.boardCnt<=0 }">

정보가 없습니다.
</c:if>


</body>
</html>