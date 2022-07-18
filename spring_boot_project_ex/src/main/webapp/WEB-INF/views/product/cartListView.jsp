<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 목록</title>
		<style>
			h3 { margin-top:20px;}
			table { width:900px;	margin-top:20px; }	
			table tr {height:50px; }
			table th, td { border:solid gray 1px; padding:10px;}	
			input { text-align:center;}
		</style>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/cartListView.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
		<h3>장바구니 목록</h3>
		<form method="post" action="<c:url value='/product/orderForm'/>">
		<table border="1" width="800">
					<tr>
						<td><input type="checkbox" id="allCheck">전체선택</td>
						<td><button id="deleteCartBtn">삭제</button></td>
						<td colspan="4">장바구니에서 상품 삭제를 원하시면 체크박스를 선택하고 삭제 버튼을 눌러 주세요</td>
					</tr>
					<tr>
						<th>삭제</th>
						<th>사진</th>
						<th>상품명</th>
						<th>가격</th>
						<th>주문수량</th>
						<th>구매예정금액</th>
					</tr>
					<c:forEach var="cart" items="${cartList}">
					<tr>
						<td><input type="checkbox" class="chkDelete" name="delete" data-cartNo="${cart.cartNo}"></td>
						<td><img src="<c:url value='/images/${cart.prdImg}'/>" width='50' height='40'></td>
						<td>${cart.prdName}</td>
						<td><fmt:formatNumber value="${cart.prdPrice}" pattern="#,###"/>원</td>
						<td>
							<input type="button" value="-" onClick="qtyChange(-1)">
							<input type="text" id="cartQty" value="${cart.cartQty}" size="1" readonly>
							<input type="button" value="+" onClick="qtyChange(+1)"> 개
							<input type="hidden" name="cartNo" value="${cart.cartNo}">
							<input type="hidden" name="prdNo" value="${cart.prdNo}">
							<input type="hidden" name="memId" value="${cart.memId}">
							<input type="hidden" name="prdPrice" value="${cart.prdPrice}">
						</td>
						<td>
							<span id="amount">
								<c:set var="amount" value="${cart.prdPrice * cart.cartQty}" />
								<c:set var="sum" value="${sum + amount}" />
								<fmt:formatNumber value="${amount}" pattern="#,###"/>원
							</span>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="5">총구매 예정 금액</td>
						<td>
							<fmt:formatNumber value="${sum}" pattern="#,###"/>원
						</td>
					</tr>
				</table><br>
				<input type="submit" value="주문하기">
				<br><br>
				</form>
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div>
	</body>
</html>