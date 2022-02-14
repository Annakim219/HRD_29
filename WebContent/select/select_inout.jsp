<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입출고 정보</title>
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
		<h2>입/출고 정보 목록</h2>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=130>입,출고일자</th>
				<th width=80>매장코드</th>
				<th width=90>매장명</th>
				<th width=80>상품코드</th>
				<th width=150>상품명</th>
				<th width=110>입,출고구분</th>
				<th width=80>입고수량</th>
				<th width=80>출고수량</th>
			</tr>		
			<%
				int no = 0;
				
				try{
					String sql = "select to_char(c.inOutDate,'yyyy-mm-dd'), c.storeCode, b.storeName, c.productCode, a.productName, c.gubun, c.saleQty from product0214 a, store0214 b, inOut0214 c where a.productCode=c.productCode and b.storeCode=c.storeCode order by c.inOutDate, c.storeCode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String inOutDate = rs.getString(1);
						String storeCode = rs.getString(2);
						String storeName = rs.getString(3);
						String productCode = rs.getString(4);
						String productName = rs.getString(5);
						String gubun = rs.getString(6);
						String saleQty = rs.getString(7);
						no++;
						
						if(gubun.equals("1")){gubun="입고";}
						else if(gubun.equals("2")){gubun="출고";}
					
						
			%>
			
			<tr>
				<td><%=no %></td>
				<td><%=inOutDate %></td>
				<td><%=storeCode %></td>
				<td><%=storeName %></td>
				<td><%=productCode %></td>
				<td><p id="p2"><%=productName %></p></td>
				<td><%=gubun %></td>
				<td><%if(gubun.equals("입고")){out.print(saleQty);}%></td>
				<td><%if(gubun.equals("출고")){out.print(saleQty);}%></td>
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