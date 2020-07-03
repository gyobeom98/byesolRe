<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
    
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	var btn = $("button").eq(0);
	btn.on("click",function(){
		var data  = $("input[name=userId]").val();
		$.ajax({
			url:"/cus/idcheck",
			type:"post",
			data: {"userId" : data},
			success : function(d){
				alert(d);
			}
		}) 
		
	})
	
	var inptEmail = $("input[name=email]").on("focusout",function(){
		var data = inptEmail.val();
		console.log(data)
		$.ajax({
			url:"/cus/eamilcheck",
			type:"post",
			data: {"email" : data},
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

<form action="/cus/regis" method="post">

userId : <input type="text" name="userId"> <button type="button">중복 확인</button>
<c:if test="${euserId != null}">아이디 형식에 맞지 않습니다.</c:if>
password : <input type="password" name="password">
name : <input type="text" name="name">
<c:if test="${ename!=null}">이름 형식에 맞지 않습니다</c:if>
email : <input type="email" name="email">
		
<input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addressDetail">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
            }
        }).open();
    }
</script>

phone : <input type="text" name="phone">

<input type="date" name="birth">
<button name="submit">제출</button>
</form>

</body>
</html>