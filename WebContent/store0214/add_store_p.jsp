<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp"%>

	<%
	String storeCode = request.getParameter("storeCode");
	String storeName = request.getParameter("storeName");
	String productCode = request.getParameter("productCode");
	String Qty = request.getParameter("Qty");
	
		try{
			String sql = "insert into store0214 values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeCode);
			pstmt.setString(2, storeName);
			pstmt.setString(3, productCode);
			pstmt.setString(4, Qty);
			pstmt.executeUpdate();
			System.out.println("매장 테이블 등록 성공");
			%>
			<script>
				alert('매장 테이블 등록 성공');
				location.href="/HRD0214/select/select_store.jsp";
			</script>
			<%
			
			
		}catch(SQLException e){
			System.out.println("등록 실패");
			%>
			<script>
				alert('등록 실패');
				history.back(-1);
			</script>
			<%
			e.printStackTrace();
		}
	%>
