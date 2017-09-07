<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<style>
	/* .border_none	{border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray;}
	.border_none th {text-align:left;} */
	.table  a		{color:black;}
	
	.small	 {font-size:14px;}
	#pro_num { color:gray; font-size:14px; }
	
	.pagination { 
	    white-space:nowrap;
	    display: inline;
	    background-color:white;
	}
	
	.pagination > li{
	    display: inline-block;
	}
	
	/* 검색창 */
	input[type=text] {
	    width: 150px;
	    box-sizing: border-box;
	    font-size: 16px;
	    padding: 5px 5px;
	    -webkit-transition: width 0.4s ease-in-out;
	    transition: width 0.4s ease-in-out;
	}
	
	.search { 
		vertical-align:bottom; 
		height:26px; 
		border:1px solid #ccc; 
		border-radius: 3px;
	}
	
	#search_form { margin-top:80px; }
	.cut {width:15px; overflow:hidden; white-space:nowrap; text-overflow:string;}
	table {white-space:nowrap;}
</style>
   


<div class="container" >
	<ol class="breadcrumb" style="width:30%;">
		<c:choose>
			<c:when test="${param.state eq null or param.state eq ''}">
			    <li><b>전체</b></li>
			</c:when>
			<c:otherwise>
				<li><a href="/seller/product/list.j">전체</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${param.state eq 1}">
			   <li><b>판매중</b></li>
			</c:when>
			<c:otherwise>
		 		<li><a href="/seller/product/list.j?state=1">판매중</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${!empty param.state and param.state eq 0}">
			    <li><b>판매완료</b></li>
			</c:when>
			<c:otherwise>
				<li><a href="/seller/product/list.j?state=0">판매완료</a></li>
			</c:otherwise>
		</c:choose>
	</ol>
	
	
	<div class="container" style="width:90%; text-align:left;">
		<span id="sub" style="font-weight:bold; font-size:16px;">
			<c:choose>
				<c:when test="${!empty param.search_word }">
					"${search_word}"(으)로 검색한 <font color="#337AB7">${total}</font>건의 결과입니다.
				</c:when>
				<c:when test="${!empty param.state}">
					총 <font color="#337AB7">${total}</font>건의 결과입니다.
				</c:when>
				<c:otherwise>
					<font color="#337AB7">${sessionScope.seller_id}</font>님의 상품 목록(총 ${total}건)
				</c:otherwise>
			</c:choose>
		</span>
		
		<!-- 대분류, 중분류 검색 -->
		<form action="/seller/product/list.j">
		<input type="hidden" value="${param.state}" name="state">
			검색필터
				<select id="big_cate" onchange="changeFunc();">
					<option disabled="disabled" selected>대분류</option>
					<option value="*" >전체선택</option>
					<option value="cate">카테고리</option>
					<option value="pro_date">날짜별</option>
				</select> 
				<select id="small_cate">
					<option disabled="disabled" selected>중분류</option>
					<option value="*">전체선택</option>
					<option value="#">...</option>
				</select>
		</form>
		
			
			
		<!-- 상품 목록 테이블 -->
		<form method="post" name="table_form" style="width:90%; text-align:left;">
			<table class="table table-striped" width="90%">	
				<thead>
				<tr align="center">
					<td bgcolor="gray" width="5%"><input type="checkbox" name="allChk" onclick="check()"></td>
					<td bgcolor="gray" width="10%"><font color="white">상품번호</font></td>
					<td bgcolor="gray" width="10%"><font color="white">카테고리</font></td>
					<td bgcolor="gray" width="20%"><font color="white">상품명</font></td>
					<td bgcolor="gray" width="10%"><font color="white">판매수량</font></td>
					<td bgcolor="gray" width="10%"><font color="white">가격</font></td>
					<td bgcolor="gray" width="15%"><font color="white">상품등록일자</font></td>
					<td bgcolor="gray" width="10%"><font color="white">원산지</font></td>
					<td bgcolor="gray" width="10%"><font color="white">판매상태</font></td>
				</tr>
				</thead>
					<!-- 글 없을 때 -->
					<c:if test="${empty list}"><!-- ${list.size()==0} -->
						<tr>
							<td colspan="8" align="center">판매한 상품이 없습니다.</td>
						</tr>
					</c:if>
					
				<c:forEach var="i" items="${list}">
					<tr align="center" class="small">
						<td><input type="checkbox" value="${i.PRO_NUM}" name="chk"></td>
						<td><a href="#?pro_num=${i.PRO_NUM}" id="pro_num">${i.PRO_NUM}</a></td>
						<td><span class="cut">[${i.CATE_NAME}]</span></td>
						<td><a href="#?pro_num=${i.PRO_NUM}">${i.PRO_NAME}</a></td>
						<td><fmt:formatNumber value="${i.PRO_QTY}" type="number"/>개</td>
						<td><fmt:formatNumber value="${i.PRICE}" type="number"/>원</td>
						<td><fmt:formatDate value="${i.PRO_DATE}"  pattern="yyyy-MM-dd"/></td>
						<td>${i.ORIGIN_NAME}</td>
						<td><custom:sellon message="${i.SELL_ON}"/></td>
					</tr>		
				</c:forEach>
				<tr style="background-color:white">
					<th colspan="9"><br>
						<button type="button" onClick="location='#'" class="btn">버튼</button>
						<button type="button" onClick="location='#'" class="btn">버튼</button>
					</th>
				</tr>
			</table>
		</form>
	</div>

	<!-- 페이지 -->
	<div class="container">
		<ul class="pagination">
			<c:if test="${page.startPageNo ne 1}"><!-- 이전 -->
				<li><a href="/seller/product/list.j?p=${page.startPageNo-1}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">&laquo;</a></li>
			</c:if>
		<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}">
			<c:choose>
				<c:when test="${i eq p}">
					<li class="active"><a href="#">${i}</a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${param.search_type ne null}">
							 <li><a href="/seller/product/list.j?p=${i}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">${i}</a></li>
						</c:when>
						<c:otherwise>
							 <li><a href="/seller/product/list.j?p=${i}&state=${param.state}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:if test="${page.endPageNo ne page.finalPageNo}"><!-- 다음 -->
				<li><a href="/seller/product/list.j?p=${page.endPageNo+1}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">&raquo;</a></li>
			</c:if>
		</ul>


		<!-- 검색창. form에 action 경로에는 실제 주소만 됨. 파라미터 추가 설정하고 싶을 땐 hidden 속성을 이용 -->
		<form action="/seller/product/list.j" id="search_form">
		<input type="hidden" value="${param.state}" name="state">
			<select name="search_type" class="search">
				<c:forTokens items="pro_name,pro_num" delims="," var="opt">
					<option value="${opt}" ${opt eq param.search_type? 'selected' : ''}><custom:search message="${opt}"/></option>
				</c:forTokens>
			</select>
			<input type="text" name="search_word" value="${param.search_word}" class="search">
			 <button type="submit" class="btn btn-default btn-sm search">
	          <span class="glyphicon glyphicon-search"></span> Search 
	        </button>
		</form>
	</div>
	
 </div>
 
 <script>
 	//체크박스 전체선택
	function check(){
	    var cbox = table_form.chk;
	    if(cbox.length){  // 여러 개일 경우
	        for(var i = 0; i<cbox.length; i++) {
	            cbox[i].checked = table_form.allChk.checked;
	        }
	    } else { // 한 개일 경우
	        cbox.checked = table_form.allChk.checked;
	    }
	}
 	
 	/* //select
	function changeFunc() {
	    var big_cate = document.getElementById("big_cate");
	    var selectedValue = big_cate.options[big_cate.selectedIndex].value;
	    window.alert(selectedValue);
	   } */

 	
	$("#big_cate").change(function(){
		$.ajax({
			url : "/cateAjax.j",
			method: "get",
			data : { 
					"big_cate" : $("#big_cate").val(), 
		}).done(function(rst){ //이게 responseText
			window.alert(rst);
		});
	});
</script>