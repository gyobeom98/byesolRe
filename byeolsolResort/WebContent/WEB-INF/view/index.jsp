<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function logOut(){
	location.href="/cus/logout"
}

function logIn(){
	location.href="/cus/login"
}

function mailCheck(){
	location.href="/cus/mailCheck"
}	

window.addEventListener("DOMContentLoaded",function(){
	
	var errorMessage = "${errorMessage}";
	if (errorMessage != "") {
		alert(errorMessage)
		if (errorMessage == "로그인이 되어 있지 않습니다") {
			var t = confirm("로그인 하시겠습니까?")
			if (t) {
				location.href = "/cus/login"
			}

			else {
				location.href = "/index/main"
			}
		}else{
			location.href = "/index/main"
		}
	}
	
	
	
})



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${userId!=null}">
${userId}
<button onclick="logOut()">로그아웃</button>
<button onclick="mailCheck()">메일 인증</button>
</c:if>

<c:if test="${userId==null}">
<button onclick="logIn()">로그인</button>
</c:if>



</body>
</html>