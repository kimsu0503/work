<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-sm-12">
		<div>
			<h4 style="font-size: 17px; text-align: left;">
				<span class="glyphicon glyphicon-info-sign"
					style="padding-right: 10px;"></span><b style="padding-right: 10px;">공지사항</b>
				<small style="font-size: 12px;">속쇼핑몰에서 알려드립니다.</small>
			</h4>
		</div>
		<hr style="border-top: 3px solid black;" />
		<div>
			<form class="navbar-form">
			전체 <b style="font-size: 14px;">${nalist.size() }</b>건의 게시물이 있습니다
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<div>
		<table class="table table-hover">
			<thead>
				<tr style="border-top: 1px solid black;">
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${nalist }">
					<tr>
						<td>${obj.RNUM }</td>
						<td><a href="/cccenter/notice_detail.j?num=${obj.RNUM }">${obj.TITLE }</a></td>
						<td>${obj.NOTICE_DATE }</td>
						<th></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${nalist.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
		</div>
	</div>
</div>