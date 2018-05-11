<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="java.util.*" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	User user = (User) session.getAttribute("user");
	
	String role = "";
	if(user != null){
		role = user.getRole();
	}
	
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
%> --%>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetList() {
		document.detailForm.submit();
	}
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü  ${resultPage.totalCount}�Ǽ�, ����  ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">�ֹ���ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ��ڸ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�ֹ��� ��¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list }">
		<c:set var="i" value="${i+1 }" />
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.tranNo }</a>
		</td>
		<td></td>
		<td align="left">
			<a href="/user/getUser?userId=${user.userId}">${user.userId}</a>
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.orderDate}</td>
		<td></td>
		
		<c:choose>
		
		<c:when test="${purchase.tranCode == '2' }">
			<td align="left">���� ���ſϷ� �����Դϴ�.</td>
		</c:when>
		
		<c:when test="${purchase.tranCode == '3' }">
			<td align="left">���� ����� �����Դϴ�.</td>
		</c:when>
		
		<c:when test="${purchase.tranCode == '4' }">
			<td align="left">���� ��ۿϷ� �����Դϴ�.</td>
		</c:when>
		
		<c:otherwise>
			<td align="left"></td>	
		</c:otherwise>
		
		</c:choose>
		<td></td>
		<c:if test="${purchase.tranCode == '2' }">
			<td align="left">
			<a href="/purchase/deletePurchase?tranNo=${purchase.tranNo}">�ֹ����</a>
			</td>
		</c:if>
		
		<c:if test="${purchase.tranCode == '3' }">
			<td align="left">
			<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">���ǵ���</a>
			</td>
		</c:if>
		 
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>	
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>