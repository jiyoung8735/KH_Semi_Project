<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="ver">
<div class="hor" id="eval11">${food }</div>
<div class="h_blank"></div>
<div class="hor" id="eval12"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval13"></div>
<div class="h_blank"></div>
<div class="hor" id="eval14"></div>
</div>
<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval21"></div>
<div class="h_blank"></div>
<div class="hor" id="eval22"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval23"></div>
<div class="h_blank"></div>
<div class="hor" id="eval24"></div>
</div>
<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval31"></div>
<div class="h_blank"></div>
<div class="hor" id="eval32"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval33"></div>
<div class="h_blank"></div>
<div class="hor" id="eval34"></div>
</div>
<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval41"></div>
<div class="h_blank"></div>
<div class="hor" id="eval42"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval43"></div>
<div class="h_blank"></div>
<div class="hor" id="eval44"></div>
</div>

<script type="text/javascript">
$('.hor').on("click", function() {
	$('#mo_wrapper').removeClass("mo_hidden");
});
$(".hor").click(function() {
    $.ajax({
       type: "POST"
       , url: "/eval/detail"
       , data: {
          food: $(this).val()
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