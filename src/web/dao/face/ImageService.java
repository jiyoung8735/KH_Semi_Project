package web.dao.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Image;

public interface ImageService {

	Image info(HttpServletRequest req , int menunoByImage);

}
