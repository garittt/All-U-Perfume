//b39601cdde217504460c15ddd71b1b47
Kakao.init('b39601cdde217504460c15ddd71b1b47'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
        scope : 'profile_nickname, profile_image, account_email, gender',
      success: function (response) {
    	  function token_result(){
    		  var result;
    		  $.ajax({
	    		  url: "/member/tokenCheck",
	              data: JSON.stringify({
	              	api_token : response.access_token
	              }),
	              type: "POST",
	              contentType : "application/json; charset=UTF-8",
	              async: false,
	              success: function(data){
	                  result = data;
	              }
	    	  });
    		  return result;
    	  }
	    	  
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  var token = token_result();
        	  console.log(token);
              $.ajax({
                  url: "/member/kakaoCheck",
                    data: JSON.stringify({
                        id : response.id+"Kakao",
                        name : response.properties.nickname,
                        img : response.kakao_account.profile.profile_image_url,
                        email : response.kakao_account.email,
                        gender : response.kakao_account.gender,
                        api_token : token
                    }),
                    type: "POST",
                    contentType : "application/json; charset=UTF-8",
                    success: function(data){
                        alert('로그인 되셨습니다.');
                        Kakao.Auth.setAccessToken('ACCESS_TOKEN');
                  	  	console.log(response.access_token)
                        if(data == 1){
                        	 window.location = "/member/main";
                        }else{
                        	alert("");
                        	window.location.reload();
                        }
                    }
              });

          }
        })
      }
    })
  }
            
 