<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ page import="java.util.*" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>


<%
	String role = "";
	User user = (User) session.getAttribute("user");

	if(user != null){
		role = user.getRole();
	}
	
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

%> --%>


<html>
<head>
<title></title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
<!--
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
-->
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct?menu=${param.menu}&orderby=${param.orderby}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:if test="${param.menu == 'search' }">
						��ǰ �����ȸ
					</c:if>
					<c:if test="${param.menu == 'manage' }">
						��ǰ ����
					</c:if>					
					</td>
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

		<td align="right">
			<a href="/product/listProduct?menu=search&orderby=regdate">�Ż�ǰ��</a>
			|
			<a href="/product/listProduct?menu=search&orderby=lowprice">�������ݼ�</a>
			|
			<a href="/product/listProduct?menu=search&orderby=highprice">�������ݼ�</a>
			
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>

			<input type="text" name="searchKeyword" value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${ list }">
		<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
						
			<c:if test="${param.menu == 'manage' }" >		
				<td align="left"><a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a></td>
			</c:if>
			<c:if test="${param.menu == 'search' }">				
			<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a></td>
			</c:if>
			<td></td>
			
			<td align="left">${product.price}</td>
			<td></td>
			
			<td align="left">${product.regDate}</td>
			<td></td>
			<c:choose>
	
			<c:when test="${user.role.equals('admin') }">
				<c:if test="${product.proTranCode == '1' }" >
					<td align="left">�Ǹ���</td>
				</c:if>
				<c:if test="${product.proTranCode == '2'  && param.menu == 'search' }" >
					<td align="left">���ſϷ�</td>
				</c:if>
				<c:if test="${product.proTranCode == '2'  && param.menu == 'manage' }" >					
					<td align="left">���ſϷ�
					<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=${product.proTranCode}">����ϱ�</a>
				</td>
				</c:if>
				<c:if test="${product.proTranCode == '3' }" >
					<td align="left">�����</td>
				</c:if>
				<c:if test="${product.proTranCode == '4' }" >
					<td align="left">��ۿϷ�</td>
				</c:if>
			</c:when>
			
			<c:when test=" ${user.role.equals('user')}" >
				<c:if test="${product.proTranCode == '1' }" >
					<td align="left">�Ǹ���</td>
				</c:if>
				<c:if test="${product.proTranCode == '2' }" >
					<td align="left">�������</td>
				</c:if>
				<c:if test="${product.proTranCode == '3' }" >
					<td align="left">�������</td>
				</c:if>
				<c:if test="${product.proTranCode == '4' }" >
					<td align="left">�������</td>
				</c:if>			
			</c:when>
			
			<c:otherwise>
				<c:if test="${product.proTranCode == '1' }" >
					<td align="left">�Ǹ���</td>
				</c:if>
				<c:if test="${product.proTranCode == '2' }" >
					<td align="left">�������</td>
				</c:if>
				<c:if test="${product.proTranCode == '3' }" >
					<td align="left">�������</td>
				</c:if>
				<c:if test="${product.proTranCode == '4' }" >
					<td align="left">�������</td>
				</c:if>		
			</c:otherwise>
		</c:choose>
												
		</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
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