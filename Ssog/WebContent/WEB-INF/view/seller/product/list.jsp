<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<style>
	/* .border_none	{border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray;}
	.border_none th {text-align:left;} */
	table 			{white-space:nowrap;}
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
	
	#search_form { margin-top:80px;}
	.cut {width:15px; overflow:hidden; white-space:nowrap; text-overflow:string;}
	
	#tab_sellon li { list-style: none; float:left; margin:1px; display:inline-block;}
	#tab_date a { color:gray; margin:1px; width:30%; }
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
   


<div class="container" >
		<span style="font-weight:bold; font-size:18px;">
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
		
		
	
	
	<div class="container" style="width:90%; text-align:left;">
		
		<ul id="tab_sellon" style="width:30%;">
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
		</ul>
		
		
		<span id="tab_date">
			<a href="#">▼최신순</a>
			<a href="#">▼오래된순</a>
		</span>
		
		
			
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
						<td><fmt:formatNumber value="${i.PRO_QTY}" type="number"/>kg</td>
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
			<table>
				<tr>
					<td>
						<select name="search_type" class="search" style="width:90px">
							<c:forTokens items="pro_name,pro_num" delims="," var="opt">
								<option value="${opt}" ${opt eq param.search_type? 'selected' : ''}><custom:search message="${opt}"/></option>
							</c:forTokens>
						</select>
						<input type="text" name="search_word" value="${param.search_word}" class="search">
					</td>
					<td rowspan="2">
						 <button type="submit" class="btn btn-default btn-sm search btn-custom" style="width:50px; height:62px; padding:3px; margin:5px; border-radius: 3px;">
						 	Search<br><span class="glyphicon glyphicon-search"></span>
				         </button>
					</td>
				</tr>
				<tr>
					<td>
						<!-- 카테고리 검색 -->
						<select id="big_cate" name="big_cate" class="search" style="width:90px">
							<option disabled="disabled" selected>대분류</option>
							<option value="cate">카테고리</option>
						</select> 
						<select id="small_cate" name="small_cate" class="search" style="width:150px">
							<option disabled='disabled' selected>중분류</option>
							<option value="*">전체선택</option>
						</select>
					</td>
			</table>
				
				
				
			
			
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
 	
 	//대분류
	$("#big_cate").change("click",function(){
		$.ajax({
			url : "/seller/product/cateAjax.j",
			method: "get",
			data : { 
					"big_cate" : $("#big_cate").val(),
			}
		}).done(function(obj){ 
			//window.alert(obj.list[i].S_CATE);
			var setTag = "";
			for(var i=0; i<obj.list.length; i++){
				setTag += "<option value=\"" + obj.list[i].S_CATE + "\">" + obj.list[i].NAME + "</option>";
			}
			$("#small_cate").append(setTag);
		});
	});
	
</script>