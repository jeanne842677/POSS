<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script type="text/javascript">
	
		<c:if test="${not empty msg}">
			alert("${msg}");
		
		</c:if>
		
		<c:if test="${not empty back}">
			history.back();  //뒤로가기
		
		</c:if> 
		
		
		<c:if test="${not empty  url}">
			location.href="${url}" ;
		</c:if>

	</script>
</body>
</html>