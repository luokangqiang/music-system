package top.stu.musicsystem.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.stu.musicsystem.service.RankingPageService;
import top.stu.musicsystem.utils.Request;
import top.stu.musicsystem.dao.RankingPageDao;
import top.stu.musicsystem.dao.TrendingRecDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.Collection;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.model.User;

@Service("rankingPageService")
public class RankingPageServiceImpl implements RankingPageService {
	@Autowired
	private RankingPageDao rankingPageDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TrendingRecDao trendingRecDao;
	
	
	public List<Song> getRankWithCollectionFlag(HttpServletRequest request, int mode) {
		List<Song> rankingPageList = new ArrayList<Song>();
		List<Collection> collectionList = new ArrayList<Collection>();
		User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		collectionList = trendingRecDao.getCollection(user);
		if(mode==1) {
			rankingPageList=rankingPageDao.selectRecentWeekRanking();
		}else if(mode==2){
			rankingPageList=rankingPageDao.selectRecentMonthRanking();
		}else {
			//保留便于扩展
			rankingPageList=rankingPageDao.selectRecentMonthRanking();
		}
		
		// 在个性化列表中给已经被该用户收藏的歌曲加上标记
		if (collectionList != null && rankingPageList != null) {
			for (Collection c : collectionList) {
				for (Song t : rankingPageList) {
					if (c.getSongId() == t.getSongId()) {
						t.setWhetherCollected(true);
					}
				}
			}
		}
		return rankingPageList;
	}
	
	

}
