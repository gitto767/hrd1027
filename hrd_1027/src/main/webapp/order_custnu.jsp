<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
<h3>회원 매출 조회</h3>
<%@ include file="dbconn.jsp" %>
<table class="order">
  <tr>
    <th>no</th>
    <th>회원번호</th>
    <th>판매번호</th>
    <th>단가</th>
    <th>수량</th>
    <th>가격</th>
    <th>상품코드</th>
    <th>판매일자</th>
    <th>구분</th>
  </tr>
<%
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      int no=0;
      try{
    	 String sql="select custnu,saleno,pcost,amount,price,pcode,to_char(sdate,'YYYY-MM-DD') from money1026";
    	 pstmt=conn.prepareCall(sql);
    	 rs=pstmt.executeQuery();
    	 while(rs.next()){
    		 String custnu=rs.getString(1);
    		 String saleno=rs.getString(2);
    		 String pcost=rs.getString(3);
    		 String amount=rs.getString(4);
    		 String price=rs.getString(5);
    		 String pcode=rs.getString(6);
    		 String sdate=rs.getString(7); 
    		 no++;
 %>
  <tr>
    <td><%=no %></td>
    <td><%=custnu %></td>
    <td><%=saleno %></td>
    <td><%=pcost %></td>
    <td><%=amount %></td>
    <td><%=price %></td>
    <td><%=pcode %></td>
    <td><%=sdate %></td>
    <td><a href="#">삭제</a></td>
  </tr>  
<%
     	 }
      }catch(Exception e){
     	 System.out.println("조회실패");
     	 e.printStackTrace();
      }
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>