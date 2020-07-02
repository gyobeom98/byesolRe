<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/reserv/updateReserv" method="post">
<input type="number" readonly="readonly" name="roomNum" value="${roomNum}">
<input type="date" name="startDate" value="${reserv.startDate}">
<input type="date" name="endDate" value="${reserv.endDate }">
<input type="number" name="peopleCount" value="${reserv.peopleCount}">
<input type="submit">

</form>


</body>
</html>