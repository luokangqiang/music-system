package top.stu.musicsystem.dao;

import java.util.List;

import top.stu.musicsystem.model.Song;

public interface NewTrackOnShelfDao {

	/**
	 * 查询当前新歌曲
	 * @return
	 * 若没有新歌曲，则返回null
	 */
	List<Song> selecNewSong();

}
