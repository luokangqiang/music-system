package top.stu.musicsystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.stu.musicsystem.dao.MyFriendActivityDao;
import top.stu.musicsystem.dao.UserDao;
import top.stu.musicsystem.model.*;
import top.stu.musicsystem.service.MyFriendActivityService;
import top.stu.musicsystem.utils.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service("myFriendActivityService")
public class MyFriendActivityServiceImpl implements MyFriendActivityService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private MyFriendActivityDao myFriendActivityDao;

    public Map<String, String> parseJsonStr(String jsonStr) {
        int contentStart = jsonStr.indexOf('{'), contentEnd = jsonStr.lastIndexOf('}');
        jsonStr = jsonStr.substring(contentStart+1, contentEnd);
        Map<String, String> jsonObject = new HashMap<String, String>();
        for (String attrKeyValuePair : jsonStr.split(",")) {
            int colonSymbolPostion = attrKeyValuePair.indexOf(':'); // colon: 冒号
            String key = attrKeyValuePair.substring(1, colonSymbolPostion-1);
            String value = attrKeyValuePair.substring(colonSymbolPostion+2, attrKeyValuePair.length()-1);
            jsonObject.put(key, value);
        }
        return jsonObject;
    }


    public String[] parseActivityContent(String content) {
        String attachSongName = null;
        int addrSymbolPosition = content.indexOf('@');

        if (addrSymbolPosition != -1) {
            int end = content.indexOf("\\n", addrSymbolPosition);
            int spacePostion = content.indexOf(" ", addrSymbolPosition);
            boolean isNlSymbol = false;
            if (spacePostion != -1 && (end == -1 || spacePostion < end)) {
                isNlSymbol = true;
                end = spacePostion;
            }
            if (end == -1) {
                attachSongName = content.substring(addrSymbolPosition + 1);
                content = content.substring(0, addrSymbolPosition);
            } else {
                attachSongName = content.substring(addrSymbolPosition + 1, end);
                content = content.substring(0, addrSymbolPosition) + content.substring(end + (isNlSymbol ? 2 : 1));
            }
        }

        return new String[] { (attachSongName != null) ? attachSongName : "", content };
    }



    public String toggleLikeStatusOfFriendActivity(HttpServletRequest request, int friendActivityId) {
        User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
        boolean yes = myFriendActivityDao.countUserLikeThisFriendActivity(new FriendActivityLike(user.getUserId(), friendActivityId)) > 0;
        if (yes) {
            // 已点赞，取消点赞
            myFriendActivityDao.deleteFriendActivityLike(new FriendActivityLike(user.getUserId(), friendActivityId));
        } else {
            // 点赞
            myFriendActivityDao.insertFriendActivityLike(new FriendActivityLike(user.getUserId(), friendActivityId));
        }
        String result = String.valueOf(myFriendActivityDao.countLikeCoefficientOfThisFriendActivity(friendActivityId));
        return result;
    }


    public String toggleLikeStatusOfFriendActivityReview(HttpServletRequest request, int friendActivityReviewId) {
        User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
        boolean yes = myFriendActivityDao.countUserLikeThisFriendActivityReview(new FriendActivityReviewLike(user.getUserId(), friendActivityReviewId)) > 0;
        if (yes) {
            // 已点赞，取消点赞
            myFriendActivityDao.deleteFriendActivityReviewLike(new FriendActivityReviewLike(user.getUserId(), friendActivityReviewId));
        } else {
            // 点赞
            myFriendActivityDao.insertFriendActivityReviewLike(new FriendActivityReviewLike(user.getUserId(), friendActivityReviewId));
        }
        // 查一遍点赞数返回（虽然查询结果是整数，转成 String 返回是用来传输。）
        String result = String.valueOf(myFriendActivityDao.countLikeCoefficientOfThisFriendActivityReview(friendActivityReviewId));
        return result;
    }


    public boolean insertFriendActivity(HttpServletRequest request, String songName, String userComment) {
        // 新建一条动态
        FriendActivity fa = new FriendActivity();
        if (songName != null) {
            List<Song> songList = myFriendActivityDao.selectSongBySongName(songName);
            if (songList.isEmpty()) return false;
            fa.setSongId(songList.get(0).getSongId());
            fa.setSongName(songName);
            fa.setSongCoverPath(songList.get(0).getSongCoverAddress());
        }
        User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
        fa.setUserId(user.getUserId());
        fa.setUserName(user.getUserName());
        fa.setContent(userComment);
        myFriendActivityDao.insertFriendActivity(fa);
        return true;
    }


    public boolean insertFriendActivityReview(HttpServletRequest request, String userComment, int friendActivityId) {
        // 新建一条动态的评论
        FriendActivityReview far = new FriendActivityReview();
        far.setFriendActivityId(friendActivityId);
        User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
        far.setUserId(user.getUserId());
        far.setUserName(user.getUserName());
        far.setContent(userComment);
        myFriendActivityDao.insertFriendActivityReview(far);
        return true;
    }



    public List<FriendActivity> getMyFriendsActivities(HttpServletRequest request) {
        User user = userDao.selectByUser(Request.getUserFromHttpServletRequest(request));
        // 获取好友动态列表
        List<FriendActivity> myFriendActivities = myFriendActivityDao.selectMyFriendActivities(user.getUserId());

        // 按动态发布时间给动态排序
        Collections.sort(myFriendActivities, new Comparator<FriendActivity>() {
            public int compare(FriendActivity a, FriendActivity b) {
                return a.getReviewTime().compareTo(b.getReviewTime());
            }
        });

        // 遍历 myFriendActivities 给每一条动态赋初值
        for (FriendActivity friendActivity : myFriendActivities) {
            // 赋初值 whetherLiked
            friendActivity.setWhetherLiked(myFriendActivityDao.countUserLikeThisFriendActivity(new FriendActivityLike(user.getUserId(), friendActivity.getFriendActivityId())) > 0);

            // 赋初值 likeCoefficient
            friendActivity.setLikeCoefficient(myFriendActivityDao.countLikeCoefficientOfThisFriendActivity(friendActivity.getFriendActivityId()));

            // 赋初值 userAvatarPath
            friendActivity.setUserAvatarPath(myFriendActivityDao.getUserAvatarPath(friendActivity.getUserId()));

            // 赋初值 SongCoverPath
            friendActivity.setSongCoverPath(myFriendActivityDao.getSongCoverPath(friendActivity.getSongId()));


            // 赋初值 reviews
            List<FriendActivityReview> reviews = myFriendActivityDao.selectReviewsOfThisFriendActivity(friendActivity.getFriendActivityId());
            {
                // 遍历 reviews 给每一条评论赋初值
                for (FriendActivityReview friendActivityReview : reviews) {
                    // 赋初值 friendActivityReview 的 whetherLiked
                    friendActivityReview.setWhetherLiked(myFriendActivityDao.countUserLikeThisFriendActivityReview(new FriendActivityReviewLike(user.getUserId(), friendActivityReview.getFriendActivityReviewId())) > 0);

                    // 赋初值 friendActivityReview 的 likeCoefficient
                    friendActivityReview.setLikeCoefficient(myFriendActivityDao.countLikeCoefficientOfThisFriendActivityReview(friendActivityReview.getFriendActivityReviewId()));

                    // 赋初值 friendActivityReview 的 userAvatarPath
                    friendActivityReview.setUserAvatarPath(myFriendActivityDao.getUserAvatarPath(friendActivityReview.getUserId()));

                }
            }
            // 按评论发布时间给评论排序
            Collections.sort(reviews, new Comparator<FriendActivityReview>() {
                public int compare(FriendActivityReview a, FriendActivityReview b) {
                    return a.getReviewTime().compareTo(b.getReviewTime());
                }
            });
            friendActivity.setReviews(reviews);

            // 赋初值 popularReviews
            List<FriendActivityReview> popularReviews = new ArrayList<FriendActivityReview>();
            for (FriendActivityReview friendActivityReview : reviews) {
                if (friendActivityReview.getLikeCoefficient() >= 3) {
                    friendActivityReview.setPopular(true);
                    popularReviews.add(friendActivityReview);
                } else
                    friendActivityReview.setPopular(false);
            }
            // 点赞大于等于三的评论中再按点赞数降序排个序
            Collections.sort(popularReviews, new Comparator<FriendActivityReview>() {
                public int compare(FriendActivityReview a, FriendActivityReview b) {
                    return b.getLikeCoefficient() - a.getLikeCoefficient();
                }
            });
            friendActivity.setPopularReviews(popularReviews);
        }
        return myFriendActivities;
    }
}