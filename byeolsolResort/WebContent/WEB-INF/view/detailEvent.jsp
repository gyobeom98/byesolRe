<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function updateEvent(id){
	location.href = "/event/updateEvent?id="+id;
}

function deleteEvent(id){
	location.href = "/event/deleteEvent?id="+id;
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${event.title}
<img alt="a" src="${event.imgPath}">
<button onclick="updateEvent(${event.id})">수정</button>
<button onclick="deleteEvent(${event.id})">삭제</button>

</body>
</html>