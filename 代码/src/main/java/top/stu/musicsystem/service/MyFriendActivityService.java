package top.stu.musicsystem.service;

import top.stu.musicsystem.model.FriendActivity;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface MyFriendActivityService {

    Map<String, String> parseJsonStr(String jsonStr);
    String[] parseActivityContent(String content);
    /**
     * 获取当前用户follow的好友post的全部的动态。
     * @param request
     * @return
     */
    List<FriendActivity> getMyFriendsActivities(HttpServletRequest request);

    boolean insertFriendActivity(HttpServletRequest request, String songName, String userComment);

    boolean insertFriendActivityReview(HttpServletRequest request, String userComment, int friendActivityId);

    String toggleLikeStatusOfFriendActivityReview(HttpServletRequest request, int friendActivityReviewId);

    String toggleLikeStatusOfFriendActivity(HttpServletRequest request, int friendActivityId);
}
