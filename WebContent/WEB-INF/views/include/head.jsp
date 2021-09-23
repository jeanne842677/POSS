<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!-- pageContext 객체 : request와 response 객체를 담고있는 서블릿 객체 -->
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/all.css"> <!-- 외부에서 접근하는 애들은 contextPath가 필요함. -->
<script type="text/javascript" src="${ contextPath }/resources/js/webUtil.js"></script>