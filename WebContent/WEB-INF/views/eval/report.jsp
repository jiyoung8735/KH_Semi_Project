<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

</head>
<body>

<h1>신고할 목록</h1><br>

신고할 한줄평 내용 :  ${content }
<br>

<br><br>

<hr>

<br><br>

<h1>신고 작성</h1><br>

<input type="hidden" value="${loginUserNo }" id="loginUserNo">
<input type="hidden" value="${targetno }" id="targetNo">
<input type="hidden" value=" ${content }" id="content">
<input type="hidden" value="${reviewno }" id="reviewNo">

<%-- 신고자 번호 : ${loginUserNo }<br> --%>
<%-- 대상자 번호 : ${targetno } <br> --%>
<%-- 대상자 한줄평 : ${content }	<br> --%>
<%-- 리뷰번호 : ${reviewNo }<br> --%>

<label for="report_reason">신고 이유 : </label>
<select id="report_reason">
	<option value="1">비속어 사용</option>
	<option value="2">허위사실 유포</option>
	<option value="3">불충분한 정보</option>
	<option value="4">기타</option>
</select>
<br>
<label for="report_content">상세 내용 : </label>
<textarea rows="5" cols="80" id="report_content"></textarea>

<input type = "reset" value = "초기화" id="submit_report_reset" />
<input type = "button" value = "등록" id="submit_report" />

<script>

    $("#submit_report").click(function(){

       $.ajax({
            type: "post"
            , url: "/eval/detail/report"
            , data: {
            	report_reason: $('#report_reason').val(),
            	report_content: $('#report_content').val(),
            	loginUserNo: $('#loginUserNo').val(),
            	targetNo: $('#targetNo').val(),
            	reviewNo: $('#reviewNo').val()
            }
            , dataType: "html"
            , success: function(result) {
               console.log("AJAX 성공");
               console.log(result);
            }
            , error: function() {
               console.log("AJAX 실패");
            }
         });
        
       $.ajax({
            type: "post"
            , url: "/eval/detail"
            , data: {
               menuno: ${menuno }
            }
            , dataType: "html"
            , success: function(result) {
               console.log("AJAX 성공")
               console.log(result)
               $("#mo_wrapper").html(result);
            }
            , error: function() {
               console.log("AJAX 실패")
            }
         });
    });

</script>