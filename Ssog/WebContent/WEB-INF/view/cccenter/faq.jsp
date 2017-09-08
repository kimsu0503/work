<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h4 style="font-size: 17px; text-align: left;">
		<span class="glyphicon glyphicon-info-sign"
			style="padding-right: 10px;"></span><b style="padding-right: 10px;">FAQ
			검색하기</b>
	</h4>
</div>
<div class="row">
	<div class="col-sm-12" style="background-color: #666666;">
		<div class="row">
			<div class="col-sm-3" style="padding-right: 0px; width: 165px;">
				<h4
					style="padding-right: 50px; margin-bottom: 0px; background-color: #666666;">
					<b style="color: white;">FAQ</b>
				</h4>
				<small style="font-size: 18px; padding-left: 18px; color: #bfbfbf">SEARCH</small>
			</div>
			<div class="col-sm-9" style="padding-top: 15px; padding-left: 0px;">
					<div class="input-group">
					<form action="/cccenter/faq.j">
						<input type="text" class="form-control" placeholder="search"
							name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
							</form>
					</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12">
		<div style="padding-top: 20px;">
			<h4 style="font-size: 17px; text-align: left;">
				<span class="glyphicon glyphicon-info-sign"
					style="padding-right: 10px;"></span><b style="padding-right: 5px; color: #404040; letter-spacing: -1px;">자주
					묻는 질문 TOP10</b><small style="font-size: 11px; letter-spacing: -1px; color:#a6a6a6; ">고객님께서 가장 많이
					물어보시는 질문만 모았습니다.</small>
			</h4>
		</div>
		<div
			style="border-top: 3px solid black; padding-top: 10px; padding-bottom: 10px;">
			<ul class="breadcrumb" style="width: 85%; margin: 0px;">
				<li class="active"><c:choose>
						<c:when test="${ param.sort eq null or param.sort eq ''}">전체</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j">전체</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '1'}">회원</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=1">회원</a>
						</c:otherwise>
					</c:choose>
				<li><c:choose>
						<c:when test="${ param.sort eq '2'}">주문/결제</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=2">주문/결제</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '3'}">교환/환불</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=3">교환/환불</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '4'}">상품</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=4">상품</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '5'}">상품수령</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=5">상품수령</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '6'}">적립금/상품권</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=6">적립금/상품권</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '7'}">쿠폰</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=7">쿠폰</a>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${ param.sort eq '8'}">일반</c:when>
						<c:otherwise>
							<a href="/cccenter/faq.j?sort=8">일반</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
		<table class="table table-hover">
			<thead>
				<tr align="center" style="border-top: 1px solid grey;">
					<th style="width: 60px;"><b style="font-size: 12px;">번호</b></th>
					<th style="width: 90px;"><b style="font-size: 12px;">분류</b></th>
					<th style="width: 600px;"><b style="font-size: 12px;">질문</b></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${page }">
					<tr style="border-bottom: 1px solid gray;" class="test"
						id="${obj.NUM }">
						<td style="width: 60px; font-size: 13px;" align="left">${obj.NUM }</td>
						<td style="width: 90px; font-size: 13px;" align="left">${obj.CATEGORY }</td>

						<td style="width: 600px; font-size: 13px;" align="left"
							id="question" class="bar"><span
							class="glyphicon glyphicon-question-sign"
							style="font-size: 15px; padding-right: 10px;"></span>
							|&nbsp;${obj.QUESTION }
							<div style="width: 100%; display: none;" id="tg_${obj.NUM }">
								<span class="glyphicon glyphicon-font"
									style="font-size: 18px; color: red;"></span>${obj.ANSWER }
							</div></td>
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
			<a href="/cccenter/faq.j?sort=${sort}&p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${pg.endPageNo ne pg.finalPageNo}">
			<a href="/cccenter/faq.j?sort=${sort}&p=${pg.endPageNo +1}">&gt;</a>
		</c:if>
	</div>
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-4" style="padding-right: 0px;">
				<div
					style="border-top: 2px solid #666666; padding-top: 7px; padding-bottom: 7px; padding-left: 12px; 2 px solid #e6e6e6; background-color: #f2f2f2; border-left: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; height: 40px;">
					<b style="font-size: 15px;">공지사항</b><small
						style="padding-left: 105px; font-size: 11px;"><a
						href="/cccenter/notice.j"
						style="text-decoration: none; color: #4d4d4d;">+더보기</a></small>
				</div>
				<div
					style="border-left: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; padding-top: 15px;">
					<c:forEach var="i" items="${nlist }">
						<ul style="padding-left: 30px; font-size: 13px; color: #666666;">
							<li>${i.TITLE }</li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-4" style="padding-left: 0px;">
				<div
					style="border-top: 2px solid #666666; padding-top: 7px; padding-bottom: 7px; padding-left: 12px; background-color: #f2f2f2; border-right: 1px solid #e6e6e6; height: 40px;">
					<b style="font-size: 15px;">이벤트 당첨자 발표</b><small
						style="padding-left: 35px; font-size: 11px;">+더보기</small>
				</div>
				<div
					style="border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; padding-top: 15px;">
					<c:forEach var="i" items="${nlist }">
						<ul style="padding-left: 30px; font-size: 13px; color: #666666;">
							<li>${i.TITLE }</li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-4">
				편리한 쇼핑을 위한 쇼핑가이드<br /> 상품수령 절차<br /> 홈페이지 문제해결
			</div>

		</div>
	</div>
</div>
<script>
	$(".test").on("click", function() {
		var id = "#tg_" + $(this).attr('id');
		$(id).toggle();
	});
</script>
