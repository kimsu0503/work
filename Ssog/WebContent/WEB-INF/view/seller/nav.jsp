<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <div class="navbar navbar-default">
	<div class="navbar-header">
		<c:if test="${sessionScope.seller_id ne null }">
			<a href="#" class="navbar-brand"><b>${sessionScope.seller_id}님</b></a>
		</c:if>
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNav">+</button>
		<!-- 화면 작아졌을때 + 버튼 뜬다. navbar-inverse로 하면 버튼이 안뜸 -->
	</div>
	<div class="collapse navbar-collapse" id="myNav">
		<ul class="nav navbar-nav">
			<li><a href="#">게시판</a></li>
			<li><a href="#">자료실</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${sessionScope.seller_id eq null}">
					<li>냐무냐무</li>
				</c:when>
				<c:otherwise>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">MyPage<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">나의 정보</a></li>
							<li><a href="#">프로필 사진변경</a></li>
							<li><a href="#">쪽지함</a></li>
							<li><a href="#">로그아웃</a></li>
						</ul>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>

<c:if test="${sessionScope.seller_id ne null}">
	<script>
		var ws = new WebSocket("ws://192.168.10.90/ws/alert.ws");
		ws.onmessage = function(e){
			window.alert(e.data);
			var audio = new Audio('/alert.mp3');
			audio.play();
		};
	</script>
</c:if> --%>