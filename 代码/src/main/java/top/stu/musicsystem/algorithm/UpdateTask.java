package top.stu.musicsystem.algorithm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import top.stu.musicsystem.service.CollectionService;
import top.stu.musicsystem.service.PersonalRecService;
import top.stu.musicsystem.service.RecordDownloadService;
import top.stu.musicsystem.service.RecordPlayService;
import top.stu.musicsystem.model.Collection;
import top.stu.musicsystem.model.DownloadRecord;
import top.stu.musicsystem.model.PlayRecord;
import top.stu.musicsystem.service.SongService;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.Static;

@Component
public class UpdateTask extends TimerTask{
	@Autowired
	private PersonalRecService personalRecService;
	@Autowired
	private RecordDownloadService recordDownloadService;
	@Autowired
	private RecordPlayService recordPlayService;
	@Autowired
	private CollectionService collectionService;
	@Autowired
	private UserService userService;
	@Autowired
	private SongService songService;
	

	@Override
	public void run() {
		System.out.println("------------开始执行任务-------------");
		
		try {
			//等待10s再开始执行任务
			TimeUnit.SECONDS.sleep(10);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		userService.getAllRecords();
		//更换推荐列表
		Static.isFromA=!Static.isFromA;
		//用户-歌曲 推荐列表
		Map<Integer,Integer[]> user2songRecMatrix=new HashMap<Integer, Integer[]>();
		//获取用户的下载记录
		List<DownloadRecord> downloadList=recordDownloadService.getAllRecords();
		//获取用户的播放记录
		List<PlayRecord> playList=recordPlayService.getAllRecords();
		//获取用户的收藏记录
		List<Collection> collectionList=collectionService.getAllRecords();
		//获取用户
		List<Integer> userIdList=userService.getAllUserIdRecords();
		//获取歌曲
		List<Integer> songIdList=songService.getAllSongIdRecords();
		//用户-歌曲 “评分”矩阵
		Map<Integer, float[]> user2songRatingMatrix=DataTranslate.getFrequencyMatrix(userIdList,songIdList,
				downloadList,playList,collectionList);
		//用户相似性计算，获取用户的k个近邻用户
		Map<Integer,Integer[]> userKNNMatrix=UserKNN.getKNN(userIdList,user2songRatingMatrix,Static.K);
		//基于用户相似性的协同过滤
		user2songRecMatrix=CollaborativeFiltering.userKNNBasedCF(userIdList,userKNNMatrix,
				user2songRatingMatrix,songIdList,Static.N);
		System.out.println("------------执行任务完成-------------");
		if(Static.isFromA) {
			//向B中更新写数据
			personalRecService.updatePersonalRecIntoB(user2songRecMatrix);
		}else {
			//向A中更新写数据
			personalRecService.updatePersonalRecIntoA(user2songRecMatrix);
		}
	}

}
