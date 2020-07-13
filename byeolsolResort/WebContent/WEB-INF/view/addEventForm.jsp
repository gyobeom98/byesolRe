<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/event/addEvent" method="post" enctype="multipart/form-data">
<input type="text" name="title">
<input type="Date" name="start">
<input type="Date" name="end">
미상시<input type="radio" name="state" value="미상시">
상시<input type="radio" name="state" value="상시">
<input type="file" name="uploadFile">
<input type="file" name="thumbnail">
<input type="submit">
</form>


</body>
</html>
