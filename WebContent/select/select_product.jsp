<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 정보</title>
<style>
th{
	height: 35px;
	background: lightsteelblue;
}
td{
	height: 25px;
	text-align: center;
}
.cnt{
	display: table;
	width: 730px;
	height: 30px;
	margin: 0 auto;
	font-size: 0.9em;
}
#td1{
	background: grey;
}
#td1 > a{
	color: white;
	text-decoration: none;
}
#td1 > a:HOVER{
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		int cnt = 0;
		try{
			String sql = "select count(*) from product0214";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			
		}catch(SQLException e){
			System.out.println("count 조회 실패");
			e.printStackTrace();
		}
	%>
		<h2>상품 정보 목록</h2>
		<div class="cnt">
			<span>총 <b><%=cnt %>개</b>의 상품정보가 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=80>상품코드</th>
				<th width=150>상품명</th>
				<th width=80>매장코드</th>
				<th width=100>매장명</th>
				<th width=130>단 가</th>
				<th width=50>수 량</th>
				<th width=60>관리</th>
			</tr>		
			<%
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				
				try{
					String sql = "select a.productCode, a.productName, a.storeCode, b.storeName, a.unitprice, a.stockQty from product0214 a, store0214 b where a.storeCode=b.storeCode order by a.productCode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String productCode = rs.getString(1);
						String productName = rs.getString(2);
						String storeCode = rs.getString(3);
						String storeName = rs.getString(4);
						int unitprice = rs.getInt(5);
						String stockQty = rs.getString(6);
						no++;
			%>
			
			<tr>
				<td><%=no %></td>
				<td id="td1"><a href="/HRD0214/product0214/update_product.jsp?productCode=<%=productCode%>&storeCode=<%=storeCode%>"><%=productCode %></a></td>
				<td><p id="p2"><%=productName %></p></td>
				<td><%=storeCode %></td>
				<td><%=storeName %></td>
				<td><p id="p1"><%=df.format(unitprice)%></p></td>
				<td><%=stockQty %></td>
				<td>
				<a href="/HRD0214/product0214/delete_product.jsp?productCode=<%=productCode%>&storeCode=<%=storeCode%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a></td>				
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
			<input id="btn2" type="button" value="상품 정보 추가" onclick="location.href='/HRD0214/product0214/add_product.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>