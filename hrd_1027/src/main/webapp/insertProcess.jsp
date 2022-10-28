<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
  //request.setCharacterEncoding("utf-8"); dbconn에서 했으므로안해줘두됨//
  String custnu=request.getParameter("custnu");
  String custname=request.getParameter("custname");
  String phone=request.getParameter("phone");
  String address=request.getParameter("address");
  String joindate=request.getParameter("joindate");
  String grade=request.getParameter("grade");
  String city=request.getParameter("city");
  
  PreparedStatement pstmt=null;
  try{
	  String sql="insert into member1026 values(?,?,?,?,?,?,?)";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, custnu);
	  pstmt.setString(2, custname);
	  pstmt.setString(3, phone);
	  pstmt.setString(4, address);
	  pstmt.setString(5, joindate);
	  pstmt.setString(6, grade);
	  pstmt.setString(7, city);
	  pstmt.executeUpdate();
	  %>
	  <script>
	  alert("등록 완료");
	  location.href="select.jsp";
	  </script>
	  <%
  }catch(Exception e){
	  System.out.println("등록 실패");
	  e.printStackTrace();
  }
%>
</body>
</html>