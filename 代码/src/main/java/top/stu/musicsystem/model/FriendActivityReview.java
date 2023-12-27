package top.stu.musicsystem.model;

public class FriendActivityReview {
    /* 后端用
     * friendActivityReviewId           好友动态评论的id，用于数据库相关。
     * friendActivityId:                好友动态的id，用于数据库相关
     * userId:                          用户的id，用于数据库相关
     *
     */
    private int friendActivityReviewId;
    private int friendActivityId;
    private int userId;


    /* 前端用
     * userName:          评论的用户名
     * reviewTime:        评论的时间
     * content:           评论的文本
     * whetherLiked:      点赞icon是否显示为红色
     * likeCoefficient:   点赞icon旁显示点赞数量
     * isPopular:         它是否是精彩评论
     *
     * 用法：例如，在看某一条好友动态中，点击“展开评论”的功能后，
     * 后端会返回一个 List<FriendActivityReview> 的列表给前端，前端就可以按列表的类及其中的成员变量来铺“因为点击而展开的评论”。列表项的顺序（默认）将按‘评论时间'从新到旧排序。
     */

    private String userName;
    private String content;
    private String reviewTime;
    private boolean whetherLiked;
    private int likeCoefficient;
    private String userAvatarPath;
    private boolean isPopular;

    /*
     * 然后是类的 Getters and Setters
     */

    public int getFriendActivityReviewId() {
        return friendActivityReviewId;
    }

    public void setFriendActivityReviewId(int friendActivityReviewId) {
        this.friendActivityReviewId = friendActivityReviewId;
    }
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public boolean isWhetherLiked() {
        return whetherLiked;
    }

    public void setWhetherLiked(boolean whetherLiked) {
        this.whetherLiked = whetherLiked;
    }

    public int getLikeCoefficient() {
        return likeCoefficient;
    }

    public void setLikeCoefficient(int likeCoefficient) {
        this.likeCoefficient = likeCoefficient;
    }

    public String getUserAvatarPath() {
        return userAvatarPath;
    }

    public void setUserAvatarPath(String userAvatarPath) {
        this.userAvatarPath = userAvatarPath;
    }

    public boolean isPopular() { return isPopular; }

    public void setPopular(boolean popular) { isPopular = popular; }
}
