<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list }" var="i">
	<div>번호 : ${i.NUM } / <a href="/admin/management/information/terms_detail.ja?num=${i.NUM }">${i.TITLE }</a></div>
</c:forEach>

<a href="/admin/management/information/terms_plus.ja">약관 추가</a>