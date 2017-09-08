<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<div style="padding-top: 20px; padding-left: 16px;">
		<h4 style="font-size: 17px; text-align: left;">
			<span class="glyphicon glyphicon-info-sign"
				style="padding-right: 5px; color: #404040;"></span><b style="padding-right: 5px; color: #404040; letter-spacing: -1px;">공지사항</b>
				<small style="font-size: 11px; letter-spacing: -1px; color:#a6a6a6; "><b>쏙쇼핑몰에서 알려드립니다.</b></small> 
		</h4>
	</div>
	<div class="col-sm-12" style=" padding-bottom: 15px;">
	<div style="border-bottom: 1px solid #d9d9d9; border-top: 2px solid black; height: 45px; padding-top: 10px; padding-bottom: 5px;"> 
	<div align="left">   
		<b style="font-size: 15px;">${notice.TITLE}</b>
		${notice.NOTICE_DATE }
		</div>
	</div>
	<div style="height: 375px;  padding-top: 46px; padding-left: 30px;">
		${notice.CONTENT}
	</div>
	</div>
	<div class="col-sm-12" style="padding-bottom: 20px;">  
	<div style="border-bottom: 1px solid #d9d9d9; border-top: 1px solid #d9d9d9; ">
	이전글▲ <a href="/cccenter/notice_detail.j?num=${notice.RNUM-1 }">이전글</a>
	</div> 
	<div style="border-bottom: 1px solid #d9d9d9;">
	다음글▼
	</div>
	</div>
	<div align="right" style="width: 765px;">  
	<button>목록으로</button>
	</div>
</div>