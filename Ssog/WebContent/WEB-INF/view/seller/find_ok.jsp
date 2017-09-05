<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.border_none{border:1px solid gray; border-collapse:collapse;}
</style>

	<h2>아이디, 비밀번호 찾기 결과</h2>
	<hr width="400px" noshade>
	<br>
	<table border="1" class="border_none">
		<tr align="center">
			<td width="100px" bgcolor="gray"><font color="white">ID</font></td> 
			<td width="100px" bgcolor="gray"><font color="white">비밀번호</font></td>
		</tr>
		<tr align="center">
			<td width="100px">${id}</td> 
			<td width="100px">${pwd}</td>
		</tr>
	</table>
	<br><br>
	
	<button type="button" onClick="location.href='/seller/main.j'" class="btn">로그인하기</button>
</html>