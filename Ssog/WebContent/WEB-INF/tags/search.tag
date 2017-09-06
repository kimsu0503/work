<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="message" %>
<%
	String str="";
	switch(message){
		case "pro_name":
			str = "상품명";
			break;
		case "cate" :
			str = "카테고리";
			break;
		case "pro_date":
			str="일자별";
			break;
		case "origin":
			str="원산지";
			break;
		case "sell_on":
			str="판매상태";
			break;
		case "pro_num":
			str="상품번호";
			break;
	}
%>
<%=str%>