<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.DBConn" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 연결
	Connection conn = DBConn.getMySqlConnection();
	
	//2. 쿼리를 수행할 객체를 만든다
	Statement stmt = conn.createStatement();
	
	//3. 쿼리 실행 후 결과 받기
	String sql = "select * from user";
	ResultSet rs = stmt.executeQuery(sql);	// sql 실행하고 반환되는 결과값을 rs에 넣는다
	
	//4. 데이터 가져오기
	if(rs.next()) {
		do{
			out.print("<br>");
			out.print(rs.getString("id")+"<br>");
			out.print(rs.getString("name")+"<br>");
			out.print(rs.getString("email")+"<br>");
			out.print(rs.getString("age")+"<br>");
		}while(rs.next());
	} else {
			out.print("없음");
	}
%>