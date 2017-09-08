<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table, th, td {
	font-size: 13px;
}
.btn-custom {
  background-color: hsl(0, 0%, 16%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#5b5b5b", endColorstr="#282828");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#5b5b5b), to(#282828));
  background-image: -moz-linear-gradient(top, #5b5b5b, #282828);
  background-image: -ms-linear-gradient(top, #5b5b5b, #282828);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5b5b5b), color-stop(100%, #282828));
  background-image: -webkit-linear-gradient(top, #5b5b5b, #282828);
  background-image: -o-linear-gradient(top, #5b5b5b, #282828);
  background-image: linear-gradient(#5b5b5b, #282828);
  border-color: #282828 #282828 hsl(0, 0%, 11%);
  color: #fff !important;
  border-radius: 0px;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33);
  -webkit-font-smoothing: antialiased;
}
</style>
<div style="padding-top: 20px;">
	<h4 style="font-size: 17px; text-align: left;">
		<span class="glyphicon glyphicon-info-sign"
			style="padding-right: 10px;"></span><b style="padding-right: 10px;">1:1
			문의</b><small style="font-size: 12px;">고객센터를 통하여 고객님께서 문의 하여 주신
			문의내역입니다.</small>
	</h4>
</div>
<b style="font-size: 12px; padding-right: 330px;">고객님께서 신청한 문의 : <b 
	style="color: #ff4d4d; font-size: 13px;">${page.size() }</b>건&nbsp;&nbsp;/&nbsp;
	답변완료 된 문의 : 0건
</b>
<a href="/member/myinfo/counsel_detail.j"><button class="btn btn-custom" style="width: 85px; height: 22px; font-size: 11px; padding: 0px;">1:1 문의 하기</button></a>
<div class="row" style="padding-top: 10px;">
	<div class="col-sm-12">
		<table class="table table-hover">
			<thead>
				<tr style="border-top: 3px solid black;">
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${page }">
					<tr>
						<td>${obj.CATE }</td>
						<td>${obj.TITLE }</td>
						<td>${obj.COUNSEL_DATE }</td>
						<th></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${page.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
	</div>
<div align="center" style="font-size: 15px;">
	<c:if test="${pg.startPageNo ne pg.firstPageNo}">&le;</c:if>
<c:forEach var="i" begin="${pg.startPageNo }" end="${pg.endPageNo }">
	<a href="/member/myinfo/counsel.j?p=${i }">${i }</a>
</c:forEach>
	<c:if test="${pg.endPageNo ne pg.finalPageNo}">
	<a href="/member/myinfo/counsel.j?p=${pg.endPageNo +1}">&gt;</a>
	</c:if> 
</div>
</div>
