<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.border_none{ border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray; padding-left:10px; }
</style>

  <div align="center">
    <!-- 비밀번호 수정 폼 -->
    <h2>비밀번호 변경</h2>
	<form action="/seller/pass_edit_ok.j" method="post">
	<table class="border_none" width="60%">	
		<tr align="center">
			<td colspan="2" bgcolor="gray"><font color="white" size="4"><b>비밀번호를 입력해주세요.</font></td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">새 비밀번호</td> 
			<td width="350px">
				<input type="password" name="pass" id="pass" width="50%" required>
			</td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">비밀번호 확인</td> 
			<td width="350px">
				<input type="password" name="pass2" id="pass2" width="50%" required><p id="pass_chk"></p>
			</td>
		</tr>
	</table>
	<br><br>
	<button type="submit" class="btn" id="sbt" disabled>변경하기</button>
	</form>
  </div>
  
  <script>
  	$("#pass2").keyup(function(){
  		if($(this).val()>0){
	  		if($("#pass").val() != $(this).val()){
	  	  		$("#sbt").prop("disabled",true);
	  			$("#pass_chk").html("비밀번호 불일치");
	  		} else {
	  			$("#sbt").prop("disabled",false);
	  			$("#pass_chk").html("");
	  		} 
  		}
  	});
  </script>