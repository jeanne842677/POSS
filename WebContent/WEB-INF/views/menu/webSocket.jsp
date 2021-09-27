<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






<script type="text/javascript">

let socket = new WebSocket("ws://localhost:9090/sokcet");

socket.onopen = function(e) {
	  alert("[open] 커넥션이 만들어졌습니다.");
	  alert("데이터를 서버에 전송해봅시다.");
	  socket.send("My name is Bora");
	};


</script>
</body>

</html>