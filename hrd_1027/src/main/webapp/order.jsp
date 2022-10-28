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
<h3>회원 매출 조회</h3>
<%@ include file="dbconn.jsp" %>
<table class="order">
  <tr>
    <th>회원번호</th>
    <th>회원성명</th>
    <th>고객등급</th>
    <th>매출</th>
  </tr>
<%
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try{
    	 String sql="select a.custnu,a.custname,a.grade,sum(b.price) from member1026 a,money1026 b where a.custnu=b.custnu group by a.custnu,a.custname,a.grade order by sum(b.price) desc";
    	 pstmt=conn.prepareCall(sql);
    	 rs=pstmt.executeQuery();
    	 while(rs.next()){
    		 String custnu=rs.getString(1);
    		 String custname=rs.getString(2);
    		 String grade=rs.getString(3);
    		 if(grade.equals("A")||equals("a")){
    			 grade="VIP";
    		 }else if(grade.equals("B")||equals("b")){
    			 grade="일반";
    		 }else if(grade.equals("C")||equals("c")){
    			 grade="직원";
    		 }
    		 int price=rs.getInt(4);
   
 %>
  <tr>
    <td><%=custnu %></td>
    <td><%=custname %></td>
    <td><%=grade %></td>
    <td><%=price %></td>
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