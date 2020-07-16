<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/admin.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function select(dumpImg){
	$("#dump").val(dumpImg)
}
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/admin.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="../header/header.jsp"/>
</header>
<section>
<form action="/index/imgUpdate" method="post" enctype="multipart/form-data">
<input type="text" value="${classification}" name="classification" readonly="readonly"> 
<input type="text" value="${value}" name="value" style="display: none">
<input type="file" name="uploadFile">
<input type="text" name="dumpImg" id="dump" readonly="readonly">
<input type="submit">
</form>
<c:forEach var="i" items="${imgList}">
<img src="${i}?=<%=new Random().nextInt()*400+1 %>" width="300px" height="auto"> <button onclick='select("${i}")'>선택</button>
</c:forEach>
</section>

<footer>
<jsp:include page="../footer/footer.jsp"/>
</footer>
</body>
</html>