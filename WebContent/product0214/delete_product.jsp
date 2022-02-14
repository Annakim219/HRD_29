<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp"%>

	<%
	String productCode = request.getParameter("productCode");
	String storeCode = request.getParameter("storeCode");

		try{
			String sql = "delete from product0214 where productCode=? and storeCode=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			pstmt.setString(2, storeCode);
			pstmt.executeUpdate();
			System.out.println("상품 테이블 삭제 성공");
			%>
			<script>
				alert('상품 테이블 삭제 성공');
				location.href="/HRD0214/select/select_product.jsp";
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
