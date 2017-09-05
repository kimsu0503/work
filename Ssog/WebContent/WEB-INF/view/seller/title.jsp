<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.modal-header, h4, .close {
	background-color: #ffffff;
	color: black !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.navbar {
	border-radius: 0px;
}
</style>
<div style="min-height: 8%; display: block;">배너뜨는창
<a href="javascript:closeToplineBanner()" class="btn_clse">레이어닫기</a>
</div>
<div>
	<div class="navbar navbar-inverse navbar-fixed"
		style="margin-bottom: 0px;">
		<div class="navbar-header" style="padding-left: 14%;">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNav">
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNav"
			style="padding-right: 24%;">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.seller_id eq null}">
						<li id="log"><a id="myBtn">로그인</a></li>
						<li><a href="/seller/join.j">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/seller/logout.j">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="/seller/info.j">나의정보</a></li>
				<li><a href="#"></a></li>
				<li><a href="#"></a></li>
			</ul>
		</div>
	</div>
	<div align="center"  class="container" style="padding-top: 30px;">
	<div class="row">
	<div class="col-sm-3">
	<h1><a href="/" style="text-decoration: none; color: black;">SSOG</a></h1>
	</div>
	<div class="col-sm-6" style="padding-top: 23px;">
		<form>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 100%;"> 
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search" style="width: 20px;height: 20px;"></i>
          </button>
        </div>
      </div>
    </form>
    </div>
    <div class="col-sm-3"></div>
	</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding: 35px 50px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 판매자 페이지 로그인
				</h4>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form" action="/seller/alert/login_rst.j" method="post">
					<div class="form-group">
						<label for="usrname"> SSOG 로그인</label><br/> <input type="text"
							class="form-control" name="id" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="pass"
							placeholder="암호">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" name="keep"/>로그인 유지</label>
					</div>
					<button type="submit" class="btn btn-info btn-block">
						<span class="glyphicon glyphicon-off"></span> 로그인
					</button>
				</form>
			</div>
			<div class="modal-footer">
				<p>
					<a href="/seller/join.j">회원가입</a>
				</p>
				<p>
					<a href="/seller/find.j">아이디 또는 암호를 잊으셨습니까? </a>
				</p>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>