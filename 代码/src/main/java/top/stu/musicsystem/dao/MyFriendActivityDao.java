package top.stu.musicsystem.dao;

import top.stu.musicsystem.model.*;

import java.util.List;
import java.util.Map;

public interface MyFriendActivityDao {
    /**
     * 查询当前用户follow的好友post的全部的动态。
     * @param userId
     * @return
     */
    List<FriendActivity> selectMyFriendActivities(int userId);

    /**
     * 查询当前动态的所有评论。
     * @param friendActivityId
     * @return
     */
    List<FriendActivityReview> selectReviewsOfThisFriendActivity(int friendActivityId);



    String getUserAvatarPath(int userId);


    String getSongCoverPath(int songId);


    int countUserLikeThisFriendActivityReview(FriendActivityReviewLike farl);


    int countLikeCoefficientOfThisFriendActivityReview(int friendActivityReviewId);


    List<Song> selectSongBySongName(String songName);


    void insertFriendActivity(FriendActivity fa);

    void insertFriendActivityReview(FriendActivityReview far);

    void insertFriendActivityReviewLike(FriendActivityReviewLike farl);

    void deleteFriendActivityReviewLike(FriendActivityReviewLike farl);

    int countUserLikeThisFriendActivity(FriendActivityLike fal);


    int countLikeCoefficientOfThisFriendActivity(int friendActivityId);

    void insertFriendActivityLike(FriendActivityLike fal);

    void deleteFriendActivityLike(FriendActivityLike fal);


}

