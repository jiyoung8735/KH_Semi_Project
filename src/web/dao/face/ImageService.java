package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Image;

public interface ImageService {

	Image info(HttpServletRequest req , int menunoByImage);

	List<Image> getAllImage();

}
