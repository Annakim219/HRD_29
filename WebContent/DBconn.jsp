<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "1234";
		String driver = "oracle.jdbc.OracleDriver";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("오라클 연결 성공");

	} catch (SQLException e) {
		System.out.println("오라클 연결 실패");
		e.printStackTrace();
	}
%>