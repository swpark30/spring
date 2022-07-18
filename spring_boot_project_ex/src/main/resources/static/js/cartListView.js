/**
 * 
 */
 
  $(document).ready(function(){
  	// [전체 선택] 체크박스 체크했을 때
  	$('#allCheck').on('click', function(){
  		// [전체 선택] 체크박스 상태 확인
  		var chk = $('#allCheck').prop("checked");
  		
  		if(chk){
  			$('.chkDelete').prop("checked", true);
  		}else{
  			$('.chkDelete').prop("checked", false);
  		}
  	});
  	
  	// 개별 체크박스 (.chkDelete) 하나라도 해제할 경우 [전체선택] 체크박스 - 해제
  	// 모두 체크되었을 때 [전체선택] 체크
  	$('.chkDelete').on('click', function(){
  		var count = 0;
  		$('.chkDelete').each(function(){
  			if($(this).is(':checked')){
  				count++;
  			}
  		});
  		if(count == $('.chkDelete').length){
  			$('#allCheck').prop("checked", true);
  		}else{
  			$('#allCheck').prop("checked", false);
  		}
  	});
  	
  	// 장바구니 목록에서 선택한 상품 삭제
  	// [삭제] 버튼 클릭 시 
  	
  	$("#deleteCartBtn").click(function(){
  		// 1. 선택 여부 확인 : 한 개라도 선택하면 true, 아무것도 선택하지 않으면 false
  		var checked = $('.chkDelete').is(':checked');
  		// 선택 여부 결과에 따라 if 문 작성
  		// if문 작성 : "선택된 상품이 없습니다" 출력
  		if(checked){		
  			// 삭제 확인 여부
  			var answer = confirm("선택된 상품을 삭제하시겠습니까?");
  			
  			if(answer){	
	  			// 체크된 체크박스의 cartNo를 배열에 추가
	  			var checkArr = new Array();
	  			$('.chkDelete:checked').each(function(){
	  				checkArr.push($(this).attr("data-cartNo"));
	  			});
	  			// 전송하고 결과 받고, 포워딩
	  			// deleteCart로 요청
	  			// 결과가 1이면 cartList로 포워딩
	  			
  				$.ajax({
  					type:"post",
		 			url:"deleteCart",
		 			data:{"chkArr":checkArr},
					success:function(result){
						if(result == "1"){
							location.href = "/product/cartList";
						}
					},
					error:function(){
						// 오류있을 경우 수행 되는 함수
						alert("전송 실패");
					}
				});
  				
  			}
  			
  		}else{
  			alert("선택된 상품이 없습니다.")
  		}
  		
  		
  	});
  	
   });