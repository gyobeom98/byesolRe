<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<a id="logoimg" href="/index/main"> <img class="logo1"
							src="https://byeolsol.000webhostapp.com/css/title2.png">
						</a>
					</div>
					<div class="navi">
						<div id="manu">
							<ul>
								<li><a href="/index/byeolsolInfo">별솔리조트</a>
									<ul>
										<li><a class="topmargin" href="/index/byeolsolInfo">별솔리조트란?</a></li>
										<li><a href="/index/roomMain">객실소개</a></li>
										<li><a href="/index/fee">이용안내</a></li>
										<li><a href="/index/map">오시는길</a></li>
									</ul></li>
								<li><a href="/index/news">별솔소식</a>
									<ul>
										<li><a class="topmargin" href="/board/adminList">별솔뉴스</a></li>
										<li><a href="/index/event">이벤트</a></li>
									</ul></li>
								<li>
								<c:if test="${userId==null }">
								<a href="/cus/login">회원 서비스</a>
								</c:if>
								<c:if test="${userId!=null }">
								<a href="/index/leftover">회원 서비스</a>
								</c:if>
									<ul>
										<li>
										<c:if test="${userId==null }">
										<a class="topmargin" href="/cus/login">객실예약</a>
										</c:if>
										<c:if test="${userId!=null }">
										<a class="topmargin" href="/index/leftover">객실예약</a>
										</c:if>
										</li>
										<li><a href="/index/guestroom">객실현황</a></li>
										<li><a href="/board/list">후기게시판</a></li>
									</ul></li>
								<li><a href="/index/trip">주변관광지</a>
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
							<li><c:if test="${userId==null}">
									<a href="/cus/login">고객센터</a>
								</c:if> <c:if test="${userId!=null}">
									<a href="/question/addQuestion">고객센터</a>
								</c:if></li>
							<li><span>｜</span></li>
							<li><c:if test="${userId==null}">
									<a href="/cus/login">로그인</a>
								</c:if> <c:if test="${userId!=null}">
									<a href="/cus/logout">로그아웃</a>
								</c:if></li>
							<li><span>｜</span></li>
							<li><c:if test="${userId==null}">
									<a href="/cus/regis">회원가입</a>
								</c:if> <c:if test='${userId!=null && userId!="admin"}'>
									<a href="/cus/myPage">마이페이지</a>
								</c:if> <c:if test='${userId=="admin"}'>
									<a href="/index/adminUser">관리자페이지</a>
								</c:if></li>
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
							<li>개인정보 처리방침</li>
						</ul>
					</div>
					<div class="sibtitle">
						<h3 class="stitle">개인정보 처리방침</h3>
					</div>
					<h3>1. 총칙</h3>
					<br> 1) 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, <br>
					생년월일 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른
					정보와 용이하게 결합하여 식별할 수 있는 것 을 포함 합니다)를 말합니다.<br> 2) 회사는 개인정보보호정책을
					홈페이지 하단에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.<br> 3) 회사는
					개인정보보호정책의 지속적인 개선을 위하여 개인정보보호정책을 개정하는데 필요한 절차를 정하고 있습니다.<br>
					그리고 개인정보보호정책을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고
					있습니다.<br>
					<h3>2. 수집하는 개인정보의 항목 및 수집방법</h3>
					<br> 1) 필수항목<br> 이름, ID(고유번호), Password(비밀번호), 생년월일,
					자택주소, 자택 전화번호, 핸드폰번호, E-mail(전자우편) 주소, 기타 회사가 필요하다고 인정하는 사항<br>
					2) 분양회원 정보(분양 회원일 경우 입력)<br> 회원번호, 회원인증번호<br> 3) 수집방법<br>
					회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br> - 홈페이지, 서면양식, 팩스, 전화, 상담 게시판,
					이벤트 응모<br> <br> - 서비스이용 시 본인식별 정보 (객실 및 부대시설, 골프장 이용 등) <br>
					<h3>3.개인정보의 수집범위</h3>
					웹사이트의
					<서비스이용약관> 내용을 통해 [동의한다] 또는 [동의하지 않는다]를 <br>
					선택할 수 있는 절차를 마련하고, [동의한다]버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br>
					4.개인정보의 수집 및 이용목적<br>
					가. 성명, 생년월일, ID, 비밀번호, 이동전화번호: 회원제 서비스 이용에 따른 본인 식별 절차에 이용<br>
					<br>
					나. 주소, 유선전화번호, e-mail 주소 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통<br>
					경로의 확보, 새로운 서비스/신상품/이벤트 정보의 안내, 경품 등 물품 배송에 대한 정확한 배송의 확보<br>
					<br>
					다. 생년월일, 주소 : 인구통계학적 분석 자료(회원의 연령별, 성별, 지역별 통계분석)<br>
					<br>
					라. 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br>
					<br>
					1) 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보<br>
					(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지
					않습니다.<br>
					<br>
					<h3>5. 목적 외 사용 및 제3자에 대한 제공 및 공유</h3>
					<br>
					1) 회사는 귀하의 개인정보를 <개인정보의 수집목적 및 이용목적>에서 고지한 범위 내에서 사용하며,<br>
					동 범위를 초과하여 이용하거나 타인 또는 타 기업 기관에 제공하지 않습니다.<br>
					특히 다음의 경우는 주의를 기울여 개인정보를 이용 및 제공할 것입니다.<br>
					- 제휴관계<br>
					보다 나은 서비스 제공을 위하여 귀하의 개인정보를 제휴사에게 제공하거나 또 제휴사와 공유할 수 있습니다 .<br>
					개인정보를 제공하거나 공유할 경우에는 사전에 귀하께 제휴사가 누구인지, 제공또는 공유되는 개인정보항목이 무엇인지,<br>
					왜 그러한 개인정보가 제공 되거나 공유되어야 하는지, 그리고 언제까지 어떻게 보호 관리되는지에 대해 개별적으로 전자우편
					및<br>
					서면을 통해 고지하여 동의를 구하는 절차를 거치게 되며,귀하께서 동의하지 않는 경우에는 제휴사에게 제공하거나 제휴사와
					공유하지 않습니다.<br>
					제휴관계에 변화가 있거나 제휴관계가 종결될 때도 같은 절차에의하여 고지하거나 동의를 구합니다.<br>
					<br>
					- 위탁 처리<br>
					원활한 업무 처리를 위해 이용자의 개인정보를 위탁 처리할 경우 반드시 사전에 위탁처리 업체명과 위탁 처리되는<br>
					개인정보의 범위 ,업무위탁 목적, 위탁 처리되는 과정, 위탁관계 유지기간 등에 대해 상세하게 고지합니다.<br>
					- 매각 / 인수합병 등<br>
					서비스제공자의 권리와 의무가 완전 승계 이전되는 경우 반드시 사전에 정당한 사유와 절차에 대해 상세하게 고지할 것이며
					이용자의 개인정보에 대한 동의 철회의 선택권을 부여합니다.<br>
					2) 고지 및 동의방법은 온라인 홈페이지 초기화면의 공지사항을 통해 최소 30일 이전부터 고지함과 동시에 <br>
					이메일등을 이용하여 1회 이상 개별적으로 고지하고 매각 인수합병에 대해서는 반드시 적극적인 동의 방법 <br>
					(개인정보의 제 3자 제공 및 공유에 대한 의사를 직접 밝힘)에 의해서만 절차를 진행합니다.<br>
					3) 다음은 예외로 합니다.<br>
					- 관계법령에 의하여 수사상의 목적으로 관계기관으로부터의 요구가 있을 경우<br>
					<br>
					- 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 식별할 수 없는 형태로 광고주, 협력사, 연구단체 등에
					제공하는 경우<br>
					<br>
					- 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br>
					<br>
					- 그러나 예외 사항에서도 관계법령에 의하거나 수사기관의 요청에 의해 정보를 제공한 경우에는 이를 당사자에게 고지하는
					것을 원칙으로 운영하고 있습니다.<br>
					법률상의 근거에 의해 부득이하게 고지를 하지 못할 수도 있습니다.<br>
					<br>
					<h3>6. 개인정보의 취급위탁</h3>
					회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며,<br>
					관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.<br>
					회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.<br>
					1) 디자인팝 : 웹사이트 관리<br>
					<br>
					2) ㈜한도정보통신 : 전산시스템 구축 및 유지보수<br>
					<br>
					4)빌포스트(주) : 회사 우편물 발송<br>
					<br>
					<h3>7. 개인정보의 열람, 정정</h3>
					1) 귀하는 언제든지 등록되어 있는 귀하의 개인정보를 수정하거나 삭제하실 수 있습니다. 개인정보 수정 및 삭제를 하고자
					할 경우에는<br>
					개인정보관리책임자 및 담당자에게 서면, 전화 또는 E-mail로 연락하시면 지체 없이 조치하겠습니다.<br>
					2) 귀하가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인 정보를 이용 또는 제공하지
					않습니다.<br>
					3) 잘못된 개인정보를 제 3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정하도록
					조치하겠습니다.<br>
					<br>
					<h3>8. 개인정보 수집 이용, 제공에 대한 동의철회 (회원탈퇴)</h3>
					<br>
					1) 입사 지원을 통한 개인정보의 수집 , 이용, 제공에 대해 귀하께서 동의하신 내용을 귀하는 언제든지 철회하실 수
					있습니다.<br>
					2) 동의철회는 홈페이지에서 개인정보수정을 클릭하거나 개인정보관리책임자에게 서면 , 전화, E-mail등으로 연락하시면
					즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다.<br>
					3) 회사는 개인정보의 수집에 대한 동의철회를 개인정보를 수집하는 방법보다 쉽게 할 수 있도록 필요한 조치를
					취하겠습니다.<br>
					<br>
					<h3>9.개인정보의 보유 및 이용기간</h3>
					<br>
					회원의 개인정보는 다음과 같이 개인정보의 수집 목적 또는 제공받은 목적이 종료되면 파기됩니다.<br>
					단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할
					필요가 있을 경우에는 일정기간 보유합니다.<br>
					1) 회원가입정보의 경우 회원탈퇴 또는 회원제명시 사전에 보유목적, 기간, 보유하는 개인정보 항목을 명시하고 동의를 구할
					경우 보유 가능<br>
					<br>
					2) 계약 또는 청약철회 등에 관한 기록 : 5년<br>
					<br>
					3) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
					<br>
					* 상기 보유 기간은 전자상거래 등에서의 소비자보호에 관한법률 시행령 제 6조 1항에 의거합니다.<br>
					<br>
					<h3>9. 개인정보관리 책임자 및 담당자</h3>
					<br>
					회사는 고개의 개인정보를 보호하고, 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보
					관리책임자를 지정하고 있습니다.<br>
					귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실
					수 있습니다. <br>
					회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것 입니다.<br>
					1. 개인정보 관리 책임자<br>
					- 성명 : 김현용 (전산팀)<br>
					<br>
					- 전화번호 : 010-8765-4321<br>
					<br>
					- E-MAIL : asd@korea.com<br>
					<br>
					2. 개인정보 관리 담당자<br>
					<br>
					- 성명 : 진교범 매니저 (전산팀)<br>
					<br>
					- 전화번호 : 010-1234-5678<br>
					<br>
					- E-MAIL : qwe@korea.com<br>
					<br>
					<h3>10. 만 14세 미만 아동의 회원가입 안내</h3>
					<br>
					당사는 만 14세 미만의 아동에 대한 회원가입을 제한 합니다.<br>
					<br>
					<h3>11. 고지의 의무</h3>
					<br>
					현 개인정보처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할
					것입니다.<br>
					- 공고일자 : 2017년 7월 17일<br>
					<br>
					- 시행일자 : 2017년 7월 17일<br>
					<br>
					* 이전 개인정보처리방침<br>
					<br>
					개인정보처리방침 보기 (2020년 7월 17일 적용) 
				</div>
			</section>
			<footer>
				<div id="fnb">
					<ul>
						<li><a href="/index/about">회사소개</a></li>
						<li><a class="bold" href="/index/privacy">개인정보처리방침</a></li>
						<li><a class="bold" href="/index/operation">영상정보처리기기운영관리방침</a></li>
						<li><a href="/index/termsofuse">이용약관</a></li>
						<li><a href="/index/emailcollection">이메일무단수집거부</a></li>
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