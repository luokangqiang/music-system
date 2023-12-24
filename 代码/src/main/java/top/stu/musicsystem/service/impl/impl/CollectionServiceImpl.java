package top.stu.musicsystem.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.stu.musicsystem.service.CollectionService;
import top.stu.musicsystem.utils.Request;
import top.stu.musicsystem.dao.CollectionDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.Collection;
import top.stu.musicsystem.model.User;

@Service("collectionService")
public class CollectionServiceImpl implements CollectionService {
	@Autowired
	private CollectionDao collectionDao;
	@Autowired
	private UserDao userDao;

	public boolean collectionChange(HttpServletRequest request, int songId) {
		boolean isCurCollected=true;
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		Collection collection=collectionDao.selectByCollection(new Collection(user.getUserId(),songId));
		if(collection==null) {
			//该歌曲没有被收藏
			isCurCollected=false;
			//添加收藏
			collectionDao.insert(new Collection(user.getUserId(),songId));
		}else {
			//已经被收藏，则取消收藏
			collectionDao.deleteById(collection.getCollectionId());
		}
		//返回改变后的收藏状态
		return !isCurCollected;
	}

	public List<Collection> getAllRecords() {
		return collectionDao.selectAll();
	}

}
