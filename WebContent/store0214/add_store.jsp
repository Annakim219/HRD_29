<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 정보 등록</title>
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
			form.action = 'add_store_p.jsp';
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
		String storeCode = request.getParameter("storeCode");
		String storeName = request.getParameter("storeName");
		String productCode = request.getParameter("productCode");
		String Qty = request.getParameter("Qty");
		String productName="";
		int store_seq = 0;
		
		if(productCode==null){
			storeCode = "";
			storeName="";
			productCode = "";
			productName = "";
			Qty = "";
			store_seq = 0;						
		}
		
		try{
			String sql = "select store0214_seq.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				store_seq = rs.getInt(1);
			}
				
			sql = "select productCode, productName from product0214 where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productCode = rs.getString(1);
				productName = rs.getString(2);
				}else if(productCode !=""){
					%>
					<script>
						alert('등록되어 있지 않는 상품코드입니다.');
					</script>
					<%
				}					
		
			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
		<h2>매장 등록 화면</h2>
		<form name="form" method="post" action="add_store.jsp">
		<table>
			<tr>
				<th>매장코드</th>
				<td><input id="in1" type="text" name="storeCode" value="<%=store_seq %>" >
				<span>sequence 발생</span></td>
			</tr>
			<tr>
				<th>매 장 명</th>
				<td><input id="in1" type="text" name="storeName" value="<%=storeName %>"></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input id="in1" type="text" name="productCode" value="<%=productCode %>" onchange="changesubmit()">
				</td>
			</tr>
			<tr>
				<th>상 품 명</th>
				<td><input id="in1" type="text" name="productName" value="<%=productName %>"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input id="in1" type="text" name="Qty" value="<%=Qty %>"></td>
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