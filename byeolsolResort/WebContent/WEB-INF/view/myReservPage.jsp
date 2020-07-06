<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://sargue.net/jsptags/time" prefix="jt" %>  
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="i" items="${reservView.reservList }">
가격 : ${i.totalPrice } <br>
예약일 : ${i.startDate } -
${i.endDate}<br>
예약 인원수 : ${i.peopleCount }<br>
입금 상태 : ${i.state}
<br>
<jt:format value="${i.regDate}" pattern="YYYY-MM-dd HH:mm:ss"/>

</c:forEach>

</body>
</html>