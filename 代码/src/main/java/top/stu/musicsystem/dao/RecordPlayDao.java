package top.stu.musicsystem.dao;

import java.util.List;

import top.stu.musicsystem.model.PlayRecord;

public interface RecordPlayDao {

	/***
	 * 添加新的播放记录
	 * @param playRecord
	 */
	void insert(PlayRecord playRecord);

	/**
	 * 查询所有用户的播放记录
	 * @return
	 */
	List<PlayRecord> selectAll();

}
