<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<c:import url="/WEB-INF/views/mypage/profile.jsp"></c:import>
	
			<div class="mywork_container">
			<h1>${username } 님 </h1>
			<hr>
			<div class="mywork_preview_container">
				<div>
					<h3>방문 횟수</h3>
					<h1>${users_cnt }</h1>
				</div>
				<div>
					<h3>별점 작성</h3>
					<h1>${cntstar }</h1>
				</div>
				<div>
					<h3>리뷰 작성</h3>
					<h1>${cntreview }</h1>
				</div>
				<div>
					<h3>신고 내역</h3>
					<h1>${cntreport }</h1>
				</div>
			</div>
			</div>
			
</section>	