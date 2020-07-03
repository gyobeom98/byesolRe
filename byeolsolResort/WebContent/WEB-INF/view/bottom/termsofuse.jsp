<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>별솔리조트</title>
<link rel="stylesheet" href="/css/test1.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/script/sub.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="wrap">
			<header class="header">
				<div class="main">
					<div id="logo">
						<a id="logoimg" href="/index/main">
						<img class="logo1" src="https://byeolsol.000webhostapp.com/css/title2.png"> 
						</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a href="/index/byeolsolInfo">별솔리조트</a>
									<ul>
										<li><a class="topmargin"
											href="/index/byeolsolInfo">별솔리조트란?</a></li>
										<li><a href="/index/roomMain">객실소개</a></li>
										<li><a href="/index/fee">이용안내</a></li>
										<li><a href="/index/map">오시는길</a></li>
									</ul></li>
								<li><a href="/index/news">별솔소식</a>
									<ul>
										<li><a class="topmargin" href="/index/news">별솔뉴스</a></li>
										<li><a href="/index/event">이벤트</a></li>
									</ul></li>
								<li><a href="">회원 서비스</a>
									<ul>
										<li><a class="topmargin"
											href="/index/leftover">객실예약</a></li>
										<li><a href="/index/guestroom">객실현황</a></li>
										<li><a href="/index/board">후기게시판</a></li>
									</ul></li>
								<li><a href="">주변관광지</a>
									<ul>
										<li><a class="topmargin" href="/index/trip">여행코스</a></li>
										<li><a href="/index/golf">골프코스</a></li>
										<li><a href="/index/mount">등산코스</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<div id="side">
						<ul>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/login" >고객센터</a>
							</c:if>
							<c:if test="${userId!=null}">
							<a href="/question/addQuestion">고객센터</a>
							</c:if>
							</li>
							<li>
							<span>｜</span>
							</li>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/login" >로그인</a>
							</c:if>
							<c:if test="${userId!=null}">
							<a href="/cus/logout">로그아웃</a>
							</c:if>
							</li>
							<li><span>｜</span></li>
							<li>
							<c:if test="${userId==null}">
							<a href="/cus/regis" >회원가입</a>
							</c:if>
							<c:if test='${userId!=null && userId!="admin"}'>
							<a href="/cus/myPage">마이페이지</a>
							</c:if>
							<c:if test='${userId=="admin"}'>
							<a href="/index/adminUser">관리자페이지</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</header>
			<div class="subimage">
				<h2>서브 이미지 들어가야함.</h2>
			</div>
			<section>
				<div class="writ">
					<div class="route">
						<ul>
							<li>HOME</li>
							<li>》</li>
							<li>이용약관</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">이용약관</h3>
					</div>
					<hr>
					제1조 (목적)<br> 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고
					기타 필요한 사항의 규정을 목적으로 합니다.<br> 제2조 (약관의 효력)<br> 1. 이 약관은
					전기통신사업법 제31조, 동법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편,
					기타의 방법으로 회원에게 통지함 으로써 효력을 발생합니다.<br> 2. 회사는 이 약관을 변경할 수 있으며,
					변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.<br> 제3조 (약관 이외의
					준칙)<br> 이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신 사업법 및 기타 관련법령에 규정되어있는
					경우 그 규정에 따릅니다.<br> 제4조 (용어의 정의)<br> 이 약관에서 사용하는 용어의 정의는
					다음과 같습니다.<br> 1. 아이디(ID)<br> 회원 식별과 회원의 서비스 이용을 위하여 회원이
					선정하고 회사가 승인하는 문자와 숫자의 조합<br> 2. 비밀번호<br> 회원의 비밀보호를 위하여 회원
					자신이 설정한 문자와 숫자의 조합<br> 3. 해지<br> 회사 또는 회원이 서비스 이용 후 이용계약을
					종료시키는 의사표시<br> 제5조 (회원가입 절차, 회사의 승낙 및 이용계약의 성립)<br> 1.
					회원가입 신청은 온라인으로 다음사항(필수 및 선택사항)을 가입신청 양식에 의거, 기록하여 신청합니다.<br> -
					이름<br> <br> - 아이디(ID)<br> <br> - 비밀번호<br>
					<br> - 회원권 보유여부(보유시 회원번호 입력)<br> <br> - 이메일<br>
					<br> - 주소<br> <br> - 전화번호 등<br> <br> 2.
					회사의 승낙<br> 회사는 회원이 제1항에서 정한 필수사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.
					회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다.<br> -설비에 여유가 없는
					경우<br> <br> -기술상 지장이 있는 경우<br> <br> 기타 회사가
					필요하다고 인정되는 경우 회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙하지 않거나 승낙을 취소할 수
					있습니다.<br> -이름이 실명이 아닌 경우<br> <br> -다른 사람의 명의를 사용하여
					신청한 경우<br> <br> -이용 신청 시 필요내용을 허위로 기재하여 신청한 경우<br> <br>
					-사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우<br> <br> -기타 회사가 정한
					이용신청 요건이 미비 되었을 경우<br> <br> 3. 이용자가 등록절차를 걸쳐 "등록" 단추를 누르면
					이 약관에 동의하는 것으로 간주됩니다.<br> 제6조 (서비스의 내용)<br> 회원에게 별솔리조트의
					제반시설 이용 시 이메일을 활용한 정보제공 및 맞춤 서비스 등의 서비스를 제공하며 구체적 서비스내용은 별도로 홈페이지에
					게시합니다.<br> 제7조 (회사의 의무)<br> 1. 회사는 서비스제공과 관련해서 알고 있는 회원의
					신상정보를 본인의 승낙없이 제 3자에게 누설, 배포하지 않습니다. <br> 단, 전기통신기본법 등 법률의 규정에
					의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의<br> 요청이 있는
					경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br> 2. 회사는
					개인정보와 관련하여 책임자를 임명,운영합니다.<br> 3. 개인이 제공한 개인정보에 대하여, 회사는 제공한
					정보를 1년간 보유하는 것을 원칙으로 하며, <br> 개인이 특별히 이의제기를 하지않는 한 자동적으로 1년씩
					연장 되는 것으로 합니다.<br> 제8조 (회원 아이디(ID)와 비밀번호 관리에 관한 의무)<br>
					아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀,
					부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.<br> 자신의 아이디(ID)가 부정하게
					사용된 경우, 회원은 반드시 회사에 그 사실을 통보해야 합니다.<br> 제9조 (계약사항의 변경)<br>
					회원은 이용 신청 시 기재한 사항이 변경되었을 경우에는 온라인 수정을 해야 합니다.<br> 제10조 (회원의
					의무)<br> 1. 회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 회사가 통지하는<br>
					사항을 준수 하여야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안됩니다.<br> 2. 회원은 회사의 사전
					동의 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br> 3. 회원은 서비스를 이용하여 얻은
					정보를 회사의 사전 동의 없이 복사, 복제, 변경, 번역, 출판, 방송, 기타의 방법으로 사용하거나 이를 타인에게 제공할
					수 없습니다.<br> 4. 회원은 서비스이용과 관련하여 다음 각 호의 행위를 해서는 안됩니다.<br>
					-다른 회원의 아이디(ID)를 부정 사용하는 경우<br> <br> -범죄행위를 목적으로 하거나 기타
					범죄행위와 관련된 행위<br> <br> -타인의 명예를 훼손하거나 모욕하는 행위<br> <br>
					-타인의 지적 재산권 등의 권리를 침해하는 행위<br> <br> -해킹행위 또는 컴퓨터 바이러스의
					유포행위<br> <br> -타인의 의사에 반하여 광고성 정보 등 일정한 내용을 전송하는 행위<br>
					<br> -서비스의 안정적인 운영에 지장을 주거나, 줄 우려가 있는 일체의 행위<br> <br>
					-기타 관계법령에 위배되는 행위<br> <br> 제11조 (정보의 제공 및 광고의 게재)<br>
					1. 회사는 서비스를 운용함에 있어 각종 정보를 웹사이트에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.<br>
					2. 회사는 서비스 운영과 관련하여 웹사이트, 전자우편 등에 광고를 게재할 수 있습니다.<br> 제12조
					(서비스 제공의 중지)<br> 다음 각 항의 1에 해당하는 경우 서비스 제공을 중지할 수 있습니다.<br>
					1. 시스템 정비를 위하여 부득이한 경우<br> 2. 전기통신사업법에 규정된 기간통신 사업자가 전기통신 서비스를
					중지하는 경우<br> 3. 기타 회사에서 서비스를 제공할 수 없는 사유가 발생할 경우<br> 제13조
					(게시물에 대한 권리, 의무, 삭제 등)<br> 게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한
					회원에게 있으며,<br> 게시판에 제10조 제4항과 관련된 자료가 게재되었을 경우, 운영자의 판단에 의하여
					게시물을 삭제할 수 있습니다.<br> 제14조 (계약해지 및 이용제한)<br> 1. 회원이 이용계약을
					해지하고자 하는 때에는 본인이 서비스 또는 전자우편을 통하여 <br> 해지하고자 하는 날의 1일 전까지 (단,
					해지일이 법정공휴일인 경우 공휴일 개시 2일전) 이를 회사에 신청해야 합니다.<br> 2. 회사는 회원이
					제10조 기타 이 약관의 내용을 위반하고, <br> 회사 소정의 기간 이내에 이를 해소하지 아니하는 경우 서비스
					이용계약을 해지할 수 있습니다.<br> 제15조 (손해배상)<br> 회사는 무료로 제공되는 서비스와
					관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 회사의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을
					부담하지 아니합니다.<br> 제16조 (면책, 배상)<br> 1. 회사는 회원이 서비스에 게재한 정보,
					자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, <br> 회원은 자기의
					책임 아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료등에 관하여 손해가 발생하거나 자료의 취사선택, <br>
					기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 회원에게 있습니다.<br> 2.
					회사는 제10조의 규정에 위반하여 회원간 또는 회원과 제3자 간에 서비스를 매개로 하여 물품거래 등과 관련해 어떠한
					책임도 부담하지 아니하고, <br> 회원이 서비스의 이용과 관련해 기대하는 이익에 관하여 책임을 부담하지
					않습니다.<br> 3. 회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인해 발생되는 손해 또는
					제3자에 의한 부정사용등에 대한 책임은 모두 회원에게 있습니다.<br> 4. 회원이 제10조, 기타 이 약관의
					규정을 위반함으로써 회사가 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이를 통하여 회사가 손해를 입게 되는 경우,
					<br> 이 약관을 위반한 회원은 회사에 발생된 모든 손해를 배상하여야 하며, 동 손해로부터 회사를 면책시켜야
					합니다.<br> 제17조 (분쟁의 해결)<br> 1. 회사와 회원은 서비스와 관련해 발생한 분쟁을
					원만하게 해결하기 위하여 필요한 모든 노력을 해야 합니다.<br> 2. 제1항의 규정에도 불구하고, 동 분쟁으로
					인해 소송이 제기될 경우, 동 소송은 회사의 본사 소재지를 관할하는 법원의 관할로 합니다.<br>
				</div>
			</section>
			<footer>
				<div id="fnb">
					<ul>
						<li><a href="../bottom/about.jsp">회사소개</a></li>
						<li><a class="bold" href="../bottom/privacy.jsp">개인정보처리방침</a></li>
						<li><a class="bold" href="../bottom/operation.jsp">영상정보처리기기운영관리방침</a></li>
						<li><a href="../bottom/termsofuse.jsp">이용약관</a></li>
						<li><a href="../bottom/emailcollection.jsp">이메일무단수집거부</a></li>
					</ul>
				</div>
				<address class="address">
					<ul>
						<li class="line">별솔리조트</li>
						<li>대한민국 어디도 저기구 아마로</li>
						<li>사업자등록번호: <span>1234-1234-1234</span></li>
						<li>통신판매업신고 <span>1111</span>-플밍플밍-<span>2222</span></li>
					</ul>
					<ul>
						<li>예약문의: <a href="예약">02-000-0000</a></li>
						<li>단체문의: <a href="단체">02-111-1111</a></li>
						<li>회원권 분양문의: <a href="회원권">02-222-2222</a></li>
					</ul>
					<ul>
						<li>본 페이지는 TJ손해보험과 개인정보 배상책임보험을 체결하여 회원 개인정보를 보호하고 있습니다</li>
					</ul>
				</address>
			</footer>
		</div>
	</div>
</body>
</html>