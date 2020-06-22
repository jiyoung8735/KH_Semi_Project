package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface UserService {
	
	/**
	 * 로그인 정보 얻기
	 * 
	 * @param req
	 * @return User객체
	 */
	User getLoginUser(HttpServletRequest req);
	
	/**
	 * 로그인 인증
	 * 
	 * @param user
	 * @return boolean
	 */
	boolean login(User user);
	
	/**
	 * 회원정보 얻기
	 * 
	 * @param user
	 * @return User객체
	 */
	User info(User user);
	
	/**
	 * 아이디 중복확인
	 * 
	 * @param req
	 * @return User객체
	 */
	User doublecheckId(HttpServletRequest req);
	
	/**
	 * 회원가입 
	 * 
	 * @param req
	 * @return int
	 */
	int join(HttpServletRequest req);
	

}
