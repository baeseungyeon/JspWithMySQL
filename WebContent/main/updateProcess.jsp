<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.DBConn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String age = request.getParameter("age");
	System.out.println(name);
	
	// db에 저장하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user set name=?, age=?, email=? where id=?";
		int n = 0;
		
		try {
			conn = DBConn.getMySqlConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, age);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			
			n = pstmt.executeUpdate();
			
			response.sendRedirect("../index.jsp");
		} catch(SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
			} catch(SQLException se) {
				System.out.println(se.getMessage());
			}
		}
%>
</body>
</html>