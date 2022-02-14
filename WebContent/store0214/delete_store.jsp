<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp"%>

	<%
	String storeCode = request.getParameter("storeCode");
	String productCode = request.getParameter("productCode");

	
		try{
			String sql = "delete from store0214 where storeCode=? and productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeCode);
			pstmt.setString(2, productCode);			
			pstmt.executeUpdate();
			System.out.println("매장 테이블 삭제 성공");
			%>
			<script>
				alert('매장 테이블 삭제 성공');
				location.href="/HRD0214/select/select_store.jsp";
			</script>
			<%
			
			
		}catch(SQLException e){
			System.out.println("삭제 실패");
			%>
			<script>
				alert('삭제 실패');
				history.back(-1);
			</script>
			<%
			e.printStackTrace();
		}
	%>
