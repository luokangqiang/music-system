package top.stu.musicsystem.dao;

import java.util.List;

import top.stu.musicsystem.model.Collection;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.model.User;

public interface TrendingRecDao {

	/**
	 * 获取热门音乐推荐列表
	 * @return
	 * 若曲库中没有任何歌曲，则返回null
	 */
	List<Song> getTrendingSong();

	/**
	 * 获取当前用户的收藏列表
	 * @param user
	 * 当前用户
	 * @return
	 * 若该用户没有任何收藏，则返回null
	 */
	List<Collection> getCollection(User user);

}
