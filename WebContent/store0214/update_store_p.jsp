<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp"%>

	<%
	String storeCode = request.getParameter("storeCode");
	String storeName = request.getParameter("storeName");
	String productCode = request.getParameter("productCode");
	String Qty = request.getParameter("Qty");
	
		try{
			String sql = "update store0214 set storeName=?, Qty=? where storeCode=? and productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeName);
			pstmt.setString(2, Qty);
			pstmt.setString(3, storeCode);
			pstmt.setString(4, productCode);			
			pstmt.executeUpdate();
			System.out.println("매장 테이블 수정 성공");
			%>
			<script>
				alert('매장 테이블 수정 성공');
				location.href="/HRD0214/select/select_store.jsp";
			</script>
			<%
			
			
		}catch(SQLException e){
			System.out.println("수정 실패");
			%>
			<script>
				alert('수정 실패');
				history.back(-1);
			</script>
			<%
			e.printStackTrace();
		}
	%>
