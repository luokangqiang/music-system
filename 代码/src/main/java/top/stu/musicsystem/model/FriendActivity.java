package top.stu.musicsystem.model;

import java.util.List;

public class FriendActivity {
    /* 后端用
     * friendActivityId:  好友动态的id，用于数据库相关
     * userId:            用户的id，用于数据库相关
     * songId:            歌曲的id，用于数据库相关
     * songId:            歌曲的id(动态允许附着歌曲)，用于数据库相关
     */
    private int friendActivityId;
    private int userId;
    private int songId;


    /* 前端用
     * userName:            动态发布的用户名
     * reviewTime:          动态发布的时间
     * content:             动态的内容
     * songName:            动态附着的歌曲的名字
     * whetherLiked:        点赞icon是否显示为红色
     * likeCoefficient:     点赞icon旁显示点赞数量
     * userAvatarPath:      用户头像的路径（空的话前端会使用默认的用户头像）
     * songCoverPath:       歌曲封面的路径（空的话前端会使用默认的专辑封面）
     * reviews:             动态的评论
     * popularReviews:      动态的热门评论（点赞数量大于阈值（暂定为3））
     *
     * 用法：例如，在点击导航栏的好友空间按钮后
     * 后端会返回一个 List<FriendActivity> 的列表给前端，前端可以按列表的类及其中的成员变量来铺好友空间的页面，好友页面的主内容就是一个个FriendActivitity框。列表项的顺序（默认）将按‘评论时间'从新到旧排序。
     */
    private String userName;
    private String reviewTime;
    private String content;
    private String songName;
    private boolean whetherLiked;
    private int likeCoefficient;
    private String userAvatarPath;
    private String songCoverPath;
    private List<FriendActivityReview> reviews;
    private List<FriendActivityReview> popularReviews;
    /*
     * 然后是类的 Getters and Setters
     */
    public int getFriendActivityId() {
        return friendActivityId;
    }

    public void setFriendActivityId(int friendActivityId) {
        this.friendActivityId = friendActivityId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(String reviewTime) {
        this.reviewTime = reviewTime;
    }

    public int getLikeCoefficient() {
        return likeCoefficient;
    }

    public void setLikeCoefficient(int likeCoefficient) {
        this.likeCoefficient = likeCoefficient;
    }

    public String getUserName() { return userName; }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public boolean isWhetherLiked() {
        return whetherLiked;
    }

    public void setWhetherLiked(boolean whetherLiked) { this.whetherLiked = whetherLiked; }

    public String getUserAvatarPath() {
        return userAvatarPath;
    }

    public void setUserAvatarPath(String userAvatarPath) {
        this.userAvatarPath = userAvatarPath;
    }

    public String getSongCoverPath() {
        return songCoverPath;
    }

    public void setSongCoverPath(String songCoverPath) {
        this.songCoverPath = songCoverPath;
    }

    public List<FriendActivityReview> getReviews() {
        return reviews;
    }

    public void setReviews(List<FriendActivityReview> reviews) {
        this.reviews = reviews;
    }

    public List<FriendActivityReview> getPopularReviews() {
        return popularReviews;
    }

    public void setPopularReviews(List<FriendActivityReview> popularReviews) {
        this.popularReviews = popularReviews;
    }

}
