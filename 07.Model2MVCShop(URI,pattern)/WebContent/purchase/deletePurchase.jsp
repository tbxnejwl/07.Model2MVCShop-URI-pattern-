<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%-- @ page import = "com.model2.mvc.service.domain.*" 

<%
	Purchase purchase = (Purchase) request.getAttribute("purchase");
	String pay = "";
	if(purchase != null){
		if(purchase.getPaymentOption().equals("1")){
			pay = "���ݱ���";
		}else{
			pay = "�ſ뱸��";
		}
	}
--%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="deletePurchase" action="/purchase/deletePurchase?tranNo=${purchase.tranNo}" method="post">

���Ű���Ұ� �Ǿ����ϴ�.<br/>
<a href = "/purchase/listPurchase">���ư���</a>


</form>

</body>
</html>