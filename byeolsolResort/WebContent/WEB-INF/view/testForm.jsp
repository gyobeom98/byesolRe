<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function select(dumpImg){
	$("#dump").val(dumpImg)
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/index/imgUpdate" method="post" enctype="multipart/form-data">

<input type="text" value="${classification}" name="classification"> 
<input type="text" value="${value}" name="value">
<input type="file" name="uploadFile">
<input type="text" name="dumpImg" id="dump" readonly="readonly">
<input type="submit">
</form>

<c:forEach var="i" items="${imgList}">
<img src="${i}" width="300px" height="auto"> <button onclick='select("${i}")'>선택</button>
</c:forEach>

</body>
</html>