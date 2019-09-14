<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");
%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 추가 페이지</title>
</head>
<body>
	<form action="insert.jsp" method="post">
	  id : <input type="text" name="id" size="30" maxLength="15"><br>
	    이름 : <input type="text" name="name" size="30" maxLength="20"><br>
	    나이 : <input type="text" name="age" size="30" maxLength="3"><br>
	    이메일 : <input type="text" name="email" size="30" maxLength="30">
	  <!-- maxLength = 글자수 제한 -->
		<input type="submit" value="학생 추가">
	</form>
</body>
</html>