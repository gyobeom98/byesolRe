<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/event/updateEvent" method="post" enctype="multipart/form-data">
<input type="number" name="id" value="${event.id}" readonly="readonly">
<input type="text" name="title" value="${event.title}">
<input type="file" name="uploadFile">
<input type="file" name="thumbnail">
<input type="submit">
</form>


</body>
</html>