<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp"%>

	<%
	String productCode = request.getParameter("productCode");
	String productName = request.getParameter("productName");
	String storeCode = request.getParameter("storeCode");
	String unitprice = request.getParameter("unitprice");
	String stockQty = request.getParameter("stockQty"); 
	
		try{
			String sql = "update product0214 set productName=?, unitprice=?, stockQty=? where productCode=? and storeCode=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, unitprice);
			pstmt.setString(3, stockQty);
			pstmt.setString(4, productCode);
			pstmt.setString(5, storeCode);
			pstmt.executeUpdate();
			System.out.println("상품 테이블 수정 성공");
			%>
			<script>
				alert('상품 테이블 수정 성공');
				location.href="/HRD0214/select/select_product.jsp";
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
