<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title></title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
    function check() {

      if ($("#qNa_title").val() == "") {
        alert("제목을 입력해주세요.");
        $("qNa_title").focus();
        return false;
      }
      if ($("#textarea").val() == "") {
        alert("내용을 입력해주세요.");
        $("#textare").focus();
        return false;
      }

    }
  </script>
</head>

<body>
  <div class="allwrap">
    <div class="title">
      <h3>고객의 소리</h3>
    </div>
    <div class="qNa_info">
      고객의 소리함을 통해 고객 여러분의 문의, 제안, 칭찬 등을 접수합니다.<br>
      접수된 글은 마이페이지 나의 Q&A 확인 가능하며,<br>
      메일 또는 유선을 통해 빠른 시간 내에 답변해 드립니다.<br>
    </div>
    <form onsubmit="return check()" nama="qNa_write" id="qNa_write" action="/question/addQuestion" method="post">
      <table>
        <tr>
          <td>제목</td>
          <td><input type="text" id="qNa_title" name="title"></td>
        </tr>
        <tr>
          <td>분류</td>
          <td><select name="division">
              <option value="예약">예약문의</option>
              <option value="객실">객실문의</option>
              <option value="식음시설">식음시설</option>
              <option value="관광정보">관광정보</option>
              <option value="기타">기타</option>
            </select></td>
        </tr>
        <tr>
          <td>내용</td>
          <td><textarea name="message" id="textarea" rows="8" cols="80"></textarea></td>
        </tr>
      </table>
      <input type="submit" id="qNa_submit" "value="등록">
    </form>
  </div>
</body>

</html>
