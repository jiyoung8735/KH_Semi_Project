package web.dao.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.User;

public interface UserDao {
	
	
	/**
	 * ID&PW 일치하는 회원수 조회(로그인)
	 * 
	 * @param user
	 * @return int
	 */
	int selectUserCntByIdPw(User user);
	
	/**
	 * ID로 회원 조회
	 * 
	 * @param user
	 * @return User객체
	 */
	User selectUserByUserid(User user);
	
	/**
	 * 회원 가입
	 * 
	 * @param user
	 * @return int
	 */
	int insert(User user);
	

}
