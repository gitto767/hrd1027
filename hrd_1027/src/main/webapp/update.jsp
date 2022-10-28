<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check(){
	if(document.form.custnu.value==""){
		alert("회원번호를 입력하세요.");
		document.form.custnu.focus();
	}else if(document.form.custname.value==""){
		alert("회원성명을 입력하세요.");
		document.form.custname.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h3>홈쇼핑 회원수정</h3>
<%@ include file="dbconn.jsp" %>
<%
  PreparedStatement pstmt=null;
  ResultSet rs= null;
  String custnu=request.getParameter("custnu");
  try{
	  String sql="select custnu,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member1026 where custnu=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, custnu);
	  rs=pstmt.executeQuery();
	  if(rs.next()){
		//  String custnu=rs.getString(1);
		  String custname=rs.getString(2);
		  String phone=rs.getString(3);
		  String address=rs.getString(4);
		  String joindate=rs.getString(5);
		  String grade=rs.getString(6);
		  String city=rs.getString(7);

%>
<form name="form" method="post" action="updateProcess.jsp">
  <table>
    <tr>
      <th>회원번호</th>
      <td><input type="text" name="custnu" value="<%=custnu %>"></td>
    </tr>
    <tr>
      <th>회원성명</th>
      <td><input type="text" name="custname" value="<%=custname %>"></td>
    </tr>
    <tr>
      <th>회원전화</th>
      <td><input type="text" name="phone" value="<%=phone %>"></td>
    </tr>
    <tr>
      <th>회원주소</th>
      <td><input type="text" name="address" value="<%=address %>"></td>
    </tr>
    <tr>
      <th>가입일자</th>
      <td><input type="text" name="joindate" value="<%=joindate %>"></td>
    </tr>
    <tr>
      <th>고객등급[A:VIP,B:일반,C:직원]</th>
      <td>
        <select name="grade" value="<%=grade %>">
         <option value="A">A: VIP</option>
         <option value="B">B: 일반</option>
         <option value="C">C: 직원</option>
        </select> 
      </td>
    </tr>
    <tr>
      <th>도시코드</th>
      <td>        
        <select name="city" value="<%=city %>">
          <option value="01">01: 서울</option>
          <option value="02">02: 경기</option>
          <option value="10">10: 대전</option>
          <option value="20">20: 부산</option>
          <option value="30">30: 광주</option>
          <option value="40">40: 울산</option>
          <option value="50">50: 대구</option>
          <option value="60">60: 강원</option>
          <option value="70">70: 경상</option>
          <option value="80">80: 충청</option>
          <option value="90">90: 제주</option>
        </select>   
      </td>
    </tr>
    <tr>
      <td colspan=2 class="last">
        <input class="buttons" type="button" value="수정" onclick="check()">
        <input class="buttons" type="reset" value="취소">
      </td>
    </tr>
  </table>
  <%
	  }
  }catch(Exception e){
	  System.out.println("조회 실패");
	  e.printStackTrace();
  }
  %>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>