<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="message" %>
<%
	String str="";
	switch(message){
	case "1":
		str="판매중";
		break;
	case "0":
		str="판매완료";
		break;
	}
%>
<%=str%>