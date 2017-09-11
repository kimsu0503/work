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
			<td width="150px" bgcolor="lightgray">이전 비밀번호</td> 
			<td width="350px">
				<input type="password" name="pre_pass" id="pre_pass" width="50%" required><p id="prepass_chk"></p>
			</td>
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
  	var check = $("#pass").keyup(function(){
  		if($(this).val()>0 && $("#pass2").val()>0 ){
	  		if($("#pass").val() == $("#pass2").val()){
	  			$("#pass_chk").html("");
	  		} else {
	  			$("#pass_chk").html("비밀번호 불일치");
	  			$("#sbt").prop("disabled",true);
	  		} 
  		}
  	});
  	
  		
  	var check2 = $("#pass2").keyup(function(){
  		if($(this).val()>0 && $("#pass").val()>0 ){
	  		if($("#pass").val() == $("#pass2").val()){
	  			$("#pass_chk").html("");
	  		} else {
	  			$("#pass_chk").html("비밀번호 불일치");
	  			$("#sbt").prop("disabled",true);
	  		} 
  		}
  	});
  	
  	$("#pre_pass").keyup(function(){
  		if($(this).val()>0){
  			$.ajax({
  				url : "/seller/passAjax.j",
  				method: "get",
  				data : { 
  						"pre_pass" : $(this).val(), 
  				}
  			}).done(function(obj){ 
  				if(obj.pre_check){
  					$("#prepass_chk").html("");
  					$("#sbt").prop("disabled",false);
  					check;
  					check2;
  				} else {
	  				$("#prepass_chk").html("비밀번호 불일치");
	  				$("#sbt").prop("disabled",true);
	  				check;
	  				check2;
  				}
  			});
  		}
  	})
  </script>