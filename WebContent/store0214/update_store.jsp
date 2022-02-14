<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 정보 수정</title>
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
		if(document.form.storeName.value==""){
			alert('매장명이 입력되지 않았습니다.');
			document.form.storeName.focus();
		}else if(document.form.productCode.value==""){
			alert('상품코드가 입력되지 않았습니다.');
			document.form.productCode.focus();
		}else if(document.form.Qty.value==""){
			alert('수량이 입력되지 않았습니다.');
			document.form.Qty.focus();
		}else{
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
		String send_storeCode = request.getParameter("storeCode");
		String send_productCode = request.getParameter("productCode");
		
		try{
			String sql = "select a.storeCode, a.storeName, a.productCode, b.productName a.Qty from store0214 a, product0214 b where a.productCode=b.productCode and a.storeCode=? and a.productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_storeCode);
			pstmt.setString(2, send_productCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String storeCode = rs.getString(1);
				String storeName = rs.getString(2);
				String productCode = rs.getString(3);
				String productName = rs.getString(4);
				String Qty = rs.getString(5);
				%>
				
		<h2>매장 수정 화면</h2>
		<form name="form" method="post" action="update_store_p.jsp">
		<table>
			<tr>
				<th>매장코드</th>
				<td><input id="in1" type="text" name="storeCode" value="<%=storeCode %>" readonly >
				<span>sequence 발생</span></td>
			</tr>
			<tr>
				<th>매 장 명</th>
				<td><input id="in1" type="text" name="storeName" value="<%=storeName %>"></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input id="in1" type="text" name="productCode" value="<%=productCode %>" readonly>
				</td>
			</tr>
			<tr>
				<th>상 품 명</th>
				<td><input id="in1" type="text" name="productName" value="<%=productName %>" readonly></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input id="in1" type="text" name="Qty" value="<%=Qty %>"></td>
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