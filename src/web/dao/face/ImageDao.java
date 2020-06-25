package web.dao.face;

import java.util.List;

import web.dto.Image;

public interface ImageDao {

	public void insertImage(Image imageFile);

	public Image selectImage(int menunoByImage);

	/**
	 * 전체 이미지 객체 가져오기
	 * @return
	 */
	public List<Image> selectImage();

}
