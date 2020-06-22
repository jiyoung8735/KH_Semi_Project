package web.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import web.dao.face.UserDao;
import web.dao.impl.UserDaoImpl;
import web.dto.User;
import web.service.face.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao = new UserDaoImpl();
	
	@Override
	public User getLoginUser(HttpServletRequest req) {
		
		User user = new User();
		user.setUserId(req.getParameter("id"));
		user.setUserPw(req.getParameter("pw"));
		
		return user;
	}

	@Override
	public boolean login(User user) {
		
		int cnt = userDao.selectUserCntByIdPw(user);
		
		if(cnt>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public User info(User user) {
		
		return userDao.selectUserByUserid(user);
	}

	@Override
	public User doublecheckId(HttpServletRequest req) {
		
		User user = new User();
		user.setUserId( req.getParameter("id") );
		User result = userDao.selectUserByUserid(user);
		
		System.out.println("UserService : " + result);
		
		return result;
	}

	@Override
	public int join(HttpServletRequest req) {

		User user = new User();

		//생년월일
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		Date birth = Date.valueOf(year+month+date);
		
		//전화번호
		String tel = req.getParameter("tel_01") + req.getParameter("tel_02") + req.getParameter("tel_03");
		int telphone = Integer.parseInt(tel);
		
		//사용자권한
		//프랜차이즈 인증
		int userAuth = 1;
		
		//관심프랜차이즈
		int franno = 0;
		if( req.getParameter("franName")!=null || req.getParameter("franName")!="" ) {
			//프랜차이즈번호가져오기
		}else {
			franno = 0;
		}
		
		user.setUserId( req.getParameter("id") );
		user.setUserPw( req.getParameter("pw") );
		user.setUserName( req.getParameter("name") );
		user.setUserNick( req.getParameter("nick") );
		user.setUserBirth( birth );
		user.setUserGender( req.getParameter("gender") );
		user.setUserEmail( req.getParameter("email") );
		user.setUserTel( telphone );
		user.setUserAuth( userAuth );
		user.setFranNo( franno );
		
		int result = userDao.insert(user);
		
		return result;
	}


}
