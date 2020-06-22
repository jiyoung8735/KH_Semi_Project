<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:import url="/WEB-INF/views/fran_layout/header.jsp" />

<c:import url="/WEB-INF/views/fran_layout/header_menu.jsp" />

<div id="body-content-view">
<form class="form-horizontal" action="#" method="post">

 <fieldset>
    <legend>신메뉴 등록</legend>

  <div class="form-group">
    <label class="col-sm-2 control-label">브랜드 명 : </label>
    <div class="col-sm-10">
      <p class="form-control-static">${usernick }</p>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputMenuName" class="col-sm-2 control-label">신메뉴 명 : </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputMenuName" placeholder="신메뉴를 입력하세요.">
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="inputDate" class="col-sm-2 control-label">처리 일자 : </label>
    <div class="col-sm-10">
      <input type="date" class="form-control" id="inputDate">
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="inputImage" class="col-sm-2 control-label">메뉴 이미지 : </label>
    <div class="col-sm-10">
      <input type="file" id="inputImage">
    </div>
  </div>

  <div class="form-group">
    <label for="input" class="col-sm-2 control-label">메뉴 소개글 : </label>
	<div class="col-sm-10">
	  <textarea class="form-control" rows="3"></textarea>
	</div>
  </div>
  
  

</fieldset>
</form>

</div>


<c:import url="/WEB-INF/views/fran_layout/footer.jsp" />    