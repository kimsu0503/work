<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
	<div style="width: 65%; padding-top: 30px;"> 
		<div class="row">
			<div class="col-sm-3">
				<div
					style="border-top: 2px solid black; height: 100px; width: 200px;">
					<a href="/member/myinfo/info.j"
						style="text-decoration: none; color: black;"><button
							style="width: 100%; height: 100%;">
							<span class="glyphicon glyphicon-home" style="font-size: 18px;"></span><b
								style="font-size: 20px;">마이페이지</b><small style="color: #999999;">My
								Page<br /> <b
								style="font-size: 9px; padding-left: 20px; color: #8c8c8c;">고객과
									함께하는 쏙쇼핑몰</b>
							</small>
						</button></a>
				</div>
				<ul class="nav nav-stacked nav-pills"
					style="margin-top: 0px; border-left: 1px solid #d9d9d9; border-right: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9; width: 200px; text-align: left;">
					<li class="${ac eq 'orderlist' ? 'ac' : '' }"><a
						href="/member/myinfo/orderlist.j"
						style="text-decoration: none; color: #404040; border-bottom: 2px dotted #d9d9d9; width: 90%; font-size: 13px;">주문내역</a></li>

					<li class="${ac eq 'shoppingbasket' ? 'ac' : '' }"><a
						href="/cart/form.j"
						style="text-decoration: none; color: #404040; border-bottom: 2px dotted #d9d9d9; width: 90%;font-size: 13px;">장바구니</a></li>
					<li class="${ac eq 'coupon' ? 'ac' : '' }"><a
						data-toggle="collapse" data-parent="#accordion" href="#collapse1"
						style="text-decoration: none; color: #404040; width: 90%;  font-size: 13px; padding-bottom: 0px;">쿠폰/적립금</a></li>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<a href="/member/myinfo/couponlist.j"
								style="text-decoration: none; color: #999999; font-size: 12px;">할인쿠폰</a><br />
							<a href="/member/myinfo/save.j"
								style="text-decoration: none; color: #999999; font-size: 12px;">적립금</a><br />
						</div>
					</div>
					<li class="${ac eq 'mycontents' ? 'ac' : '' }"><a
						data-toggle="collapse" data-parent="#accordion" href="#collapse2"
						style="text-decoration: none; color: #404040; width: 90%;font-size: 13px; padding-bottom: 0px; border-top: 2px dotted #d9d9d9;">나의
							컨텐츠</a></li>
					<div id="collapse2" class="panel-collapse collapse in">
						<div class="panel-body">
							<a href="/member/myinfo/counsel.j"
								style="text-decoration: none; color: #999999;  font-size: 12px;">1:1
								문의</a><br /> <a href="/member/myinfo/qna.j"
								style="text-decoration: none; color: #999999; font-size: 12px;">상품
								Q&A</a><br /> <a href=""
								style="color: #999999; font-size: 12px;">상품평</a><br />
						</div>
					</div>
					<li class="${ac eq 'mypage' ? 'ac' : '' }"><a
						data-toggle="collapse" data-parent="#accordion" href="#collapse3"
						style="text-decoration: none; color: #404040; width: 90%; font-size: 13px; padding-bottom: 0px; border-top: 2px dotted #d9d9d9;">나의정보</a></li>
					<div id="collapse3" class="panel-collapse collapse in">
						<div class="panel-body">
							<a href="/member/myinfo/info_revise.j"
								style="text-decoration: none; color: #999999; font-size: 12px;">회원정보수정</a><br />
							<a href="/member/myinfo/userpass.j"
								style="text-decoration: none; color: #999999;  font-size: 12px;">비밀번호수정</a><br />
							<a href="/member/myinfo/leave.j"
								style="text-decoration: none; color: #999999;  font-size: 12px;">회원탈퇴</a><br />
						</div>
					</div>
				</ul>
			</div>

			<div class="col-sm-9" style="padding-left: 0px; padding-right: 40px;"> 

				<div class="row"
					style="border-top: 4px solid black; border-bottom: 1px solid grey; height: 80px; width: 100%; margin: 0px;">

					<div class="col-sm-6"
						style="border-left: 1px solid grey; border-right: 2px dotted grey; height: 75px;">
						<div class="row">
							<div class="col-xs-3 col-sm-6"
								style="width: 50%; margin-top: 10px;">
								<dl>
									<dt style="font-size: 13px;">온라인등급</dt>
									<p
										style="font-size: 20px; padding-left: 60px; padding-top: 7px;">${grade.GRADE }</p>
								</dl>
							</div>
							<div class="col-xs-3 col-sm-6"
								style="width: 50%; margin-top: 7px; margin-bottom: 10px;"
								align="center">
								<a href="javascript:popupOpen();" style="color: #262626">
									<button style="font-size: 12px; width: 60px; height: 60px">
										자세히<br />보기
									</button>
								</a>
							</div>
						</div>
					</div>

					<div class="col-sm-6"
						style="border-right: 1px solid grey; height: 75px;">
						<div class="row">
							<div class="col-xs-3 col-sm-6"
								style="width: 50%; margin-top: 10px;">
								<dl>
									<dt style="font-size: 13px; padding-bottom: 7px;">My
										Wallet</dt>
									<dd>
										<li style="font-size: 13px;">할인쿠폰</li>
									</dd>
									<dd>
										<li style="font-size: 13px;">적립금</li>
									</dd>
								</dl>
							</div>
							<div class="col-xs-3 col-sm-6"
								style="width: 50%; margin-top: 7px; margin-bottom: 10px;"
								align="center">
								<a href="/member/myinfo/info.j" style="color: #262626;"><button
										style="font-size: 12px; width: 60px; height: 60px">
										쿠폰
										<p style="letter-spacing: -1px; margin-bottom: 0px;">다운로드</p>
									</button></a>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div
						style="margin-bottom: 10px; padding: 0px; background-color: #f2f2f2; width: 100%;">
						<p data-toggle="collapse" data-target="#demo" align="center"
							style="font-size: 12px; padding-bottom: 2px; padding-top: 2px;">상세정보</p>
					</div>
					<div id="demo" class="collapse in">
						<b style="padding-left: 10px; padding-right: 383px;">가입기간 : <fmt:formatDate
								value="${memberinfo.JOINDATE }" pattern="yyyy-MM-dd" /></b> <a
							href="/member/myinfo/info_revise.j" style="color: #262626;"><button
								style="height: 20px; font-size: 12px;">회원정보 수정</button></a> <a
							href="/member/myinfo/userpass.j" style="color: #262626;"><button
								style="height: 20px; font-size: 12px;">비밀번호 수정</button></a>
						<ul style="padding-left: 25px; padding-top: 10px; text-align: left;">
							<li style="color: grey; font-size: 13px;">회원이름<b
								style="padding-left: 10px; color: #404040">
									${memberinfo.NAME }</b></li>
							<li style="color: grey; font-size: 13px;">전화번호 <b
								style="padding-left: 10px; color: #404040">${memberinfo.PHONE }</b></li>
							<li style="color: grey; font-size: 13px;">메일주소 <b
								style="padding-left: 10px; color: #404040">${memberinfo.EMAIL }</b></li>
						</ul>
					</div>
				</div>

				<tiles:insertAttribute name="section" />
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function popupOpen() {
		var popUrl = "popup_grade.j";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "SSOG", popOption);
	}
</script>