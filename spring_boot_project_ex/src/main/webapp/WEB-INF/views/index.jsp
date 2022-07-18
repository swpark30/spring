<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 예제 : index 메인 페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
		<script src="<c:url value='/js/index.js'/>"></script>
	</head>
	<body>
    	<div id="wrap"> 
    		<!-- 이 부분 Top으로 이동 --> 
    		<!-- Top 포함 -->    
    		<%-- <jsp:include page="/WEB-INF/views/layout/top.jsp" flush="true"/> --%>
    		<c:import url="/WEB-INF/views/layout/top.jsp"/>
            <section>
            	<article  id="slideShow"> <!-- 슬라이드 쇼 -->   
                <div id="prevNextButtonBox">
					<img id="prevButton" src="image/prevButton.png">
					<img id="nextButton" src="image/nextButton.png">
				</div>		
                <div id="slideShowBox">
					<div id="slidePanel">
						<img src= "image/slide_img_01.jpg" class="slideImage">
						<img src= "image/slide_img_02.jpg" class="slideImage">
						<img src= "image/slide_img_03.jpg" class="slideImage">
						<img src= "image/slide_img_04.jpg" class="slideImage">
						<img src= "image/slide_img_05.jpg" class="slideImage">
					</div>
				</div> <!-- slideShowBox 끝 -->
				<div id = "controlPanel">
					<img src="image/controlButton1.png" class="controlButton">
					<img src="image/controlButton1.png" class="controlButton">
					<img src="image/controlButton1.png" class="controlButton">
					<img src="image/controlButton1.png" class="controlButton">
					<img src="image/controlButton1.png" class="controlButton">
				</div>
                </article> 
                
                <article id="content1"> <!-- 탭메뉴 -->             
	                <div id="tabMenuBox">					
						<div id="tabMenu">
							<ul id="tab">
								<li><img src="image/tab1.png"></li>
								<li><img src="image/tab2.png"></li>
								<li><img src="image/tab3.png"></li>
								<li><img src="image/tab4.png"></li>
							</ul>
						</div>								
						<div id="tabContent">
							<div><a href="#"><img src="image/tab_img_01.jpg"></a></div>
							<div><a href="#"><img src="image/tab_img_02.jpg"></a></div>
							<div><a href="#"><img src="image/tab_img_03.jpg"></a></div>
							<div><a href="#"><img src="image/tab_img_04.jpg"></a></div>
						</div>
					</div>	
                </article>
                <article  id="content2"> <!-- 베스트 상품 -->         
                	<div id="productBox">
						<h3> 베스트 상품</h3>
						<div class="product">
							<div><a href="#"><img src="image/prd01.jpg"></a></div>
							<div><a href="#"><img src="image/prd02.jpg"></a></div>
							<div><a href="#"><img src="image/prd03.jpg"></a></div>
						</div>
						<div class="product">
							<div><a href="#"><img src="image/prd04.jpg"></a></div>
							<div><a href="#"><img src="image/prd05.jpg"></a></div>
							<div><a href="#"><img src="image/prd06.jpg"></a></div>
						</div>
					</div>  	
                </article>
            </section>
            <!-- 이 부분 Bottom으로 이동 -->   
            <!-- Bottom 포함 -->    
            <%-- <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush="true"/>  --%>
            <c:import url="/WEB-INF/views/layout/bottom.jsp"/>
      </div>
	</body>
</html>