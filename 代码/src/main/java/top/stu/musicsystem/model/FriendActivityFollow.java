package top.stu.musicsystem.model;

public class FriendActivityFollow {

    /* 后端用
     * FriendActivityFollowId:               这条好友关注记录的id，用于数据库相关
     * followerUserId:                       用户的id，用于数据库相关
     * followeeUserId:                       被Follow用户的id，用于数据库相关
     */
    private int FriendActivityFollowId;
    private int followerUserId;
    private int followeeUserId;


    /* 前端用
     * 无。
     * 这是一个描述关系的类，没有前端需要显示的内容。
     */

    /*
     * 然后是类的构造函数
     */
    public FriendActivityFollow() { }

    public FriendActivityFollow(int followerUserId, int followeeUserId) {
        this.followerUserId = followerUserId;
        this.followeeUserId = followeeUserId;
    }

    /*
     * 然后是类的 Getters and Setters
     */
    public int getFriendActivityFollowId() {
        return FriendActivityFollowId;
    }

    public void setFriendActivityFollowId(int friendActivityFollowId) {
        FriendActivityFollowId = friendActivityFollowId;
    }

    public int getFollowerUserId() {
        return followerUserId;
    }

    public void setFollowerUserId(int followerUserId) {
        this.followerUserId = followerUserId;
    }

    public int getFolloweeUserId() {
        return followeeUserId;
    }

    public void setFolloweeUserId(int followeeUserId) {
        this.followeeUserId = followeeUserId;
    }

}
