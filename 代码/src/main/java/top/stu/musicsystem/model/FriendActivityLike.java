package top.stu.musicsystem.model;

public class FriendActivityLike {
    /* 后端用
     * likeId:                   这条点赞记录的id，用于数据库相关
     * userId:                   用户的id (点赞的人)，用于数据库相关
     * friendActivityReviewId:   好友动态的id (被这条点赞记录点赞的)，用户数据库相关
     */
    private int friendActivityLikeId;
    private int userId;
    private int friendActivityId;


    /* 前端用
     * 无。
     * 这是一个描述关系的类，没有前端需要显示的内容。
     */


    /*
     * 然后是类的构造函数
     */
    public FriendActivityLike() { }
    public FriendActivityLike(int userId, int friendActivityId) {
        this.userId = userId;
        this.friendActivityId = friendActivityId;
    }


    /*
     * 然后是类的 Getters and Setters
     */
    public int getFriendActivityLikeId() {
        return friendActivityLikeId;
    }

    public void setFriendActivityLikeId(int friendActivityLikeId) {
        this.friendActivityLikeId = friendActivityLikeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFriendActivityId() {
        return friendActivityId;
    }

    public void setFriendActivityId(int friendActivityId) { this.friendActivityId = friendActivityId; }
}
