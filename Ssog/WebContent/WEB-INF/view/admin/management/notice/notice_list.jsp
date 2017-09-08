<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list }" var="map" varStatus="vs">
	${map.NOTICE_NUM } / <a href="/admin/management/notice/notice_detail.ja?num=${map.NOTICE_NUM }">${map.TITLE }</a> / ${map.NOTICE_DATE } / ${map.TARGET } / ${map.TARGETS }
	<c:if test="${!vs.last }"><hr/></c:if>
</c:forEach><hr/>
<a href="/admin/management/notice/notice_write.ja">글쓰기</a>