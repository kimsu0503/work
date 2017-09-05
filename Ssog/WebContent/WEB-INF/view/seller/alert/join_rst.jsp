<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${rst eq true}">
		<script>
		window.alert("계정생성이 되었습니다.");
		location.href="/seller/main.j";
		</script>
	</c:when>
	<c:otherwise>
	<script>
		window.alert("가입실패.");
		location.href="/seller/join.j";
		</script>
		
	</c:otherwise>
</c:choose>
