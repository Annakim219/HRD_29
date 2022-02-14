<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입고 내역(금액)정보</title>
<style>
th{
	height: 35px;
	background: lightsteelblue;
}
td{
	height: 25px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>입고 내역(금액)정보</h2>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=130>입,출고일자</th>
				<th width=80>매장코드</th>
				<th width=110>매장명</th>
				<th width=80>상품코드</th>
				<th width=150>상품명</th>
				<th width=80>입고수량</th>
				<th width=150>단가</th>
				<th width=150>입고금액</th>
				<th width=150 style="background:lightcoral;">할인금액(10%)</th>
			</tr>		
			<%
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				
				try{
					String sql = "select to_char(c.inOutDate,'yyyy-mm-dd'), c.storeCode, b.storeName, c.productCode, a.productName, c.gubun, c.saleQty, a.unitprice, (c.saleQty*a.unitprice) from product0214 a, store0214 b, inOut0214 c where a.productCode=c.productCode and b.storeCode=c.storeCode and c.gubun=1 order by c.inOutDate, c.storeCode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String inOutDate = rs.getString(1);
						String storeCode = rs.getString(2);
						String storeName = rs.getString(3);
						String productCode = rs.getString(4);
						String productName = rs.getString(5);
						String gubun = rs.getString(6);
						int saleQty = rs.getInt(7);
						int unitprice = rs.getInt(8);
						int i_total = rs.getInt(9);
						double discount = rs.getInt(9)*0.9;
						no++;
					
			%>
			
			<tr>
				<td><%=no %></td>
				<td><%=inOutDate %></td>
				<td><%=storeCode %></td>
				<td><%=storeName %></td>
				<td><%=productCode %></td>
				<td><p id="p2"><%=productName %></p></td>
				<td><%=saleQty %></td>
				<td><p id="p1"><%=df.format(unitprice)%></p></td>
				<td><p id="p1"><%=df.format(i_total)%></p></td>
				<td><p id="p1"><%=df.format(discount)%></p></td>
			</tr>
			
			<%
					}
					
				}catch(SQLException e){
					System.out.println("데이터 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class="btn_group" align="center">
			<input id="btn2" type="button" value="입출고 정보 추가" onclick="location.href='/HRD0214/inout0214/add_inout.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>