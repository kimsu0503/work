<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${rst }">
		<script>
			location.href = "/admin/management${t}";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			window.alert("실패");
			location.href = "/admin/management${f}";
		</script>
	</c:otherwise>
</c:choose>