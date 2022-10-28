<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check(){
	if(document.form.pcode.value==""){
		alert("상품코드를 입력하세요.");
		document.form.pcode.focus();
	}else if(document.form.pname.value==""){
		alert("상품명을 입력하세요.");
		document.form.pname.focus();
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
<h3>상품 등록 화면</h3>
<form name="form" method="post" action="p_insertProcess.jsp">
  <table>
    <tr>
      <th>상품코드</th>      
      <td><input type="text" name="pcode"></td>
    </tr>
    <tr>
      <th>상품명</th>
      <td><input type="text" name="pname"></td>
    </tr>
     <tr>
      <th>단가</th>
      <td><input type="text" name="price"></td>
    </tr>
    <tr>
      <th>재고수량</th>
      <td><input type="text" name="stockQty"></td>
    </tr>
    <tr>
      <td colspan=2 class="last">
        <input class="buttons" type="button" value="등록" onclick="check()">
        <input class="buttons" type="reset" value="취소">
      </td>
    </tr>
  </table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>