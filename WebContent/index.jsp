<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.DBConn" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 출석부 관리 입니다</title>
</head>
<body>
    <!-- get 방식을 사용해서 데이터 전송 (method="get") -->
    <!-- 
    <form action="parameter02.jsp" method="post">
        이름 : <input type="text" name="name" size="10"><br>
        주소 : <input type="text" name="address" size="30"><br>
        취미 :
            <input type="checkbox" name="hobby" value="game">게임
            <input type="checkbox" name="hobby" value="travel">여행
            <input type="checkbox" name="hobby" value="reading">독서
            <br>
        <input type="submit" value="전송">
    </form>-->
    
    <h1>학생 출석부 관리</h1>

    <%
    String id = "";
    String name = "";
    String email = "";
    String age = "";
    
    //1. 연결
	Connection conn = DBConn.getMySqlConnection();
	
	//2. 쿼리를 수행할 객체를 만든다
	Statement stmt = conn.createStatement();
	
	//3. 쿼리 실행 후 결과 받기
	String sql = "select * from user";
	ResultSet rs = stmt.executeQuery(sql);	// sql 실행하고 반환되는 결과값을 rs에 넣는다
	%>
	<table border="1">
    	<tr>
			<th>id</th>
			<th>이름</th>
			<th>이메일</th>
			<th>나이</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
	<%
	//4. 데이터 가져오기
	if(rs.next()) {
		do{
			id = rs.getString("id");
			name = rs.getString("name");
			email = rs.getString("email");
			age = rs.getString("age");
		%>
			<tr> <!-- %=는 자바 변수 그대로 가져올때 쓰는거 -->
				<th><%= id %></th>
				<th><%= name %></th>
				<th><%= email %></th>
				<th><%= age%></th>
				<th><input type="button" value="삭제" onclick="deleteStudent('<%=id%>');"/></th>
				<th><input type="button" value="수정" onclick="updateStudent('<%=id%>');"/></th>
			</tr>
	<%
		}while(rs.next());
	} else {
			out.print("없음");
	}
	%>
	</table>
	<br>

	<table>
		<tr>
			<td>
				<form action="main/create.jsp" method="post">
					<input type="submit" value="학생 추가">
				</form>
			</td>
			
			<td>
				<form name=listForm method="post">
					<input type="hidden" id="student_id" name="student_id"/>	<!-- submit은 다른 페이지로 form안에 있는 내용이 넘어가는게 보이지만 hidden은 넘어가는게 보이지 않음 -->
				</form>	<!-- id는 고유한거. name은 중복돼도 되는거. 다른 페이지로 form안의 내용을 넘길때는 name의 값이 넘어간다. -->
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function deleteStudent(student_id) {
		var student_id = student_id;
		
		document.getElementById('student_id').value = student_id;	// 이 내용 안에서 '~~'라는 요소를 id에 의해 가져온다.
		document.listForm.action = "main/delete.jsp";
		document.listForm.submit();	// deleteForm = 삭제하는거 form이름
	}

	function updateStudent(student_id) {
		var student_id = student_id;
		
		document.getElementById('student_id').value = student_id;	// 이 내용 안에서 '~~'라는 요소를 id에 의해 가져온다.
		document.listForm.action = "main/update.jsp";
		document.listForm.submit();	// deleteForm = 삭제하는거 form이름
	}
</script>
</html>