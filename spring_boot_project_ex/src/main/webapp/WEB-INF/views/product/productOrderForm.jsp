<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 페이지</title>
		<style>
			table { text-align:left;}
			table th { width:100px; background:#777777; color:white; text-align:center; }
			table td { padding-left:5px;}
			#cartTable { text-align:center;}
		</style>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
			<form method="post" action="<c:url value='product/orderComplete'/>">
			<table border="1" width="800">
				<caption>주문자 정보</caption>
				<tr>
					<th>주문자</th><td>${memInfo.memName}</td>
					<th>연락처</th><td>${memInfo.memHP}</td>
				</tr>
			</table><br><br>
			<table border="1" width="800">
				<caption>수령인 정보</caption>
				<tr>
					<th>받는분</th>
					<td>
						<input type="text" value="${memInfo.memName}">
						<input type="hidden" name="memId" value="${memInfo.memId}">
					</td>
					<th>연락처</th>
					<td>
						<input type="text" name="hp1" value="${memHP1}" size="3"> 
	                    - <input type="text" name="hp2" value="${memHP2}" size="4"> 
	                    - <input type="text" name="hp3" value="${memHP3}" size="4">
                    </td>
				</tr>
				<tr>
					<th>배송지 주소</th>
					<td>
						<input type="text" id="ordZipcode" name="ordZipcode" value="${memInfo.memZipcode}" size="7" readonly>
						<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
						<input type="text" id="ordAddress1" name="ordAddress1" value="${memInfo.memAddress1}" placeholder="주소 입력" readonly size="80"><br>
						<input type="text" id="ordAddress2" name="ordAddress2" value="${memInfo.memAddress2}" placeholder="상세 주소 입력" size="80"><br>
					</td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td colspan="3">
						<select name="message">
							<option value="배송전 전화주세요">배송전 전화주세요</option>
							<option value="문앞에 놔두고 가주세요">문앞에 놔두고 가주세요</option>
							<option value="경비실에 놔둬주세요">경비실에 놔둬주세요</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
			</table><br><br>
			<table border="1" width="800">
				<caption>주문 상품 목록</caption>
				<tr>
					<th>상품번호</th>
					<th>사진</th>
					<th>상품명</th>
					<th>가격</th>
					<th>주문수량</th>
					<th>구매예정금액</th>
				</tr>
				<c:forEach var="cart" items="${cartList}">
				<tr>
					<td>${cart.prdNo}</td>
					<td><img src="<c:url value='/images/${cart.prdImg}'/>" width='50' height='40'></td>
					<td>${cart.prdName}</td>
					<td><fmt:formatNumber value="${cart.prdPrice}" pattern="#,###"/>원</td>
					<td>
						<input type="text" name="cartQty" value="${cart.cartQty}" size="1" readonly>
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
			</table><br><br>
			<table border="1" width="800">
				<caption>결제 정보</caption>
				<tr>
					<th>결제방법</th>
					<td>
					<input type="radio" name="chk_info" value="신용카드">신용카드
					<input type="radio" name="chk_info" value="실시간계좌이체">실시간계좌이체
					</td>
				</tr>
			</table>
				<input type="submit" value="결제 완료">
			</form>
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div>
	</body>
</html>