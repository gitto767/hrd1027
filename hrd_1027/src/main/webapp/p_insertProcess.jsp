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
  String pcode=request.getParameter("pcode");
  String pname=request.getParameter("pname");
  String price=request.getParameter("price");
  String stockQty=request.getParameter("stockQty");
    
  PreparedStatement pstmt=null;
  try{
	  String sql="insert into product1026 values(?,?,?,?)";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, pcode);
	  pstmt.setString(2, pname);
	  pstmt.setString(3, price);
	  pstmt.setString(4, stockQty);
	  pstmt.executeUpdate();
	  %>
	  <script>
	  alert("등록 완료");
	  location.href="productselect.jsp";
	  </script>
	  <%
  }catch(Exception e){
	  System.out.println("등록 실패");
	  e.printStackTrace();
  }
%>
</body>
</html>