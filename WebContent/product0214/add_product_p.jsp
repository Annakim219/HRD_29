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
			String sql = "insert into product0214 values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			pstmt.setString(2, productName);
			pstmt.setString(3, storeCode);
			pstmt.setString(4, unitprice);
			pstmt.setString(5, stockQty);
			pstmt.executeUpdate();
			System.out.println("상품 테이블 등록 성공");
			%>
			<script>
				alert('상품 테이블 등록 성공');
				location.href="/HRD0214/select/select_product.jsp";
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
