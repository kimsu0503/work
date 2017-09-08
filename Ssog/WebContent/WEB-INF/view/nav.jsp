<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar {
	border-radius: 0px;
}

.dropdown-submenu {
	
}

.dropdown-submenu .dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -1px;
	height: 200px;
	width: 200px;
}
</style>
<div align="center">
	<div style="width: 67%;">
		<div class="navbar-header">

			<a class="navbar-brand"
				style="background-color: #333333; width: 150px; color: white"
				href="#">카테고리</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a
				style="background-color: #737373; width: 120px;" href="#">Home</a></li>
			<li class="dropdown" id="tt"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">과일<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="dropdown-submenu"><a class="test" tabindex="-1"
						href="#">시발 </a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1" href="">2nd level dropdown</a></li>
							<li><a tabindex="-1" href="#">2nd level dropdown</a></li>
							<li class="dropdown-submenu"><a class="test" href="#">Another
									dropdown</a>
								<ul class="dropdown-menu">
									<li><a href="#">3rd level dropdown</a></li>
									<li><a href="#">3rd level dropdown</a></li>
								</ul></li>
						</ul></li>
				</ul></li>
			<li><a href="#">채소</a></li>
			<li><a href="#">곡물</a></li>
		</ul>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.dropdown-submenu a.test').on("mouseenter", function(e) {
			$(this).next('ul').toggle();
			e.stopPropagation();
			e.preventDefault();
		});
	});
</script>