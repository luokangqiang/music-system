package top.stu.musicsystem.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.stu.musicsystem.service.NewTrackOnShelfService;
import top.stu.musicsystem.utils.Request;
import top.stu.musicsystem.dao.NewTrackOnShelfDao;
import top.stu.musicsystem.dao.TrendingRecDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.Collection;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.model.User;

@Service("newTrackOnShelfService")
public class NewTrackOnShelfServiceImpl implements NewTrackOnShelfService {
	@Autowired
	private NewTrackOnShelfDao newTrackOnShelfDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;

	public List<Song> getNewTrackWithCollectionFlag(HttpServletRequest request) {
		List<Song> newTackOnShelfList = new ArrayList<Song>();
		List<Collection> collectionList = new ArrayList<Collection>();
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList=trendingRecDao.getCollection(user);
		newTackOnShelfList=newTrackOnShelfDao.selecNewSong();
		//在新碟上架列表中给已经被该用户收藏的歌曲加上标记
		if(collectionList!=null && newTackOnShelfList!=null) {
			for(Collection c:collectionList) {
				for(Song t:newTackOnShelfList) {
					if(c.getSongId()==t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return newTackOnShelfList;
	}

}
