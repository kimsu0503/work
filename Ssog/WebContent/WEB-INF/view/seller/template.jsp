<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<style>
	.row ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    width: 200px;
	    background-color: #f1f1f1;
	}
	
	.row li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    font-size: 12px;
	    color: gray;
	    text-decoration: none;
	    
	}
	
	.row li a.active {
		color: lightgray;
		font-weight:bold;
		font-size: 12px;
		background: rgb(46,61,68); /* Old browsers */
background: -moz-linear-gradient(top, rgba(46,61,68,1) 0%, rgba(43,58,65,1) 50%, rgba(42,53,60,1) 51%, rgba(43,57,71,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(46,61,68,1) 0%,rgba(43,58,65,1) 50%,rgba(42,53,60,1) 51%,rgba(43,57,71,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(46,61,68,1) 0%,rgba(43,58,65,1) 50%,rgba(42,53,60,1) 51%,rgba(43,57,71,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2e3d44', endColorstr='#2b3947',GradientType=0 ); /* IE6-9 */
		
	}
	
	.row li a:hover:not(.active) {
	    text-decoration:underline;
	}
	</style>
</head>


<div class="row">
	<div class="col-md-2">
		<ul class="nav nav-stacked">
			<li><a class="active">기본정보 관리</a></li>
			<li><a href="/seller/info.j">회원 정보</a></li>
			<li><a href="/seller/info_edit.j">회원 정보 변경</a></li>
			<li><a href="/seller/pass_edit.j">비밀번호 변경</a></li>
			<li><a href="/seller/delete.j">회원 탈퇴</a></li>
			
			<li><a class="active">상품관리</a></li>
			<li><a href="/seller/product/list.j">상품 목록</a></li>
			<li><a href="#">상품 변경/수정</a></li>
			
			<li><a class="active">주문관리</a></li>
			<li><a href="#">주문/클레임 현황</a></li>
			<li><a href="#">매출 현황 보기</a></li>
			
			<li><a class="active">상담관리</a></li>
			<li><a href="#">리뷰 보기</a></li>
			<li><a href="#">Q&A</a></li>
		</ul>
	</div>
	<div class="col-md-8" align="center">
		<tiles:insertAttribute name="section" />
	</div>
	<div class="col-md-2">
	</div>
</div>

