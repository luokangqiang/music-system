package top.stu.musicsystem.dao;

import java.util.List;

import top.stu.musicsystem.model.DownloadRecord;

public interface RecordDownloadDao {

	/**
	 * 添加新下载记录
	 * @param downloadRecord
	 */
	void insert(DownloadRecord downloadRecord);

	/**
	 * 获取所有用户的下载记录
	 * @return
	 */
	List<DownloadRecord> selectAll();

}
