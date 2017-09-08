<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>총원 : ${total }</div>
<table class="table table-bordered" style="text-align: center;">
	<thead>
		<tr>
			<th width="20%;" style="text-align: center;">아이디</th>
	       	<th width="20%;" style="text-align: center;">이름</th>
	       	<th width="30%;" style="text-align: center;">이메일</th>
	       	<th width="30%;" style="text-align: center;">연락처</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="i" varStatus="vs">
			<tr>
				<td>${i.ID }</td>
				<td>${i.NAME }</td>
				<td>${i.EMAIL }</td>
				<td>${i.PHONE }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div align="center">
	<c:if test="${paging.startPageNo ne paging.firstPageNo }">
		<a href="/admin/member/member_user/user_list.ja?p=${paging.startPageNo - 1}&type=${params.type }&value=${params.value}">&le;</a>
	</c:if>
	
	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }" var="i">
		<a href="/admin/member/member_user/user_list.ja?p=${i}&type=${params.type }&value=${params.value}" ${paging.currentPageNo eq i ? 'style="font-weight:bold"' : '' }>${i }</a>
	</c:forEach>
	
	<c:if test="${paging.endPageNo ne paging.finalPageNo }">
		<a href="/admin/member/member_user/user_list.ja?p=${paging.endPageNo + 1}&type=${params.type }&value=${params.value}">&gt;</a>
	</c:if>
</div>

<div align="center">
	<form action="/admin/member/member_user/user_list.ja" method="get">
		<select name="type">
			<c:forEach items="${typesKo }" var="i" varStatus="vs">
				<option value="${typesEn[vs.index] }" ${!empty params.type ? 'selected' : ''}>${i }</option>
			</c:forEach>
		</select>
		<input type="text" name="value" value="${empty params.value ? '' : params.value}"/>
	</form>
</div>