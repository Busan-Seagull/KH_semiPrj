<%@page import="com.kh.dobby.common.PageVo"%>
<%@page import="com.kh.dobby.event.vo.EventVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<EventVo> list = (List<EventVo>) request.getAttribute("list");
	PageVo pv = (PageVo) request.getAttribute("pv");
%>

<div id="list-title">
	<p>NO</p>
	<p>DIFFICULTY</p>
	<p>SCORE</p>
	<p>GET POINT</p>
	<p>DATE</p>
</div>
<%for(int i = 0; i < list.size(); i++){
	EventVo vo = list.get(i);
%>
	<div class="history-item">
		<p><%=vo.getNo() %></p>
		<p><%=vo.getDifficulty() %></p>
		<p><%=vo.getScore() %></p>
		<p><%=vo.getPoint() %></p>
		<p><%=vo.getDate() %></p>
	</div>
<%} %>
<div id="page-area">
	<ul id="page-nation">
		<li><a onclick="getListPost(1);" class="first"><<</a></li>
		<%if(pv.getCurrentPage()==1){ %>
		<li><a class="arrow left none-select"><</a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()-1 %>);" class="arrow left"><</a></li>
		<%} %>
		<%if(pv.getCurrentPage()-2<1){ %>
		<li><a class="num p-none"></a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()-2 %>);" class="num"><%=pv.getCurrentPage()-2 %></a></li>
		<%} %>
		<%if(pv.getCurrentPage()-1<1){ %>
		<li><a class="num p-none"></a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()-1 %>);" class="num"><%=pv.getCurrentPage()-1 %></a></li>
		<%} %>
		<li><a class="num"><%=pv.getCurrentPage() %></a></li>
		<%if(pv.getCurrentPage()+1>pv.getMaxPage()){ %>
		<li><a class="num p-none"></a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()+1 %>);" class="num"><%=pv.getCurrentPage()+1 %></a></li>
		<%} %>
		<%if(pv.getCurrentPage()+2>pv.getMaxPage()){ %>
		<li><a class="num p-none"></a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()+2 %>);" class="num"><%=pv.getCurrentPage()+2 %></a></li>
		<%} %>
		<%if(pv.getCurrentPage()==pv.getMaxPage()){ %>
		<li><a class="arrow right none-select">></a></li>
		<%}else{ %>
		<li><a onclick="getListPost(<%=pv.getCurrentPage()+1 %>);" class="arrow right">></a></li>
		<%} %>
		<li><a onclick="getListPost(<%=pv.getMaxPage() %>);" class="last">>></a></li>
	</ul>
</div>