<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 정보 수정</title>
<style>
tr{
	height: 30px;
}

th{
	width: 150px;
	background: lightsteelblue;
}

td{
	width: 300px;
}

span{
	font-size: 0.9em;
}

#in1{
	height: 22px;
	margin-left: 2px;
}
</style>
<script>
	function check(){
		if(document.form.productName.value==""){
			alert('상품명이 입력되지 않았습니다.');
			document.form.productName.focus();
		}else if(document.form.storeCode.value==""){
			alert('매장코드가 입력되지 않았습니다.');
			document.form.storeCode.focus();
		}else if(document.form.unitprice.value==""){
			alert('단가가 입력되지 않았습니다.');
			document.form.unitprice.focus();
		}else if(document.form.stockQty.value==""){
			alert('재고수량이 입력되지 않았습니다.');
			document.form.stockQty.focus();
		}else{
			document.form.submit();
		}
	}

</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String send_productCode = request.getParameter("productCode");
		String send_storeCode = request.getParameter("storeCode");
		
		try{
			String sql = "select a.productCode, a.productName, a.storeCode, b.storename, a.unitprice, a.stockQty from product0214 a, store0214 b where a.storeCode=b.storeCode and a.productCode=? and a.storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_productCode);
			pstmt.setString(2, send_storeCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String productCode = rs.getString(1);
				String productName = rs.getString(2);
				String storeCode = rs.getString(3);
				String storeName = rs.getString(4);
				String unitprice = rs.getString(5);
				String stockQty = rs.getString(6);
				%>
				
		<h2>상품 수정 화면</h2>
		<form name="form" method="post" action="update_product_p.jsp">
		<table>
			<tr>
				<th>상품코드(자동생성)</th>
				<td><input id="in1" type="text" name="productCode" value="<%=productCode %>" readonly>
				<span>마지막번호+1</span></td>
			</tr>
			<tr>
				<th>상 품 명</th>
				<td><input id="in1" type="text" name="productName" value="<%=productName %>"></td>
			</tr>
			<tr>
				<th>매장코드</th>
				<td><input id="in1" type="text" name="storeCode" value="<%=storeCode %>" readonly></td>
			</tr>
			<tr>
				<th>매 장 명</th>
				<td><input id="in1" type="text" name="storeName" value="<%=storeName %>" readonly> </td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input id="in1" type="text" name="unitprice" value="<%=unitprice %>"></td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td><input id="in1" type="text" name="stockQty" value="<%=stockQty %>"></td>
			</tr>
			<tr id="tr_btn">
				<td colspan=2 align="center">
				<input id="btn1" type="button" value="수정" onclick="check()">
				<input id="btn1" type="button" value="취소" onclick="location.href='/HRD0214/index.jsp'"></td>
			</tr>
		</table>		
		</form>
		<%
			}			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>