package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Fran;
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
	 * 일반인 회원가입 
	 * 
	 * @param req
	 * @return int
	 */
	int joinUser(HttpServletRequest req);
	
	/**
	 * 프랜차이즈 회원가입
	 * 
	 * @param req
	 * @return int
	 */
	int joinFran(HttpServletRequest req);
	
	/**
	 * 프랜차이즈관리자 회원가입 key 인증
	 * 
	 * @param req
	 * @return boolean
	 */
	boolean keyVerify(HttpServletRequest req);
	

}
