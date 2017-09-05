<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.border_none{ border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray; padding-left:10px; }
</style>

  <div align="center">
    <!-- 회원 정보 수정 폼 -->
    <h2>회원 정보 변경</h2>
	<form action="/seller/info_edit_ok.j" method="post">
	<table class="border_none" width="60%">	
		<tr align="center">
			<td colspan="2" bgcolor="gray"><font color="white" size="4"><b>${sessionScope.seller_id}</b>님 회원정보</font></td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray" >이름</td> 
			<td width="350px"><input type="text" name="name" width="350px" value="${map.NAME }" required></td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">연락처</td> 
			<td width="350px">
				<input type="text" name="phone" width="350px" value="${map.PHONE }" required>
			</td>
		</tr>
		<tr>
			<td width="150px" bgcolor="lightgray">브랜드명</td> 
			<td width="350px">
				<input type="text" name="brand" width="350px" value="${map.BRAND}" required>
			</td>
		</tr>
		<tr >
			<td width="150px" bgcolor="lightgray">계좌번호</td> 
			<td width="350px">
				<input type="text" id="account" name="account" width="350px" value="${map.ACCOUNT}" required>
				 <span id="account_chk"></span>
			</td>
		</tr>
	</table>
	<br><br>
	<button type="submit" class="btn" id="sbt">변경</button>
	<button type="reset" class="btn">초기화</button>
	</form>
  </div>
  
  <script>
	var joinChk = function() {
		var id = this.id;
		var value = this.value;
		if (this.value.trim().length > 0) {
			var req = new XMLHttpRequest();
			req.onreadystatechange = function() {
				if (this.readyState == 4) {
					var ihtml;
					var rText = this.responseText;
					var result = JSON.parse(rText);
					if (result.join_check) {
						ihtml = "<small style='color:green;'>사용가능</small>";
						document.getElementById("sbt").disabled=false;
					} else {
						if(id=="account"){
							ihtml = "<small style='color:red;'>이미 있는 계좌번호 입니다.</small>";	
						}
						document.getElementById("sbt").disabled=true;
					}
					document.getElementById(id + "_chk").innerHTML = ihtml;
				}
			}
			req.open("get", "/seller/joinAjax.j?type=" + this.id + "&val=" + this.value, true);
			req.send();
		} else {
			document.getElementById("sbt").disabled=true;
			document.getElementById(id + "_chk").innerHTML = "";
		}
	}
	
	document.getElementById("account").onblur = joinChk;
</script>