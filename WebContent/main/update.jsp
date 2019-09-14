<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
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
<title>학생 수정 페이지</title>
</head>
<body>
<%
	String student_id = request.getParameter("student_id");	// getParameter는 폼 안에 있는 name값을 가져온다
	System.out.println(student_id);
	
	//데이터 가져오기
    String id = "";
    String name = "";
    String email = "";
    String age = "";
    
    //1. 연결
	Connection conn = DBConn.getMySqlConnection();
	
	//2. 쿼리를 수행할 객체를 만든다
	Statement stmt = conn.createStatement();
	
	//3. 쿼리 실행 후 결과 받기
	String sql = "select * from user where id = '"+student_id+"'";
	ResultSet rs = stmt.executeQuery(sql);	// sql 실행하고 반환되는 결과값을 rs에 넣는다
	
	//4. 데이터 가져오기
		if(rs.next()) {
			do{
				id = rs.getString("id");
				name = rs.getString("name");
				email = rs.getString("email");
				age = rs.getString("age");
			}while(rs.next());
		} else {
				out.print("없음");
		}
	%>
	
	<form action="updateProcess.jsp" method="post">
		id : <input type="text" value="<%= id %>" name="id" size="15" readonly="readonly"><br>
		<!-- disabled도 잠궈버리는건데 이거는 아예 사용 불가능이라서 다음 page로 넘겨줄 히든 값을 따로 만들어야 한다. -->
		이름 : <input type="text" value="<%= name %>" name="name" size="20"><br>
		나이 : <input type="text" value="<%= age %>" name="age" size="3"><br>
		이메일 : <input type="text" value="<%= email %>" name="email" size="30">
		<br><br><input type="submit" value="수정할래유">
	</form>

</body>
</html>