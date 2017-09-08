<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<form action="/admin/management/information/companyModifyExec.ja" method="post">
		<table class="table table-bordered" style="width: 80%;">
			<thead>
				<tr>
			        <th width="20%;" style="text-align: center;">분류</th>
			        <th style="text-align: center;">내용</th>
			        <th width="5%;" style="text-align: center;"></th>
		    	</tr>
			</thead>
			<tbody id="body">
				<c:forEach items="${list }" var="li" varStatus="vs">
					<tr id="${li.NAME }_tr">
						<th><input type="text" id="${li.NAME }_name" value="${li.NAME }" name="names"/>
						<input type="hidden" name="nums" value="${li.NUM }"/>
						<input type="hidden" name="names_origin" value="${li.NAME }"/>
						</th>
						<th><input type="text" style="width: 100%;" id="${li.NAME }_input" value="${li.VALUE }" name="${li.NAME }"/></th>
						<th><button type="button" id="${li.NAME }_del" value="${li.NAME }" class="del">X</button></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">분류 추가<input type="text" id="newName"/><button type="button" id="plus">+</button></div>
		<button type="submit">수정하기</button>
	</form>
	<a href="/admin/management/information/company.ja">취소</a>
</div>

<script>
	$(".del").on("click", function(){
		console.log($(this).val());
		var data = $(this).val();
		$("#"+$(this).val()+"_tr").remove();
		$.ajax({
			url:"/admin/management/information/delInfoCompany.ja",
			data:{
				'del':data
			},
			type:"post"
		}).done(function(rst){
			if(!rst){
				window.alert("삭제 실패");
			}
		});
	});
	
	$("#plus").on("click", function(){
		if($("#newName").val().length > 0){
			var data = $("#newName").val();
			$.ajax({
				url:"/admin/management/information/plusInfoCompany.ja",
				data:{
					'plus':data
				},
				type:"post"
			}).done(function(rst){
				if(rst > 0){
					var html = "<tr id='"+data+"_tr'>";
					html += "<th><input type='text' id='"+data+"_name' value='"+data+"' name='names'/>";
					html += "<input type='hidden' name='nums' value='"+rst+"'/>";
					html += "<input type='hidden' name='names_origin' value='"+data+"'/></th>";
					html += "<th><input type='text' style='width: 100%;' id='"+data+"_input' value='' name='"+data+"'/></th>";
					html += "<th><button type='button' id='"+data+"_del' value='"+data+"' class='del'>X</button></th></tr>";
					var body = $("#body").html();
					$("#body").html($("#body").html()+html);
					
				}
			});
		}else{
			window.alert("분류명을 입력해주세요.");
		}
	})
</script>