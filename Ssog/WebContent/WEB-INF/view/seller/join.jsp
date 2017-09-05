<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" class="row">
	<div class="col-xs-0 col-md-3"></div>
	<div class="col-xs-12 col-md-6">
		<h3 style="margin: 0">회원가입</h3>
		
		<form action="/seller/alert/join_rst.j" method="post">
			<div class="form-group">
				<input class="form-control" type="text" placeholder="아이디" name="id"
					id="id" required style="width: 90%;"/>
				<p id="id_chk"></p>
				<input class="form-control" type="password" placeholder="●●●●●"
					name="pass" id="pass" required style="width: 90%;"/><br/>
			</div>
			<div class="form-group">
				<input class="form-control" type="text" placeholder="이름" name="name"
					id="name" required style="width: 90%;"/><br/>
					<hr/>
					<input class="form-control" type="text" placeholder="휴대폰번호(-제외)" name="phone"
					id="phone" required style="width: 90%;"/><br/>
					<input class="form-control" type="text" placeholder="브랜드명" name="brand"
					id="brand" required style="width: 90%;"/><br/>
					
					<div class="navbar-form navbar"> 
						<select name="bank" style="height:5ex;">
							<option value="국민">국민</option>
							<option value="NH농협">NH농협</option>
							<option value="신한">신한</option>
							<option value="우리">우리</option>
							<option value="기업">기업</option>
						</select>
						<input class="form-control" type="text" placeholder="계좌번호(-제외)" name="account"
						id="account" required style="width: 80%;"/>
						<p id="account_chk"></p>
					</div>
			</div>
			<div class="form-group">
				<button style="display: none" type="button" name="confirm"
					id="confirm">확인</button><hr/>
			</div>
				
			<div class="row">
				<button type="submit" class="btn btn-info" style="width: 40%" id="sbt" disabled>가입하기</button>
				<button type="reset" class="btn btn-default" style="width: 40%">초기화</button>
			</div>
		</form>

	</div>
	<div class="col-xs-0 col-md-3"></div>

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
						ihtml = "<b style='color:green;'>사용가능</b>";
						document.getElementById("sbt").disabled=false;
					} else {
						if(id=="id"){
							ihtml = "<b style='color:red;'>이미 있는 아이디 입니다.</b>";
						}
						if(id=="account"){
							ihtml = "<b style='color:red;'>이미 있는 계좌번호 입니다.</b>";	
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
	
	document.getElementById("id").onblur = joinChk;
	document.getElementById("account").onblur = joinChk;
</script>