<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div align="center">
	<h2>아이디, 비밀번호 찾기</h2>
	<hr width="400px" noshade style="color:gray;">
	<br>
	
	<form action="/seller/find_ok.j">
		<h5>가입했던 계좌번호를 입력하세요.</h5>
		<table>
			<tr>
				<td width="100px">계좌번호</td> 
				<td><input type="text" name="account" width="70px" required></td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<br><br>
				<button type="submit">확인</button>
				<button type="button" onClick="location.href='/seller/main.j'">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>