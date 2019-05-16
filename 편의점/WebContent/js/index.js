function input(){
		var code=document.frm.product;
		var cnt=document.frm.count;
		
		if(code.value==null){
			alert("상품코드를 입력하지 않았습니다.");
			code.focus();
			return false;
		}else if(cnt.value==null){
			alert("판매수량을 입력하지 않았습니다.");
			cnt.focus();
			return false;
	}
}