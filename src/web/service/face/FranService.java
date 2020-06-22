package web.service.face;

import web.dto.Fran;

public interface FranService {

	/**
	 * 로그인된 회원의 프랜넘버로 프랜객체가져오기
	 * @param franNo
	 * @return
	 */
	Fran getFran(int franNo);

	

	

}
