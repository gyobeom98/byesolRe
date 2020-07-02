`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/question/updateQuestion" method="post">

		<input type="number" value="${question.id}" name="id" readonly="readonly"><br>
		<input type ="text" value="${question.title}" name="title">  <br>

		<select name="division">
			<option value="예약">예약문의</option>
			<option value="객실">객실문의</option>
			<option value="식음시설">식음시설</option>
			<option value="관광정보">관광정보</option>
			<option value="기타">기타</option>
		</select> <br>
		 <textarea rows="20" cols="20" name="message">${question.message }</textarea>
		 <br>
		 <input type="submit">
	</form>

</body>
</html>