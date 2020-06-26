package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Image;

public interface ImageService {

	Image info(HttpServletRequest req , int menunoByImage);

	List<Image> getAllImage();

	/**
	 * 메뉴넘버로 메뉴정보 전체 가져오기
	 * @param foodByMenuNo
	 * @return
	 */
	Image getImageByMenuno(int foodByMenuNo);

}
