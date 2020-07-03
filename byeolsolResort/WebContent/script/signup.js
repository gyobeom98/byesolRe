$(function() {
	var btn = $(".checkbtn");
	btn.on("click",function(){
		var data  = $("input[name=userId]").val();
		$.ajax({
			url:"/cus/idcheck",
			type:"post",
			data: {"userId" : data},
			success : function(d){
				if(d=="중복"){
					alert("중복되었습니다. 아이디를 확인해주세요")
					document.querySelector("input[type=submit]").disabled = 'disabled';
				}else{
					document.querySelector("input[type=submit]").disabled = '';
				}
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


$(function() {
	$("#birth").datepicker(
			{
				buttonImage : "/application/db/jquery/images/calendar.gif", // 버튼
																			// 이미지
				buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
				changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				minDate : '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				nextText : '다음 달', // next 아이콘의 툴팁.
				prevText : '이전 달', // prev 아이콘의 툴팁.
				numberOfMonths : [ 1, 1 ], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우,
											// 2(행) x 3(열) = 6개의 월을 표시한다.
				stepMonths : 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가.
				yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의
											// 범위를 표시할것인가.
				showButtonPanel : true, // 캘린더 하단에 버튼 패널을 표시한다.
				currentText : '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
				closeText : '닫기', // 닫기 버튼 패널
				dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				showAnim : "slide", // 애니메이션을 적용한다.
				showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다.
				dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ], // 요일의
																		// 한글
																		// 형식.
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ] // 월의 한글 형식.
				,
				minDate : '-100Y' // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				,
				maxDate : "D" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
			});
})



function userId() {
	document.getElementById("userId").focus();
}

function password() {
	document.getElementById("password").focus();
}

function passwordCheck() {
	document.getElementById("passwordCheck").focus();
}

function name() {
	document.getElementById("name").focus();
}

function emailCheck() {
	document.getElementById("email").focus();
}

function address() {
	document.getElementById("address").click();
}

function phone() {
	document.getElementById("phone").focus();
}

var click = true;

function dbclick(){
	if (click) {
		document.getElementById("birth").focus();
        click = !click;
        // 타이밍 추가
        setTimeout(function () {
            click = true;
        }, 1000)
        
     } else {
     }
}


function check() {

	// 정규식
	var userIdPattern = /^[a-zA-Z0-9]{4,12}$/;
	var passwordPattern = /^[A-Za-z0-9]{9,14}$/;
	var namePattern = /^[가-힣]{2,6}|[a-zA-Z]{2,10}$/;
	var emailPattern = /^[A-Za-z0-9]([-_.]?[A-Za-z0-9])*@[a-zA-Z0-9]([-_.]?[a-zA-Z0-9])*.[a-zA-Z]{2,3}$/i;
	var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
	
	
	// 아이디 공백확인
	if ($("#userId").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#userId").focus();
		return false;
	}

	// 아이디의 유효성 검사
	if (!userIdPattern.test($("#userId").val())) {
		alert("아이디를 올바르게 입력해주세요.");
		$("#userId").val("");
		$("#userId").focus();
		return false;
	}
	
	// 비밀번호 공백 확인
	if ($("#password").val() == "") {
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	// 비밀번호 유효성 검사
	if (!passwordPattern.test($("#password").val())) {
		alert("비밀번호 형식에 맞게 입력해주세요");
		$("#password").val("");
		$("#password").focus();
		return false;
	}

	// 아이디랑 비밀번호랑 같은지
	if ($("#userId").val() == ($("#password").val())) {
		alert("ID와 비밀번호를 다르게 입력하세요");
		$("#password").val("");
		$("#password").focus();
	}
	// 비밀번호확인 공백 확인
	if ($("#passwordCheck").val() == "") {
		alert("비밀번호를 확인하세요");
		$("#passwordCheck").focus();
		return false;
	}
	// 비밀번호 똑같은지
	if ($("#password").val() != ($("#passwordCheck").val())) {
		alert("비밀번호가 같지 않습니다.");
		$("#password").val("");
		$("#passwordCheck").val("");
		$("#passwordCheck").focus();
		return false;
	}
	// 이름 공백확인
	if ($("#name").val() == "") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;
	}
	// 이름 유효성
	if (!namePattern.test($("#name").val())) {
		alert("이름을 올바르게 입력하세요.");
		$("#name").val("");
		$("#name").focus();
		return false;
	}

	// 이메일 공백 확인
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요");
		$("#email").focus();
		return false;
	}

	// 이메일 유효성 검사
	if (!emailPattern.test($("#email").val())) {
		alert("이메일형식에 맞게 입력해주세요")
		$("#email").val("");
		$("#email").focus();
		return false;
	}
	// 주소 공백 확인
	if ($("#sample6_postcode").val() == "") {
		alert("주소를 입력해주세요");
		$("#sample6_postcode").focus();
		return false;
	}
	// 전화번호 공백 확인
	if ($("#phone").val() == "") {
		alert("전화번호를 입력해주세요");
		$("#phone").focus();
		return false;
	}
	// 전화번호 유효성 검사
	if (!phonePattern.test($("#phone").val())) {
		alert("전화번호 형식에 맞게 입력해주세요")
		$("#phone").val("");
		$("#phone").focus();
		return false;
	}
	// 생일 공백 확인
	if ($("#birth").val() == "") {
		alert("생년월일을 입력해주세요");
		$("#birth").focus();
		return false;
	}

}

function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}
			}).open();
}
$(document).ready(function() {
	$("#nextBtn").click(function() {
		if ($("#check_1").is(":checked") == false) {
			alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
			return false;
		} else if ($("#check_2").is(":checked") == false) {
			alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
			return false;
		} else if ($("#check_3").is(":checked") == false) {
			alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
			return false;
		} else {
			$("#regis").submit();
		}
	});
});