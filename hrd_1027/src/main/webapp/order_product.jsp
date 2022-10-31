<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>회원 매출 정보 목록(상품명)</h3>
  <%@ include file="dbconn.jsp" %>
  <table class="order">
		<tr>
			<th>no</th>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>판매번호</th>
			<th>단가</th>
			<th>수량</th>
			<th>가격</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>판매일자</th>
		</tr>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
	try{
		String sql="select a.custnu,b.custname,a.saleno,to_char(a.pcost,'999,999,999'),to_char(a.amount,'999,999,999'),to_char(a.price,'999,999,999'),a.pcode,c.pname,to_char(a.sdate,'yyyy-mm-dd') from money1026 a,member1026 b,product1026 c where a.custnu=b.custnu and a.pcode=c.pcode";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int no=0;
		while(rs.next()){
			String custnu=rs.getString(1);
			String custname=rs.getString(2);
			String saleno=rs.getString(3);
     		String pcost=rs.getString(4);
			String amount=rs.getString(5);
			String price=rs.getString(6);
			String pcode=rs.getString(7);
			String pname=rs.getString(8);
			String sdate=rs.getString(9);
			no++;

%>
		<tr>
			<td><%=no %></td>
			<td><%=custnu %></td>
			<td><%=custname %></td>
			<td><%=saleno %></td> 
			<td><%=pcost %></td>
			<td><%=amount %></td>
			<td><%=price %></td>
			<td><%=pcode %></td>
			<td><%=pname %></td>
			<td><%=sdate %></td>
			</tr>
		<%
		}

	}catch(Exception e){
		System.out.println("데이터베이스오류");
		e.printStackTrace();
	}

		%>

</table>

 
  </section>
<%@ include file="footer.jsp" %>

</body>
</html>