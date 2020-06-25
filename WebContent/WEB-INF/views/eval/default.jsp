<%@page import="web.dto.Menu"%>
<%@page import="web.dto.Image"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/header_slide.jsp"></c:import>
   
   
<section class="wrapper">


<div class="submenu_back">
     <div class="submenu_list">
      <ul>
         <li class="submenu"><input type="button" class="filter_btn" value="음식1" id="food_1" /></li>
         <li class="submenu"><input type="button" class="filter_btn" value="음식2" id="food_2" /></li>
         <li class="submenu"><input type="button" class="filter_btn" value="음식3" id="food_3" /></li>
         <li class="submenu"><input type="button" class="filter_btn" value="음식4" id="food_4" /></li>
         <li class="submenu"><input type="button" class="filter_btn" value="음식5" id="food_5" /></li>
      </ul>
     </div>
</div>


<!-- modal -->
<div class="modal mo_hidden" id="mo_wrapper">

</div>


<div class="eval" id="Diveval">
<c:forEach var="image" items="${image}" varStatus="status" >
   <c:if test="${!status.last }">
      <c:if test="${status.index % 4 eq 0 }">
         <div class="ver">
         <div class="hor" id="eval${status.index }"></div>
         <div class="h_blank"></div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 1 }">
         <div class="hor" id="eval${status.index }"></div>
         <div class="h_blank" ></div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 2 }">
         <div class="hor" id="eval${status.index }"></div>
         <div class="h_blank"></div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 3 }">
         <div class="hor" id="eval${status.index }"></div>
         </div>
         <div class="v_blank"></div>
      </c:if>
   </c:if>
   
   <c:if test="${status.last }">
      <c:if test="${status.index % 4 eq 0 }">
         <div class="ver">
         <div class="hor" id="eval${status.index }"></div>
         </div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 1 }">
         <div class="hor" id="eval${status.index }"></div>
         </div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 2 }">
         <div class="hor" id="eval${status.index }"></div>
         </div>
      </c:if>
      
      <c:if test="${status.index % 4 eq 3 }">
         <div class="hor" id="eval${status.index }"></div>
         </div>
      </c:if>
   </c:if>

   <script type="text/javascript">
   $("#eval${status.index }").css({
       "backgroundImage": "url(/upload/${image.imgServer })",
       "background-size" : "cover",
       "background-position-x": "center"
     });
   </script>

</c:forEach>

</div>


</section>

<script type="text/javascript">

$('.hor').on("click", function() {
   $('#mo_wrapper').removeClass("mo_hidden");
});

$('#mo_close').on("click", function() {
   $('#mo_wrapper').addClass("mo_hidden");
});

$('#mo_overlay').on("click", function() {
   $('#mo_wrapper').addClass("mo_hidden");
});

$("input[id^=food_]").click(function() {
      $.ajax({
         type: "POST"
         , url: "/eval/filter"
         , data: {
            food: $(this).val()
         }
         , dataType: "html"
         , success: function(result) {
            console.log("AJAX 성공")
            console.log(result)
            $("#Diveval").html(result);
         }
         , error: function() {
            console.log("AJAX 실패")
         }
      });
});

$(".hor").click(function() {
      $.ajax({
         type: "POST"
         , url: "/eval/detail"
         , data: {
            food: $(this).attr("value")
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

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>