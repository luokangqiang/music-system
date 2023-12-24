package top.stu.musicsystem.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.stu.musicsystem.service.RecordDownloadService;
import top.stu.musicsystem.utils.Request;
import top.stu.musicsystem.dao.RecordDownloadDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.DownloadRecord;
import top.stu.musicsystem.model.User;

@Service("recordDownloadService")
public class RecordDownloadServiceImpl implements RecordDownloadService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RecordDownloadDao recordDownloadDao;

	public void recordDownload(HttpServletRequest request, int songId) {
		User user= Request.getUserFromHttpServletRequest(request);
		if(user==null) {
			return;
		}
		//记录当前用户的下载记录
		user=userDao.selectByUser(user);
		recordDownloadDao.insert(new DownloadRecord(user.getUserId(),songId));
	}

	public List<DownloadRecord> getAllRecords() {
		return recordDownloadDao.selectAll();
	}

}
