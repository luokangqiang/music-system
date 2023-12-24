package top.stu.musicsystem.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.stu.musicsystem.service.RecordPlayService;
import top.stu.musicsystem.utils.Request;
import top.stu.musicsystem.dao.RecordPlayDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.PlayRecord;
import top.stu.musicsystem.model.User;

@Service("recordPlayService")
public class RecordPlayServiceImpl implements RecordPlayService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RecordPlayDao recordPlayDao;
	

	public void recordPlay(HttpServletRequest request, int songId) {
		User user=userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
		recordPlayDao.insert(new PlayRecord(user.getUserId(),songId));
		
	}


	public List<PlayRecord> getAllRecords() {
		return recordPlayDao.selectAll();
	}
	

}
