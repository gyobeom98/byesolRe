<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var endDate = $("input[name=endDate]");
		var startDate = $("input[name=startDate]")
		var roomNum = $("input[name=roomNum]").val();
		var totalP = document.querySelector("input[name=totalPrice]");
		console.log(totalP)
		endDate.on("focusout", function() {
			var endDateData = endDate.val();
			var startDateData = startDate.val();
			if (endDateData != "" && startDateData != "") {
				var data = startDateData + "," + endDateData;
				$.ajax({
					url : "/reserv/printTotalPrice",
					type : "post",
					data : {
						"roomNum" : roomNum,
						"startDate" : startDateData,
						"endDate" : endDateData
					},
					success : function(d) {
						totalP.value=d;
					}
				})
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>

	<form action="/reserv/addReserv" method="post">
		<input type="number" readonly="readonly" name="roomNum"
			value="${roomNum}"> <input type="date" name="startDate">
		<input type="date" name="endDate"> <input type="number"
			name="peopleCount"> <input type="submit">	
		<input type="number" name="totalPrice" value="0" readonly="readonly">
	</form>
	
	

</body>
</html>