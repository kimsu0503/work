<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list }" var="i" varStatus="vs">
	<div>약관 번호 : ${i.NUM } / 약관 제목 : ${i.TITLE }</div>
	<div>약관 내용 : ${i.CONTENT }</div>
	<div>
		<a href="/admin/management/information/terms_modify.ja?num=${i.NUM }">수정</a>
		<a href="/admin/management/information/terms_del.ja?num=${i.NUM }">삭제</a>
	</div>
</c:forEach>
