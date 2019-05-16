window.onload

var num=document.frm.num;
		var code=document.frm.code;
		var date=document.frm.date;
		var pizza=document.frm.pizza;
		var amount=document.frm.amount;
		
function input(){
		
		if(num.value==""){
			alert("매출전표번호가 입력되지않았습니다.");
			num.focus();
			return false;
		}else if(code.value==""){
			alert("지점코드가 입력되지않았습니다.");
			code.focus();
			return false;
		}else if(date.value==""){
			alert("판매일자가 입력되지않았습니다.");
			date.focus();
			return false;
		}else if(pizza.value==""){
			alert("피자코드가 선택되지 않았습니다.");
			pizza.focus();
			return false;
		}else if(amount.value==""){
			alert("수량이 입력되지않았습니다.");
			amount.focus();
			return false;
		}	
	}