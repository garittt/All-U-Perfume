<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">  

<title>당신만의 향기, All U Perfume</title>

<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>

<div class="aa">
	<header>
		<div class="wrapper">
			<h1><a href="/member/main" style="color : white ;">All U Perfume</a></h1>
			<nav>
				<ul class="menu">
					<li>
						<c:if test="${sessionScope.id != null}">
							<a href="/member/logout">로그아웃</a>
						</c:if>
						<c:if test="${sessionScope.kid != null}">
							<a href="kakaoLogout();">로그아웃</a>
						</c:if>
						<c:if test="${sessionScope.aid != null}">
							<a href=/admin/logout>로그아웃</a>
						</c:if>
					</li>
					<li><a href="/mypage/main">마이페이지</a></li>
					<li><a href="/q/list?boardnum=1">Q & A</a></li>
					<li><a href="/notice/list?boardnum=3">공지사항</a></li>
					<li><a href="/best/list?boardnum=2">향수 추천</a></li>
					<li><a href="/main/list">메인</a></li>
					<li><a href="/survey/surveyStart">설문</a></li>
				</ul>
			</nav>
		</div>
	</header>
</div> <hr color = "white" size = "2px"/>

<script>
Kakao.init('b39601cdde217504460c15ddd71b1b47');
//카카오로그아웃  
  function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.')
      return
    }
    Kakao.Auth.logout(function() {
      $.ajax({
    	  url: "/member/kLogout",
          type: "POST",
          contentType : "application/json; charset=UTF-8",
          async: false,
          success: function(data){
              alert("로그아웃 되었습니다.");
              window.location="/member/login";
          } 
      });
    })
  }
</script>

<script>
	function contentDelete(number){
		if(window.confirm('게시글을 삭제하시겠습니까?')){
			$.ajax({
				data : { b_number : number },
				url : '/best/delete',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('삭제되었습니다.');
						window.location='/best/list';
					}
				}
			});
		} else {
			return false;
		}
	}
	// form에 입력된 정보를 json 형태로 파싱해주는 코드
	$.fn.serializeObject = function(){
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	    	var name = $.trim(this.name),
	    		value = $.trim(this.value);
	    	
	        if (o[name]) {
	            if (!o[name].push) {
	                o[name] = [o[name]];
	            }
	            o[name].push(value || '');
	        } else {
	            o[name] = value || '';
	        }
	    });
	    return o;
	};
	
	function commentSubmit(){
		
		if($('#content').val() == ''){
			alert("내용을 입력하세요.");
			document.getElementById('content').focus();
			
			return false;
		}
		
		var writeData = JSON.stringify($('form#commentForm').serializeObject());
		
		console.log(writeData);
		
		$.ajax({
			data : writeData,
			url : "/best/commentPro",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if(data == 1){
					alert('댓글이 작성되었습니다.')
					window.location.reload();
				}
			}
		});
	}
	
	function reComment(cno){
		$('#reComment'+cno).css('display', 'block');
	}
	
	function reCommentSubmit(cno){
		if($('#reContent'+cno).val() == ''){
			alert("댓글 내용을 입력하세요.");
			document.getElementById('reContent').focus();
				
			return false;
		}
		
		var writeData = JSON.stringify($('form#reComment'+cno).serializeObject());
		
		console.log(writeData);
		
		$.ajax({
			data : writeData,
			url : "/best/commentPro",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if(data == 1){
					alert('댓글이 작성되었습니다.')
					window.location.reload();
				}
			}
		});
	}
	
	function updateComment(content, cno, bno){
		console.log(cno)
		const element = document.getElementById('commentContent'+cno);
		
		element.innerHTML = "<form id='commentForm"+cno+"'> <input type='hidden' value='"+bno+"' name='bno' />"
										+"<input type='hidden' value='"+cno+"' name='cno' />"+
										"<input type='text' value='"+content+"' name='content' /> </form>";
		$('#update'+cno).html("<input type='button' value='수정하기' onclick='updateSubmit("+cno+")' class='inputsmall' />")
	}
	
	function updateSubmit(cno){
		console.log(cno)
		var writeData = JSON.stringify($('form#commentForm'+cno).serializeObject());
		console.log(writeData)
		
		$.ajax({
			data : writeData,
			url : "/best/updateComment",
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if(data == 1){
					alert('댓글이 수정되었습니다.')
					window.location.reload();
				}
			}
		});
		
	}	
	
	function deleteComment(number){
		if(window.confirm('댓글을 삭제하시겠습니까?')){
			$.ajax({
				data : { cno : number },
				url : '/best/deleteComment',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('댓글이 삭제되었습니다.');
						window.location.reload();
					}
				}
			});
		} else {
			return false;
		}
	}
	
</script>


<div class="aaaa" style = "height:400px; line-height: 400px;">향수 추천 게시판</div>

<div class="a"  style = "height:500px;"> 
	<table class="type04" style = "text-align : center;bottom:0px;  width: 1100px;">
	<tr>
		<td colspan="4" style = "text-align : right;">
		<input type="button" onclick="window.location = '/best/list'"  value="목록 보기" class="inputsmall" />
		<c:if test="${sessionScope.id == boardDTO.writer}"> 
			<input type="button" onclick="window.location = '/best/update?b_number=${boardDTO.b_number}'"  value="수정" class="inputsmall" />
			<input type="button" onclick="contentDelete('${boardDTO.b_number}')"  value="삭제" class="inputsmall" /> 
		</c:if>
		<c:if test="${sessionScope.kid == boardDTO.writer}"> 
			<input type="button" onclick="window.location = '/best/update?b_number=${boardDTO.b_number}'"  value="수정" class="inputsmall" />
			<input type="button" onclick="contentDelete('${boardDTO.b_number}')"  value="삭제" class="inputsmall" /> 
		</c:if>
		</td>
	</tr>
	<tr>
		<th class="active"  colspan="3">제목</th>
	</tr>
	<tr>
		<td colspan="3">${boardDTO.subject}</td>
	</tr>
	<tr>
		
		<th class="active">작성자</th>
		<th class="active"> 작성일 </th>
		<th class="active"> 조회수 </th>
	</tr>
	
	<tr>
		<td>${boardDTO.writer}</td>
		<td>${boardDTO.reg_date}</td>
		<td>${boardDTO.readcount}</td>
	</tr>

	<tr>
		<td class="active" colspan="4"><b>내용</b></td>
	</tr>
	<tr>
		<td colspan="4" style = "height : 300px;">
			<pre>
			${boardDTO.content}
			</pre>
		</td>
	</tr>
	</table>
	</div>
	
	<div style="width: 100%; height:80px;" ></div>
	<form id="commentForm">
		<c:if test="${sessionScope.id != null}">
			<input type="hidden" value="${sessionScope.id}" name="writer" />
		</c:if>
		<c:if test="${sessionScope.kid != null}">
			<input type="hidden" value="${sessionScope.kid}" name="writer" />
		</c:if>
		<input type="hidden" value="${boardDTO.boardnum}" name="boardnum" />
		<input type="hidden" value="${boardDTO.b_number}" name="bno" />
		<div class="a"  style = "height:200px; "> 
			<table class="type04" style = "text-align : center; width: 1500px; top:0px;">
			<tr>
				<th class="active" colspan="4">댓글 작성</th>
			</tr>
			<tr>
				<th class="active" >내용</th>
				<td colspan="3"><textarea rows="10" cols="20" name="content" id="content" style="width: 1100px; height : 50px; font-size : 20px;"></textarea></td>
			</tr>
			<tr>
				<td class="active" colspan="4">
			  <input type="button" value="작성" onclick="commentSubmit()" class="inputsmall"/>	
			  </td>
			  </tr>
			  </table>
			  </div>
			
		
	</form>
	



<c:if test="${commentCount == 0}">
<div class="a"  style = "height:50px;"> 
	<table class="type04" style = "text-align : center; width: 1500px; top:0px;" >
		<tr>
			<td colspan="3">
			댓글이 없습니다.
			</td>
		</tr>
	</table>
</div>
</c:if>

<c:if test="${commentCount > 0}">
	<div  > 
	<table class="type04" style = "text-align : center; width: 1500px; top:0px; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; ) " >
		<tr>
			<th class="active" >작성자</th>
			<th class="active" >내용</th>
			<th class="active"></th>
		</tr>
		<c:forEach items="${commentDTO}" var="commentDTO">
		
		<tr>
			<td >
				<c:if test="${commentDTO.status == '작성' && commentDTO.re_step == 0}">
					${commentDTO.writer}
				</c:if>
				<c:if test="${commentDTO.status == '작성' && commentDTO.re_step > 0}">
					└ ${commentDTO.writer}
				</c:if>
			</td>
			<td>
				<div id="commentContent${commentDTO.cno}">
					<c:if test="${commentDTO.status == '작성'}">
						${commentDTO.content}
					</c:if>
				</div>	
					<c:if test="${commentDTO.status == '삭제'}">
						삭제된 댓글입니다.
					</c:if>
			</td>
			<td>
				<c:if test="${commentDTO.re_step == 0}">
					<input type="button" value="답글" onclick="reComment('${commentDTO.cno}')" class="inputsmall"/>
				</c:if>
				
				<c:if test="${commentDTO.status == '작성'}">
					<c:if test="${sessionScope.id == commentDTO.writer || sessionScope.kid == commentDTO.writer}"> 
						<div id="update${commentDTO.cno}">
							<input type="button" value="수정" class="inputsmall" onclick="updateComment('${commentDTO.content}', '${commentDTO.cno}', '${commentDTO.bno}')" />
						</div>
						<input type="button" value="삭제" onclick="deleteComment('${commentDTO.cno}')" class="inputsmall"/> 
					</c:if>
				</c:if>
			</td>
		</tr>
		
		<tr id="reComment${commentDTO.cno}" style="display: none;  ">
			<td >답글 작성</td>
			<td>
				<form id="reComment${commentDTO.cno}">
					<c:if test="${sessionScope.id != null}">
						<input type="hidden" value="${sessionScope.id}" name="writer" />
					</c:if>
					<c:if test="${sessionScope.kid != null}">
						<input type="hidden" value="${sessionScope.kid}" name="writer" />
					</c:if>
					<input type="hidden" value="${boardDTO.boardnum}" name="boardnum" />
					<input type="hidden" value="${boardDTO.b_number}" name="bno" />
					<input type="hidden" value="${commentDTO.re_step}" name="re_step" />
					<input type="hidden" value="${commentDTO.cno}" name="cno" />
					<input type="hidden" value="${commentDTO.ref}" name="ref" />
					<input type="text" name="content" id="reContent${commentDTO.cno}" />
				</form>
			</td>
			<td>
				<input type='button' value='작성' onclick="reCommentSubmit('${commentDTO.cno}')" class="inputsmall" />
			</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</c:if>


		