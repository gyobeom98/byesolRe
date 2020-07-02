<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

function goDetail(id){
	location.href="/question/detailQuestion?id="+id;
}

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="i" items="${questionView.questionList}">
작성자  : ${i.writer }
title : ${i.title }
message : ${i.message }
<button onclick="goDetail(${i.id})">Detail</button>
<hr>
</c:forEach>

<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
<c:if test="${questionView.currentPageNum<questionView.pageTotalCount+1}">
<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
<c:if test="${questionView.currentPageNum>1 && questionView.currentPageNum<=questionView.pageTotalCount}">
<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
<a href="/question/list?pageNum=${questionView.currentPageNum-1}">이전</a>
</c:if>

<!-- 만약 현재 페이지가 1이면 -->
<c:if test="${questionView.currentPageNum==1}">

<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
<c:forEach var="k" begin="1" end="${questionView.pageTotalCount }">
<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
<c:if test="${k<6}">
<a href="/question/list?pageNum=${k}">${k}</a>
</c:if>
</c:forEach>

</c:if>
<!-- 현제 페이지가 1이 아니면 -->
<c:if test="${questionView.currentPageNum!=1}">

<c:if test="${questionView.pageTotalCount-questionView.currentPageNum >=3 && questionView.currentPageNum !=1 }">
<c:forEach var="j" begin="${questionView.currentPageNum-1}" end="${questionView.currentPageNum+3}">
<a href="/question/list?pageNum=${j}">${j}</a>
</c:forEach>
</c:if>

<c:if test="${questionView.pageTotalCount-questionView.currentPageNum<3}">
<c:if test="${(questionView.currentPageNum-(4-(questionView.pageTotalCount-questionView.currentPageNum)))<0}">
<c:forEach var="j" begin="0" end="${questionView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/question/list?pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 
 <c:if test="${(questionView.currentPageNum-(4-(questionView.pageTotalCount-questionView.currentPageNum)))>=0}">
 <c:forEach var="j" begin="${questionView.currentPageNum-(4-(questionView.pageTotalCount-questionView.currentPageNum))}" end="${questionView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/question/list?pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 </c:if>
 </c:if>

<c:if test="${questionView.currentPageNum <questionView.pageTotalCount }">
<a href="/question/list?pageNum=${questionView.currentPageNum+1}">다음</a>
</c:if>
</c:if>


</body>
</html>