package top.stu.musicsystem.model;

public class FriendActivityReviewLike {
    /* 后端用
     * friendActivityReviewLikeId:       这条点赞记录的id，用于数据库相关
     * userId:                           用户的id (点赞的人)，用于数据库相关
     * friendActivityReviewId:           好友动态的id (被这条点赞记录点赞的)，用户数据库相关
     */
    private int friendActivityReviewLikeId;
    private int userId;
    private int friendActivityReviewId;

    /* 前端用
     * 无。
     * 这是一个描述关系的类，没有前端需要显示的内容。
     */

    /*
     * 然后是类的构造函数
     */
    public FriendActivityReviewLike() {}

    public FriendActivityReviewLike(int userId, int friendActivityReviewId) {
        this.userId = userId;
        this.friendActivityReviewId = friendActivityReviewId;
    }

    /*
     * 然后是类的 Getters and Setters
     */

    public int getFriendActivityReviewLikeId() {
        return friendActivityReviewLikeId;
    }

    public void setFriendActivityReviewLikeId(int friendActivityReviewLikeId) {
        this.friendActivityReviewLikeId = friendActivityReviewLikeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFriendActivityReviewId() {
        return friendActivityReviewId;
    }

    public void setFriendActivityReviewId(int friendActivityReviewId) {
        this.friendActivityReviewId = friendActivityReviewId;
    }


}
