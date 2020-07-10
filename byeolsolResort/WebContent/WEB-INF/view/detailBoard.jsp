<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${board.title } ${board.content}

	<hr>
	
	<c:if test="${commentView.commentCnt >0 }">
	<h1>댓글----------------------------------------------</h1>
	<c:forEach var="q" items="${commentView.commentList }">
	작성자 : ${q.userId} <br>
	메시지 : ${q.message }<hr>
	<c:if test="${q.firstPath!=null}">
	${q.firstPath }
	</c:if>
	
	</c:forEach>
	
	
	</c:if>
	

	<!-- 현재 페이지가 총 페이지 수와 보다 작거나 같으면 -->
	<c:if test="${commentView.currentPageNum<commentView.pageTotalCount+1}">
		<!-- 현재 페이지가 1보다 크고 현재 페이지가 총 페이지의 수보다 작거나 같으 -->
		<c:if
			test="${commentView.currentPageNum>1 && commentView.currentPageNum<=commentView.pageTotalCount}">
			<!-- get 방식의 get요청(인자로 현재 페이지의 전번 페이지로 이동) -->
			<a href="/board/detailBoard?pageNum=${commentView.currentPageNum-1}&boardId=${board.id}">이전</a>
		</c:if>

		<!-- 만약 현재 페이지가 1이면 -->
		<c:if test="${commentView.currentPageNum==1}">

			<!-- 1부터 페이지 총 수 만큼 반복문을 돌리면서 -->
			<c:forEach var="k" begin="1" end="${commentView.pageTotalCount }">
				<!-- 1~5까지 출력  get 방식의 get요청(인자로 각 수의 페이지 로)-->
				<c:if test="${k<6}">
					<a href="/board/detailBoard?pageNum=${k}&boardId=${board.id}">${k}</a>
				</c:if>
			</c:forEach>

		</c:if>
		<!-- 현제 페이지가 1이 아니면 -->
		<c:if test="${commentView.currentPageNum!=1}">

			<c:if
				test="${commentView.pageTotalCount-commentView.currentPageNum >=3 && commentView.currentPageNum !=1 }">
				<c:forEach var="j" begin="${commentView.currentPageNum-1}"
					end="${commentView.currentPageNum+3}">
					<a href="/board/detailBoard?pageNum=${j}&boardId=${board.id}">${j}</a>
				</c:forEach>
			</c:if>

			<c:if
				test="${commentView.pageTotalCount-commentView.currentPageNum<3}">
				<c:if
					test="${(commentView.currentPageNum-(4-(commentView.pageTotalCount-commentView.currentPageNum)))<0}">
					<c:forEach var="j" begin="0" end="${commentView.pageTotalCount }">
						<c:if test="${j>0 }">
							<a href="/board/detailBoard?pageNum=${j}&boardId=${board.id}">${j}</a>
						</c:if>
					</c:forEach>
				</c:if>

				<c:if
					test="${(commentView.currentPageNum-(4-(commentView.pageTotalCount-commentView.currentPageNum)))>=0}">
					<c:forEach var="j"
						begin="${commentView.currentPageNum-(4-(commentView.pageTotalCount-commentView.currentPageNum))}"
						end="${commentView.pageTotalCount }">
						<c:if test="${j>0 }">
							<a href="/board/detailBoard?pageNum=${j}&boardId=${board.id}">${j}</a>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
		</c:if>

		<c:if
			test="${commentView.currentPageNum <commentView.pageTotalCount }">
			<a href="/board/detailBoard?pageNum=${commentView.currentPageNum+1}&boardId=${board.id}">다음</a>
		</c:if>
	</c:if>

	<c:if test="${commentView.commentCnt<=0 }">

정보가 없습니다.
</c:if>

<form action="/board/addComment" method="post">
<input readonly="readonly" value="${board.id }" name = "boardId">
<hr>
message : <textarea rows="5" cols="20" name="message"></textarea>
<input type="submit">
</form>

</body>
</html>