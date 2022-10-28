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
<%@ include file="dbconn.jsp" %>
<h3>회원 목록 조회/수정</h3>
<table class="select">
  <tr>
    <th>고객번호</th>
    <th>회원성명</th>
    <th>전화번호</th>
    <th>주소</th>
    <th>가입일자</th>
    <th>고객등급</th>
    <th>거주지역</th>
  </tr>
<%
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  try{
	  String sql="select custnu,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member1026";
	  pstmt=conn.prepareStatement(sql);
	  rs=pstmt.executeQuery();
	  while(rs.next()){
		  String custnu=rs.getString(1);
		  String custname=rs.getString(2);
		  String phone=rs.getString(3);
		  String address=rs.getString(4);
		  String joindate=rs.getString(5);
		  String grade=rs.getString(6);
		  if(grade.equals("A")||grade.equals("a")){
			  grade="VIP";
		  }else if(grade.equals("B")||grade.equals("b")){
			  grade="일반";
		  }else if(grade.equals("C")||grade.equals("c")){
			  grade="직원";
		  }
		  String city=rs.getString(7);	  
%>
  <tr>
    <td><a href="update.jsp?custnu=<%=custnu%>"><%=custnu %></a></td>
    <td><%=custname %></td>
    <td><%=phone %></td>
    <td><%=address %></td>
    <td><%=joindate %></td>
    <td><%=grade %></td>
    <td><%=city%></td>
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