<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 브랜드평점 </title>



<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"  href="/resources/css/total.css" >

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



<script type="text/javascript">
$(document).ready(function() {
	$('.visual').slick({
	    autoplay: true,
	    autoplaySpeed: 2500
	});
	
	$('.conslider').slick({
		
		centerMode: true,
		  centerPadding: '60px',
		  slidesToShow: 3,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 3
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 1
		      }
		    }
		  ]
		
	});
	

	
});

</script>

</head>
<body>

<c:if test="${empty login }">
<div class="header-container">
	<div class="header-wrapper">
	<a href="#"><img alt="메인로고" src="/resources/image/brand.gif" id="logo"></a>
	</div>								

		<div class="category-background">
	  	<div class="category-list">
	  	 <ul>
		   	<li class="cate-list-item"><a href="#">추천보기</a></li>
		   	<li class="cate-list-item"><a href="/eval">평점보기</a></li>
		   	<li class="cate-list-item"><a href="#">공지사항</a></li>
		   	<li class="cate-list-item"><a href="/view/posts">자유게시판</a></li>
		   	<li class="cate-list-item"><a href="/login">로그인</a></li>
		   	<li class="cate-list-item"><a href="/join">회원가입</a></li>
	   	</ul>
	  	</div>
		</div>

</div>
</c:if>

<c:if test="${not empty login }">
<div class="header-container">
	<div class="header-wrapper">
	<a href="#"><img alt="메인로고" src="/resources/image/brand.gif" id="logo"></a>
	</div>								

		<div class="category-background">
	  	<div class="category-list">
	  	 <ul>
		   	<li class="cate-list-item"><a href="#">추천보기</a></li>
		   	<li class="cate-list-item"><a href="/eval">평점보기</a></li>
		   	<li class="cate-list-item"><a href="#">공지사항</a></li>
		   	<li class="cate-list-item"><a href="/view/posts">자유게시판</a></li>
		   	<li class="cate-list-item"><a href="/editProfile">마이페이지</a></li>
		   	<li class="cate-list-item"><a href="/logout">로그아웃</a></li>
	   	</ul>
	  	</div>
		</div>

</div>
</c:if>



