<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function updateEvent(id){
	location.href = "/event/updateEvent?id="+id;
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${event.title}
<img alt="" src="${event.imgPath}">
<button onclick="updateEvent(${event.id})">수정</button>
</body>
</html>