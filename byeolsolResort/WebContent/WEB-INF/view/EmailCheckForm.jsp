<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	
	var btn = $("button[name=mailCertification]");
	
	btn.on("click",function(){
	var data = $("input[name=userEmail]").val();
		$.ajax({
			url:"/cus/mailSend",
			type:"post",
			data: {"userEmail" : data},
			success : function(d){
				alert(d);
			}
		})		
	})	
})



</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="mailCheck" method="post">
<input type="text" name="userEmail" value="${userEmail}" readonly="readonly">
<input type="text" name="mailCode">
<input type="submit">
<button type="button" name="mailCertification">인증 코드 보내기</button>
</form>

</body>
</html>