<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-sm-3" align="center">
			<h3>SSOG</h3>
		</div>
		<div class="col-sm-7" style="padding-bottom: 30px;" id="footer"></div>
	</div>
</div>

<script>
	function init(){
		$.ajax({
			url:"/admin/information/getInfoCompany.ja",
			method: "post"
		}).done(function(rst){
			console.log(rst);
			var html = "";
			for(var i = 0; i < rst.length; i++){
				html += "<span>"+rst[i].NAME+":"+rst[i].VALUE+"</span>&nbsp;&nbsp;";
			}
			$("#footer").html(html);
		});
	}
	init();
</script>