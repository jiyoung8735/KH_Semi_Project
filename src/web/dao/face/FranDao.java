package web.dao.face;

import web.dto.Fran;

public interface FranDao {

	/**
	 * 로그인된 회원의 프랜넘버로 프랜객체가져오기
	 * @param franNo
	 * @return
	 */
	Fran selectGetFran(int franNo);

	
}
