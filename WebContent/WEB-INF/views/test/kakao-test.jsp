<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Document</title>
</head>



<body>
<button onclick="kakaologin()">로그인</button>
<button onclick="kakaologout()">로그아웃</button>
<button onclick="kakaoleave()">회원탈퇴</button>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

let REDIRECT_URI = "http://localhost:9090/member/kakao-form";

Kakao.init('6197c548cd695dd42753493a3812580d');

let kakaologin = function () {
Kakao.Auth.login({
	  success: function(response) {
	    console.log(response);
	    Kakao.API.request({
	    	  url: '/v2/user/me',
	    	  success: function(response) {
	    	    console.dir(response.kakao_account.email);
	    	    console.dir(response.id);
	    	  },
	    	  fail: function(error) {
	    	    console.log(error);
	    	  },
	    	});
	  },
	  fail: function(error) {
	    console.log(error);
	  },
	});

}


let kakaologout = function() {
	
	if (!Kakao.Auth.getAccessToken()) {
		  console.log('Not logged in.');
		  return;
		}
		Kakao.Auth.logout(function() {
		  console.log(Kakao.Auth.getAccessToken());
		});
	
}

let kakaoleave = function() {
	
	Kakao.API.request({
		  url: '/v1/user/unlink',
		  success: function(response) {
		    console.log(response);
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	
}
</script>
</body>
</html>