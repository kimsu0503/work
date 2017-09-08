<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/admin/management/information/terms_plusExec.ja" method="post">
	<div>약관 제목 : <input type="text" name="title"/></div>
	<div>약관 내용 : <textarea name="content" style="width: 400; height: 300; resize: none"></textarea></div>
	<button type="submit">추가</button>
	<button type="button"><a href="/admin/management/information/terms.ja">취소</a></button>
</form>