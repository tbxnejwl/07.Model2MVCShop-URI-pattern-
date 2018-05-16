<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="deleteProduct" action="/product/deleteProduct?tranNo=${product.prodNo}&menu=manage" method="post">

상품이 삭제되었습니다.<br/>
<a href = "/product/listProduct?menu=${param.menu}&orderby=${param.orderby}">돌아가기</a>


</form>

</body>
</html>