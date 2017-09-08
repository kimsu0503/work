<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" align="center">
   <h2>공지사항 수정</h2>
   <div id="alert"></div>
   <div class="col-xs-0 col-md-1"></div>
   <div class="col-xs-12 col-md-10">
         <div class="form-group">
         	<input type="hidden" id="num" value="${list['0'].NOTICE_NUM }"/>
            <div align="left"><label>제목</label></div>
            <input type="text" name="title" id="title" class="form-control" value="${list['0'].TITLE }">
         </div>
          <div class="form-group">
            <div align="left"><label>대상</label></div>
            <select class="form-control" name="target"  id="target">
            	<c:forEach var="i" items="${target }">
            		<option value="${i.NUM }" ${list['0'].TARGET == i.NUM ? 'selected' : ''}>${i.TARGET }</option>
            	</c:forEach>
            </select>
         </div>
         <div class="form-group">
            <div align="left"><label>내용</label></div>
            <textarea rows="15" class="form-control" name="content" id="content" style="resize: none">${list['0'].CONTENT }</textarea>
         </div>
         <div class="form-group">
            <button id="submit" type="button" class="btn btn-default">수정</button>
            <button type="button" class="btn btn-default"><a href="/admin/management/notice/notice_list.ja">취소</a></button>
         </div>
   </div>
   <div class="col-xs-0 col-md-1"></div>
</div>
<script src="/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('content', {
		"filebrowserUploadUrl" : "/admin/management/notice/upload.j",
		resize_enabled : false
	});
</script>
<script>
	$("#submit").on("click", function(){
		$.ajax({
			url : "/admin/management/notice/notice_modifyExec.ja",
			data : {
				title : $("#title").val(),
				num : $("#num").val(),
				target : $("#target").val(),
				content : CKEDITOR.instances.content.getData()
			}
		}).done(function(rst){
			if(rst.text){
				if(!rst.img){
					window.alert("이미지 등록 실패");
				}
				location.href="/admin/management/notice/notice_list.ja";
			}else{
				$("#alert").html("<h4 style='color: red'>등록 실패</h4>");
			}
		});
	});
</script>