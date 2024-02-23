<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.PersonVo" %>
<%@ page import="com.javaex.dao.PhoneDao" %>
<%@ page import="java.util.List" %>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String company = request.getParameter("company");

	List<PersonVo> personList = (List<PersonVo>)request.getAttribute("personList");
	System.out.println(personList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전화번호부</h1>
	
	<h2>수정폼</h2>
	
	
	<p>
		전화번호를 등록하려면 <br>
		아래 항목을 기입하고 "수정"버튼을 클릭하세요
	</p>
	<form action="/phonebook3/pbc" method="get">
		
		<input type="text" name="no" value="${requestScope.personVo.no}">
	
		<div>
			<label>이름(name)</label>
			<input type="text" name="name" value="${requestScope.personVo.name}">
		</div>
		
		<div>
			<label>핸드폰(hp)</label>
			<input type="text" name="hp" value="${requestScope.personVo.hp}">
		</div>
		
		<div>
			<label>회사(company)</label>
			<input type="text" name="company" value="${requestScope.personVo.company}">
		</div>
		
		<input type="hidden" name="action" value="update">
		
		<button type="submit">수정</button>
	</form>
	
	<a href="">리스트페이지 바로가기</a>
</body>
</html>