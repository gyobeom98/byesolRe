<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

function goUpdateAnswer(id){
	location.href="/question/updateAnswer?id="+id;
}

function goDeleteAnswer(id){
	location.href = "/question/deleteAnswer?id="+id;
}

function updateQuestion(id) {
	location.href = "/question/updateQuestion?id="+id; 
}

function deleteQuestion(id) {
	location.href = "/question/deleteQuestion?id="+id;
}

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${question.title}
${question.message}
${question.division }
<c:if test="${question.writer==userId}">
 <button onclick="updateQuestion(${question.id})">수정</button> <button onclick="deleteQuestion(${question.id})">삭제</button> </c:if>
<hr>
<form action="/question/addAnswer?pageNum="${answerView.currentPageNum} method="post">
<input type="number" value="${question.id}" readonly="readonly" name="questionId">
<br>
<input type="text" name="title"><br>
<textarea rows="20" cols="20" name="message"></textarea>
<input type="submit">
</form> 
<hr>

<c:forEach var="i" items="${answerView.answerList }">
답변 title : ${i.title}
답변 : ${i.message}
작성자 : ${i.writer }
<c:if test="${i.writer == userId}"> <button onclick="goUpdateAnswer(${i.id})">수정</button> <button onclick="goDeleteAnswer(${i.id})">삭제</button> </c:if>
</c:forEach>


<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
<c:if test="${answerView.currentPageNum<answerView.pageTotalCount+1}">
<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
<c:if test="${answerView.currentPageNum>1 && answerView.currentPageNum<=answerView.pageTotalCount}">
<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
<a href="/question/detailQuestion?id=${question.id}&pageNum=${answerView.currentPageNum-1}">이전</a>
</c:if>

<!-- 만약 현재 페이지가 1이면 -->
<c:if test="${answerView.currentPageNum==1}">

<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
<c:forEach var="k" begin="1" end="${answerView.pageTotalCount }">
<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
<c:if test="${k<6}">
<a href="/question/detailQuestion?id=${question.id}&pageNum=${k}">${k}</a>
</c:if>
</c:forEach>

</c:if>
<!-- 현제 페이지가 1이 아니면 -->
<c:if test="${answerView.currentPageNum!=1}">

<c:if test="${answerView.pageTotalCount-answerView.currentPageNum >=3 && answerView.currentPageNum !=1 }">
<c:forEach var="j" begin="${answerView.currentPageNum-1}" end="${answerView.currentPageNum+3}">
<a href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
</c:forEach>
</c:if>

<c:if test="${answerView.pageTotalCount-answerView.currentPageNum<3}">
<c:if test="${(answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum)))<0}">
<c:forEach var="j" begin="0" end="${answerView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 
 <c:if test="${(answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum)))>=0}">
 <c:forEach var="j" begin="${answerView.currentPageNum-(4-(answerView.pageTotalCount-answerView.currentPageNum))}" end="${answerView.pageTotalCount }">
<c:if test="${j>0 }">
<a href="/question/detailQuestion?id=${question.id}&pageNum=${j}">${j}</a>
</c:if>
</c:forEach>
 </c:if>
 </c:if>
 </c:if>

<c:if test="${answerView.currentPageNum <answerView.pageTotalCount }">
<a href="/question/detailQuestion?id=${question.id}&pageNum=${answerView.currentPageNum+1}">다음</a>
</c:if>
</c:if>



</body>
</html>