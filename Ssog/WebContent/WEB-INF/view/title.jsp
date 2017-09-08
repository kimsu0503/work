<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div style="min-height: 8%;" id="banner">
   <img class="img-responsive" src="/image/banner1.jpg" alt="메인이미지1" />
   <button id="close" style="position: absolute; top: 20px; right: 240px;">X</button>
</div>
   <div class="navbar navbar navbar-fixed" style="margin-bottom: 0px;">
      <div class="navbar-header" style="padding-left: 14%;">
         <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target="#myNav">
            <span class="icon-bar" style="background-color: black;"></span><span
               class="icon-bar" style="background-color: black;"></span><span
               class="icon-bar" style="background-color: black;"></span>
         </button>
      </div>
      <div class="collapse navbar-collapse" id="myNav"
         style="padding-right: 24%;">
         <ul class="nav navbar-nav navbar-right">
            <c:choose>
               <c:when test="${sessionScope.auth eq null}">
                  <li id="log"><a id="myBtn"
                     style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">로그인</a></li>
                  <li><a href="/member/join.j"
                     style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">회원가입</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="/member/logout.j"
                     style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">로그아웃</a></li>
               </c:otherwise>
            </c:choose>
            <li><a href="/member/myinfo/info.j"
               style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">마이페이지</a></li>
            <li><a href="/cart/form.j"
               style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">장바구니</a></li>
            <li><a href="/cccenter/faq.j"
               style="padding: 0px; padding-right: 18px; padding-top: 10px; font-size: 13px;">고객센터</a></li>
         </ul>
      </div>
   </div>
   <div align="center">
      <div style="width: 63%;">
         <div class="row" style="margin: 0px;">
            <div class="col-sm-3" align="left">
               <h1>
                  <a href="/" style="text-decoration: none; color: black;">SSOG</a>
               </h1>
            </div>
            <div class="col-sm-6" style="padding-top: 23px;">
               <form action="/product/list.j" autocomplete="off">
                  <div class="input-group">
                     <input type="text" class="form-control" name="search"
                        placeholder="검색어를 입력하세요" style="width: 100%;" required>
                     <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                           <i class="glyphicon glyphicon-search"
                              style="width: 20px; height: 20px;"></i>
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
                  <span class="glyphicon glyphicon-lock"></span> 로그인
               </h4>
            </div>
            <div class="modal-body" style="padding: 40px 50px;">
               <form role="form" action="/member/login_rst.j" method="post">
                  <div class="form-group">
                     <label for="usrname"> SSOG 로그인</label><br /> <input type="text"
                        class="form-control" name="id" placeholder="아이디">
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" name="pass"
                        placeholder="암호">
                  </div>
                  <div class="checkbox">
                     <label><input type="checkbox" name="keep" />로그인 유지</label>
                  </div>
                  <button type="submit" class="btn btn-info btn-block">
                     <span class="glyphicon glyphicon-off"></span> 로그인
                  </button>
               </form>
            </div>
            <div class="modal-footer">
               <p>
                  <a href="/member/join.j">회원가입</a>
               </p>
               <p>
                  <a href="/member/find.j">아이디 또는 암호를 잊으셨습니까? </a>
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
      $("#close").on("click", function() {
         $("#banner").hide();
      });
   </script>