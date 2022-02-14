<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 정보 등록</title>
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
			form.action = 'add_product_p.jsp';
			document.form.submit();
		}
	}
	
	function changesubmit(){
		document.form.submit();
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String storeCode = request.getParameter("storeCode");
		String unitprice = request.getParameter("unitprice");
		String stockQty = request.getParameter("stockQty");
		String storeName="";
		int pcode = 0;
		
		if(storeCode==null){
			productCode = "";
			productName = "";
			storeCode = "";
			unitprice = "";
			stockQty = "";
			storeName="";
			pcode = 0;			
		}		
		
		try{
			String sql = "select max(productCode) from product0214";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pcode = rs.getInt(1) + 1;
			}
				
			sql = "select storeCode, storeName from store0214 where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeCode = rs.getString(1);
				storeName = rs.getString(2);
				}else if(storeCode !=""){
					%>
					<script>
						alert('등록되어 있지 않는 매장코드입니다.');
					</script>
					<%
				}					
		
			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
		<h2>상품 등록 화면</h2>
		<form name="form" method="post" action="add_product.jsp">
		<table>
			<tr>
				<th>상품코드(자동생성)</th>
				<td><input id="in1" type="text" name="productCode" value="<%=pcode %>">
				<span>마지막번호+1</span></td>
			</tr>
			<tr>
				<th>상 품 명</th>
				<td><input id="in1" type="text" name="productName" value="<%=productName %>"></td>
			</tr>
			<tr>
				<th>매장코드</th>
				<td><input id="in1" type="text" name="storeCode" value="<%=storeCode %>" onchange="changesubmit()"></td>
			</tr>
			<tr>
				<th>매 장 명</th>
				<td><input id="in1" type="text" name="storeName" value="<%=storeName %>"></td>
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
				<input id="btn1" type="button" value="등록" onclick="check()">
				<input id="btn1" type="button" value="취소" onclick="location.href='/HRD0214/index.jsp'"></td>
			</tr>
		</table>		
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>