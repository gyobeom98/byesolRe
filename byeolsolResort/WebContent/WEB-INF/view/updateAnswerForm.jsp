<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/question/updateAnswer" method="post">
<input type="number" value="${answer.id}" readonly="readonly" name="id">
<br>
<input type="text" name="title" value="${answer.title}"><br>
<textarea rows="20" cols="20" name="message">
${answer.message }
</textarea>
<input type="submit">
</form> 

</body>
</html>