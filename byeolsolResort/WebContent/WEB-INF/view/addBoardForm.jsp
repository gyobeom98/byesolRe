<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/board/addBoard" method="post" enctype="multipart/form-data">

<input type="text" name="title">
<input type="text" name="content">
<input type="file" name="uploadFile" multiple="multiple" max="3">
<input type="submit">
</form>

</body>
</html>