<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/board/updateBoard" method="post" enctype="multipart/form-data">

<input type="number" value="${board.id}" name="id" readonly="readonly">
<input type="text" value="${board.title}" name="title">
<input type="text" value="${board.content}" name="content">

<img alt="" src="/img/${board.firstPath }" height="50px">
<input type="file" name="uploadFile01">
<img alt="" src="/img/${board.secondPath }" height="50px">
<input type="file" name="uploadFile02">
<img alt="" src="/img/${board.thirdPath }" height="50px">
<input type="file" name="uploadFile03">

<input type="submit">

</form>

</body>
</html>