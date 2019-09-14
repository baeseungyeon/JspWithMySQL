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
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String student_id = request.getParameter("student_id");	// getParameter는 폼 안에 있는 name값을 가져온다
	System.out.println(student_id);
	
	// 삭제하기
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "delete from user where id = ?";	// insert할땐 (?,?,?)이렇게 하는데 delete에선 (?)이런거 안쓴다.
													// 여러개 삭제할땐 where id = ? and name = ? 이렇게 작성한다.
	int n = 0;
	
	try {
		conn = DBConn.getMySqlConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, student_id);
		
		n = pstmt.executeUpdate();
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