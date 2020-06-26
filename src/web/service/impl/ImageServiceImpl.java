package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.ImageDao;
import web.dao.impl.ImageDaoImpl;
import web.dto.Image;
import web.service.face.ImageService;

public class ImageServiceImpl implements ImageService{

	ImageDao imageDao = new ImageDaoImpl();
	
	@Override
	public Image info(HttpServletRequest req , int menunoByImage) {
		
		return imageDao.selectImage(menunoByImage);
	}

	@Override
	public List<Image> getAllImage() {
		return imageDao.selectImage();
	}

	@Override
	public Image getImageByMenuno(int foodByMenuNo) {
		return imageDao.selectImageByMenuno(foodByMenuNo);
	}

}
