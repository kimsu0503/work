<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.border_none{ border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray; padding-left:10px; }
</style>

  <div align="center">
    <!-- 회원 정보 폼 -->
	<form action="/seller/info_edit.j" method="post">
	<table class="border_none" width="60%">	
		<tr align="center">
			<td colspan="2" bgcolor="gray"><font color="white" size="4"><b>${sessionScope.seller_id}</b>님 회원정보</font></td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray" >이름</td> 
			<td width="350px">${map.NAME }</td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">연락처</td> 
			<td width="350px">${map.PHONE }</td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">브랜드명</td> 
			<td width="350px">${map.BRAND}</td>
		</tr>
		<tr >
			<td width="150px" bgcolor="lightgray">계좌번호</td> 
			<td width="350px">${map.ACCOUNT}</td>
		</tr>
	</table>
	<br><br>
	<button type="submit" class="btn" id="sbt">정보 변경하기</button>
	</form>
  </div>
  
