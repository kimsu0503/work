<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table, th, td {
	font-size: 13px;
}

.btn-custom {
	background-color: hsl(0, 0%, 16%) !important;
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#5b5b5b",
		endColorstr="#282828");
	background-image: -khtml-gradient(linear, left top, left bottom, from(#5b5b5b),
		to(#282828));
	background-image: -moz-linear-gradient(top, #5b5b5b, #282828);
	background-image: -ms-linear-gradient(top, #5b5b5b, #282828);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5b5b5b),
		color-stop(100%, #282828));
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
<div class="row" style="padding-top: 20px;">
	<div style="padding-left: 15px; padding-bottom: 20px;">
		<img src="/image/info이미지.jpg" alt="Fjords" width="99%;">
	</div>
	<div class="col-sm-6" style="height: 200px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th style="border-bottom: 2px solid #595959;">1:1 문의</th>
					<th style="padding-left: 190px; border-bottom: 2px solid #595959;"><a
						href="/member/myinfo/counsel.j"
						style="text-decoration: none; color: #595959;"><small>+
								더보기</small></a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${clist }">
					<tr>
						<td style="width: 120px;">${obj.CONTENT }</td>
						<td align="center" style="padding-left: 80px; width: 80px;"><fmt:formatDate
								value="${obj.COUNSEL_DATE }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${clist.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
	</div>
	<div class="col-sm-6" style="height: 200px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th style="border-bottom: 2px solid #595959;">상품 Q&A</th>
					<th style="padding-left: 190px; border-bottom: 2px solid #595959;"><a
						href="/member/myinfo/qna.j"
						style="text-decoration: none; color: #595959;"><small>+
								더보기</small></a>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${qlist }">
					<tr>
						<td style="width: 120px;">${obj.CONTENT }</td>
						<td align="center" style="padding-left: 100px; width: 80px;"><fmt:formatDate
								value="${obj.QANDADATE }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${qlist.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
	</div>
	<div class="col-sm-12" style="height: 100px;">
		<div style="padding-bottom: 10px;">
			<h4 style="font-size: 17px; text-align: left;">
				<span class="glyphicon glyphicon-info-sign"
					style="padding-right: 10px;"></span><b
					style="padding-right: 10px; color: #404040; letter-spacing: -1px;">최근
					주문현황</b><small style="font-size: 12px;">(최근 2개월 기준)</small>


			</h4>
		</div>
		<div
			style="border-top: 2px solid #595959; border-bottom: 1px solid #a6a6a6; padding-top: 10px; padding-bottom: 10px;">
			주문완료 > 상품준비중 > 배송중 > 배송완료<br /> 0건 0건 0건 0건
		</div>

	</div>
	<div class="col-sm-12" style="height: 100px; padding-top: 30px;">
		<div style="padding-bottom: 10px;">
			<h4 style="font-size: 17px; text-align: left;">
				<span class="glyphicon glyphicon-info-sign"
					style="padding-right: 10px;"></span><b
					style="padding-right: 10px; color: #404040; letter-spacing: -1px;">최근
					주문내역</b><small style="font-size: 12px;">(최근 2개월 기준)</small> <a
					href="/member/myinfo/orderlist.j"><button
						class="btn btn-custom"
						style="width: 120px; height: 22px; font-size: 12px; padding: 0px;">전체
						주문내역 보기</button></a>
			</h4>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr style="border-top: 2px solid #595959;">
						<th>주문일자</th>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>결제금액</th>
						<th>상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${llist }">
						<tr>
							<td>${obj.ORDER_DATE }</td>
							<td>${obj.ORDER_NUM }</td>
							<td>${obj.PRO_NAME}</td>
							<td>${obj.PRICE }</td>
							<td>${obj.S }</td>
							<td><button>구매확정</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
		</div>
	</div>
</div>
