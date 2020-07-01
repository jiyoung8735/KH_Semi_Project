<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
    .xi-location-arrow:hover{
	color:rgba(42,193,188,0.6);
	}
    
    </style>
<body>
<div style = "width:600px; text-align: center;">
<h1>신고할 한줄평</h1>
<br>
내용 :  ${content }
</div>
<br>
<br>

<hr>
<br>
<div style ="width:600px; text-align: center;">
<h1>신고 작성</h1>
</div> 
<br>

<div style ="width:600px; text-align: center;">
<input type="hidden" value="${loginUserNo }" id="loginUserNo">
<input type="hidden" value="${targetno }" id="targetNo">
<input type="hidden" value=" ${content }" id="content">
<input type="hidden" value="${reviewno }" id="reviewNo">
</div>
<%-- 신고자 번호 : ${loginUserNo }<br> --%>
<%-- 대상자 번호 : ${targetno } <br> --%>
<%-- 대상자 한줄평 : ${content }	<br> --%>
<%-- 리뷰번호 : ${reviewNo }<br> --%>
<div style = "width:600px; text-align: left; font-size :20px;" >
<label for="report_reason">신고 이유 : </label>
<select id="report_reason">
	<option value="1">비속어 사용</option>
	<option value="2">허위사실 유포</option>
	<option value="3">불충분한 정보</option>
	<option value="4">기타</option>
</select>
</div>
<br>
<div style = "width:600px; text-align: left; font-size: 20px;">
<label for="report_content">상세 내용 : </label>
</div>
<textarea rows="5" cols="60" id="report_content" style = "font-size:15px;"></textarea>
<div style= "width:600px; text-align: center; margin-top: 30px; font-size: 30px; display:inline-block;" class="reportbtn">
<button id="submit_report" style = "all:unset; cursor: pointer;"><i class="xi-location-arrow xi-4x"></i></button>
</div>
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

