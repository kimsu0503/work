<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.border_none{ border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray; padding-left:10px; }
</style>

  <div align="center">
    <!-- 비밀번호 수정 폼 -->
    <h2>비밀번호 변경</h2>
	<form action="/seller/info.j" method="post">
	<table class="border_none" width="60%">	
		<tr align="center">
			<td colspan="2" bgcolor="gray"><font color="white" size="4"><b>비밀번호를 입력해주세요.</b></font></td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">비밀번호</td> 
			<td width="350px">
				<input type="password" name="pass" id="pass" width="350px" required>
			</td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">비밀번호 확인</td> 
			<td width="350px">
				<input type="password" name="pass2" id="pass2" width="350px" required><p id="pass_chk"></p>
			</td>
		</tr>
	</table>
	<br><br>
	<button type="submit" class="btn" id="sbt">확인</button>
	</form>
  </div>
  
  <script>
  	if($("#pass").val() != $("#pass2").val()){
  		$("#pass_chk").val("비밀번호 불일치");
  		$("#sbt").disabled = true;
  	} else {
  		$("#sbt").disabled = false;
  	}
  </script>