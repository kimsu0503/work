<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/admin/management/information/terms_modifyExec.ja" method="post">
	<c:forEach items="${list }" var="i" varStatus="vs">
		<input type="hidden" name="num" value="${i.NUM }"/>
		<div>약관 번호 : ${i.NUM } / 약관 제목 : <input type="text" name="title" value="${i.TITLE }"/></div>
		<div>약관 내용 : <textarea name="content" style="width: 400; height: 300; resize: none">${i.CONTENT }</textarea></div>
	</c:forEach>
	<button type="submit">수정</button>
	<button type="button"><a href="/admin/management/information/terms_detail.ja?num=${param.num }">취소</a></button>
</form>